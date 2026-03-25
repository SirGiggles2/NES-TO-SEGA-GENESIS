-- zelda_intro_loop_probe.lua
-- Watches the natural intro loop: title screen → fade → intro scroll → title
-- No button injection — just observes the state machine.

local ROM_VERSION = "zelda_v578"
local MAX_FRAMES = 12000  -- ~80 NMI frames, enough for full intro cycle

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "intro_loop_" .. ROM_VERSION .. ".txt"

-- RAM addresses
local ADDR_READY        = 0xFF0011
local ADDR_SCRIPT       = 0xFF0012
local ADDR_SUBSCRIPT    = 0xFF0013
local ADDR_PPU_LOAD     = 0xFF0014
local ADDR_FRM_CNT      = 0xFF0015
local ADDR_BTN_PRESS    = 0xFF00F8
local ADDR_BTN_HOLD     = 0xFF00FA
local ADDR_RENDER_FLAG  = 0xFF0017
local ADDR_FOR_2000     = 0xFF00FF
local ADDR_FOR_2001     = 0xFF00FE
local ADDR_RAM_00F5     = 0xFF00F5
local ADDR_RAM_00F6     = 0xFF00F6
local ADDR_RAM_00E3     = 0xFF00E3
local ADDR_SCROLL_X     = 0xFF00FC
local ADDR_SCROLL_Y     = 0xFF00FD

memory.usememorydomain("M68K BUS")

os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
    print(msg)
end

local function r8(addr)
    return memory.read_u8(addr) or 0
end

log("=== INTRO LOOP PROBE: " .. ROM_VERSION .. " ===")
log("max_frames=" .. MAX_FRAMES .. " (no button injection)")
log("")

local prev_sub = -1
local prev_script = -1
local prev_ready = -1
local prev_frm = -1
local cycle_count = 0

for frame = 0, MAX_FRAMES do
    emu.frameadvance()

    local script  = r8(ADDR_SCRIPT)
    local sub     = r8(ADDR_SUBSCRIPT)
    local ready   = r8(ADDR_READY)
    local ppu     = r8(ADDR_PPU_LOAD)
    local frm     = r8(ADDR_FRM_CNT)
    local f5      = r8(ADDR_RAM_00F5)
    local f6      = r8(ADDR_RAM_00F6)
    local e3      = r8(ADDR_RAM_00E3)
    local for2001 = r8(ADDR_FOR_2001)
    local scrollx = r8(ADDR_SCROLL_X)
    local scrolly = r8(ADDR_SCROLL_Y)

    local changed = (sub ~= prev_sub) or (script ~= prev_script) or (ready ~= prev_ready)

    -- Track frm_cnt wrapping (NMI tick)
    local nmi_tick = (frm ~= prev_frm)

    -- Log on: state change, every 50th NMI tick, or periodic
    if changed or (frame % 500 == 0) then
        local line = string.format(
            "f=%05d scr=%d sub=%02d rdy=%d ppu=%02X frm=%3d F5=%02X F6=%02X e3=%02X 2001=%02X sx=%02X sy=%02X",
            frame, script, sub, ready, ppu, frm, f5, f6, e3, for2001, scrollx, scrolly
        )
        if changed then
            line = line .. " <<< CHANGED"
            if script ~= prev_script and prev_script >= 0 then
                line = line .. string.format(" (script %d->%d)", prev_script, script)
            end
            if sub < prev_sub and prev_sub > 0 and script == prev_script then
                line = line .. " !!! SUB DECREASED"
            end
        end
        log(line)

        -- Track intro cycles
        if script == 0 and prev_script ~= 0 and prev_script >= 0 then
            cycle_count = cycle_count + 1
            log("=== INTRO CYCLE " .. cycle_count .. " COMPLETE ===")
        end
    end

    prev_sub = sub
    prev_script = script
    prev_ready = ready
    prev_frm = frm

    -- Stop after 2 full cycles
    if cycle_count >= 2 then
        log("Two full intro cycles observed. Stopping.")
        break
    end
end

log("")
log("=== INTRO LOOP PROBE COMPLETE ===")
log("Total cycles observed: " .. cycle_count)
log_file:close()
client.exit()
