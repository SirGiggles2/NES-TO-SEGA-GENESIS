#!/usr/bin/env pwsh
<#
.SYNOPSIS
Run v358 with controller override Start injection to test post-title gameplay path
- Boots normally to title/guide screen
- Injects Start via joy override path ($FFEE90/$FFEE91)
- Monitors whether game advances past title into slot/file-select
- Captures comprehensive diagnostics including frame-by-frame state
.PARAMETER Rom
ROM name (default: zelda_v358)
.PARAMETER Frames
Max frames to run (default: 2000)
.PARAMETER StartFrame
Frame to begin Start injection (default: 900)
.PARAMETER HoldFrames
How many frames to hold Start active (default: 1)
#>
param(
    [string]$Rom = "zelda_v358",
    [int]$Frames = 2000,
    [int]$StartFrame = 900,
    [int]$HoldFrames = 1,
    [string]$BizHawkPath = "D:\Emulation\BizHawk-2.11-win-x64\EmuHawk.exe"
)

$RomPath = ".\build\$Rom.md"
$ReportName = "oracle_ram_start_zelda_${Rom}_f${StartFrame}_h${HoldFrames}.txt"
$ReportPath = (Join-Path (Resolve-Path ".").Path "diag\reports\$ReportName").Replace('\','/')
$LuaScript = @"
-- zelda_oracle_ram_start.lua
-- Controller-override Start injection to test post-title path

local FRAME_START_INJECT = $StartFrame  -- inject Start after guide screen stabilizes
local START_HOLD_FRAMES = $HoldFrames
local FRAME_MAX = $Frames
local ADDR_JOY_OVERRIDE = 0xFFEE90
local ADDR_JOY_ENABLE = 0xFFEE91
local BTN_START = 0x10

memory.usememorydomain("M68K BUS")

local function frame_advance()
    emu.frameadvance()
end

local function read_ram(addr)
    return memory.read_u8(addr)
end

local function write_ram(addr, val)
    memory.write_u8(addr, val)
end

local function release_input_override()
    write_ram(ADDR_JOY_OVERRIDE, 0)
    write_ram(ADDR_JOY_ENABLE, 0)
end

local function inject_start_button()
    -- Inject Start through joy override path used by active input probes
    write_ram(ADDR_JOY_OVERRIDE, BTN_START)
    write_ram(ADDR_JOY_ENABLE, 1)

    local jp = rawget(_G, "joypad")
    if type(jp) == "table" and type(jp.set) == "function" then
        pcall(jp.set, { Start = true }, 1)
        pcall(jp.set, { ["P1 Start"] = true })
    end
end

local function read_ppu_state()
    local ppuctrl_shadow = read_ram(0xFFEF00)
    local ppumask_shadow = read_ram(0xFFEF01)
    local vram_addr = read_ram(0xFFEF02) * 256 + read_ram(0xFFEF03)
    local screen_ready = read_ram(0xFFEE11)
    return {
        ppuctrl = ppuctrl_shadow,
        ppumask = ppumask_shadow,
        vram_addr = vram_addr,
        screen_ready = screen_ready
    }
end

local function read_game_state()
    local ram_script = read_ram(0xFF0012)
    local ram_subscript = read_ram(0xFF0013)
    local ram_ppu_load_index = read_ram(0xFF0014)
    local cur_save_slot = read_ram(0xFF0016)
    local frame_counter = read_ram(0xFF00FD)

    return {
        script = ram_script,
        subscript = ram_subscript,
        ppu_load_index = ram_ppu_load_index,
        cur_save_slot = cur_save_slot,
        frame = frame_counter
    }
end

local log_file = io.open("$ReportPath", "w")
local function log(msg)
    if log_file then
        log_file:write(msg .. "\n")
        log_file:flush()
    end
end

log("=== JOY OVERRIDE START INJECTION TEST ===")
log("Rom: $Rom")
log("Start injection frame: " .. FRAME_START_INJECT)
log("Start hold frames: " .. START_HOLD_FRAMES)
log("Max frames: " .. FRAME_MAX)
log("")
log("Frame | Script | Sub | PPULoad | Slot | PPUCtrl | PPUMask | VRAMAddr | Ready | Notes")
log(string.rep("-", 100))

local frame = 0
local start_injected = false
local advanced = false

while frame < FRAME_MAX do
    frame_advance()
    frame = frame + 1

    -- Inject Start button at target frame
    if frame >= FRAME_START_INJECT and frame < (FRAME_START_INJECT + START_HOLD_FRAMES) then
        if not start_injected then
            log(string.format("*** FRAME %d: INJECTED START BUTTON VIA 0xFFEE90/0xFFEE91", frame))
            log("")
            start_injected = true
        end
        inject_start_button()
    elseif start_injected and frame == (FRAME_START_INJECT + START_HOLD_FRAMES) then
        release_input_override()
    end

    local game = read_game_state()
    local ppu = read_ppu_state()

    -- Log every 10 frames or on state change
    if frame % 10 == 0 or (frame > FRAME_START_INJECT and frame < FRAME_START_INJECT + 50) then
        local notes = ""
        if frame == FRAME_START_INJECT then
            notes = "[START INJECTED]"
        elseif game.script ~= 0 and game.subscript ~= 0 then
            notes = "[GAME RUNNING]"
        elseif game.cur_save_slot > 0 then
            notes = "[SLOT SELECTED]"
        end

        log(string.format(
            "%4d | %6d | %3d | %7d | %4d | 0x%02X | 0x%02X | 0x%04X | %5d | %s",
            frame, game.script, game.subscript, game.ppu_load_index,
            game.cur_save_slot, ppu.ppuctrl, ppu.ppumask, ppu.vram_addr,
            ppu.screen_ready, notes
        ))
    end

    -- Stop if game advanced significantly
    if start_injected and frame > FRAME_START_INJECT + 100 then
        if game.script >= 1 or game.subscript >= 1 or game.cur_save_slot > 0 then
            log("")
            log("*** GAME ADVANCED PAST TITLE SCREEN ***")
            log(string.format("Final frame: %d, script=%d, subscript=%d, slot=%d",
                frame, game.script, game.subscript, game.cur_save_slot))
            advanced = true
            break
        end
    end
end

log("")
log("=== TEST COMPLETE ===")
log("Advanced: " .. tostring(advanced))
log("Final frame: " .. frame)
release_input_override()
if log_file then
    log_file:close()
end
client.exitCode = 0
client.exit()
"@

# Write Lua script
$LuaScript | Out-File -FilePath "diag\scripts\zelda_oracle_ram_start.lua" -Encoding UTF8

Write-Host "Running $Rom with joy override Start injection..."
Write-Host "Lua script written to diag\scripts\zelda_oracle_ram_start.lua"

# Run BizHawk with the Lua script
if (-not (Test-Path $BizHawkPath)) {
    $LocalBizHawkPath = ".\BizHawk\EmuHawk.exe"
    if (Test-Path $LocalBizHawkPath) {
        $BizHawkPath = $LocalBizHawkPath
    }
}

if (Test-Path $BizHawkPath) {
    $BizArgs = @(
        $RomPath,
        "--lua=diag\scripts\zelda_oracle_ram_start.lua"
    )
    & $BizHawkPath @BizArgs 2>&1 | Tee-Object -FilePath "diag\reports\oracle_bizhawk_output_ram_start.txt"
} else {
    Write-Error "BizHawk not found at $BizHawkPath (or local fallback .\\BizHawk\\EmuHawk.exe)"
    exit 1
}

Write-Host "Test complete. Check diag\reports\$ReportName"
