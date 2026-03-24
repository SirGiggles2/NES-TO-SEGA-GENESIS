-- zelda_transition_trace.lua
-- Traces the title→file-select transition with per-frame detail.
-- Injects Start press via override, then watches every frame until
-- script changes or subscript resets unexpectedly.

local ROM_VERSION = "zelda_v478"
local MAX_FRAMES = 3000
local INJECT_FRAME = 850   -- frame to inject Start press (after rdy=1 at ~751)
local INJECT_DURATION = 300 -- hold Start for many frames (NMI fires ~1/150 BizHawk frames)

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "transition_trace_" .. ROM_VERSION .. ".txt"

-- RAM addresses
local ADDR_READY        = 0xFF0011
local ADDR_SCRIPT       = 0xFF0012
local ADDR_SUBSCRIPT    = 0xFF0013
local ADDR_PPU_LOAD     = 0xFF0014
local ADDR_FRM_CNT      = 0xFF0015
local ADDR_BTN_PRESS    = 0xFF00F8
local ADDR_BTN_HOLD     = 0xFF00FA
local ADDR_JOY_DATA     = 0xFF00F0   -- READ_JOYPAD output
local ADDR_JOY_OVERRIDE = 0xFFEE90
local ADDR_JOY_ENABLE   = 0xFFEE91
local ADDR_RAM_0528     = 0xFF0528
local ADDR_RAM_00F4     = 0xFF00F4
local ADDR_RAM_00F5     = 0xFF00F5
local ADDR_RAM_00F6     = 0xFF00F6
local ADDR_RENDER_FLAG  = 0xFF0017
local ADDR_FOR_2000     = 0xFF00FF
local ADDR_FOR_2001     = 0xFF00FE
local ADDR_PAUSE_SCRIPT = 0xFF00E1
local ADDR_PAUSE_FLAG   = 0xFF00E0
local ADDR_SCR_TRANS    = 0xFF00E3
local ADDR_CRASH_MAGIC  = 0xFFEE00
local ADDR_CRASH_VECTOR = 0xFFEE02
local ADDR_CRASH_PC     = 0xFFEE04

memory.usememorydomain("M68K BUS")

os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
    print(msg)
end

local function hex(v, w)
    return string.format("%0" .. tostring(w or 2) .. "X", v or 0)
end

local function r8(addr)
    return memory.read_u8(addr) or 0
end

local function r16(addr)
    return memory.read_u16_be(addr) or 0
end

local function r32(addr)
    return memory.read_u32_be(addr) or 0
end

log("=== TRANSITION TRACE: " .. ROM_VERSION .. " ===")
log("inject_frame=" .. INJECT_FRAME .. " inject_duration=" .. INJECT_DURATION)
log("")

-- Phase tracking
local prev_sub = -1
local prev_script = -1
local prev_ready = -1
local start_injected = false
local transition_started = false
local done = false

for frame = 0, MAX_FRAMES do
    -- Inject Start press
    if frame >= INJECT_FRAME and frame < INJECT_FRAME + INJECT_DURATION then
        memory.write_u8(ADDR_JOY_ENABLE, 1)
        memory.write_u8(ADDR_JOY_OVERRIDE, 0x10)  -- NES Start = bit 4
        if not start_injected then
            log(">>> INJECTING START at frame " .. frame)
            start_injected = true
        end
    elseif frame == INJECT_FRAME + INJECT_DURATION then
        memory.write_u8(ADDR_JOY_ENABLE, 0)
        memory.write_u8(ADDR_JOY_OVERRIDE, 0)
        log(">>> RELEASED START at frame " .. frame)
    end

    emu.frameadvance()

    local script    = r8(ADDR_SCRIPT)
    local sub       = r8(ADDR_SUBSCRIPT)
    local ready     = r8(ADDR_READY)
    local btn_press = r8(ADDR_BTN_PRESS)
    local btn_hold  = r8(ADDR_BTN_HOLD)
    local joy_data  = r8(ADDR_JOY_DATA)
    local ppu_load  = r8(ADDR_PPU_LOAD)
    local ram_0528  = r8(ADDR_RAM_0528)
    local ram_00F4  = r8(ADDR_RAM_00F4)
    local ram_00F5  = r8(ADDR_RAM_00F5)
    local ram_00F6  = r8(ADDR_RAM_00F6)
    local render    = r8(ADDR_RENDER_FLAG)
    local for_2000  = r8(ADDR_FOR_2000)
    local for_2001  = r8(ADDR_FOR_2001)
    local pause_s   = r8(ADDR_PAUSE_SCRIPT)
    local pause_f   = r8(ADDR_PAUSE_FLAG)
    local scr_trans = r8(ADDR_SCR_TRANS)
    local frm_cnt   = r8(ADDR_FRM_CNT)

    local crash_magic = r16(ADDR_CRASH_MAGIC)
    local crash_vec   = r16(ADDR_CRASH_VECTOR)
    local crash_pc    = r32(ADDR_CRASH_PC)

    local changed = (sub ~= prev_sub) or (script ~= prev_script) or (ready ~= prev_ready)

    -- Always log around the injection window and any state change
    local in_window = (frame >= INJECT_FRAME - 5) and (frame <= INJECT_FRAME + 60)

    if changed or in_window or (frame % 100 == 0) or (crash_magic == 0xBEEF) then
        local line = string.format(
            "f=%04d scr=%d sub=%d rdy=%d ppu=%02X 0528=%02X F4=%02X F5=%02X F6=%02X " ..
            "joy=%02X press=%02X hold=%02X rend=%d 2000=%02X 2001=%02X pause=%d/%d trans=%d frm=%d crash=%04X/%04X/%08X",
            frame, script, sub, ready, ppu_load, ram_0528, ram_00F4, ram_00F5, ram_00F6,
            joy_data, btn_press, btn_hold, render, for_2000, for_2001, pause_s, pause_f, scr_trans, frm_cnt,
            crash_magic, crash_vec, crash_pc
        )

        if changed then
            line = line .. " <<< CHANGED"
            if sub < prev_sub and prev_sub > 0 then
                line = line .. " !!! SUB DECREASED from " .. prev_sub .. " to " .. sub
            end
            if ready == 0 and prev_ready ~= 0 and prev_ready ~= -1 then
                line = line .. " !!! READY CLEARED"
            end
        end

        log(line)
    end

    prev_sub = sub
    prev_script = script
    prev_ready = ready

    -- Detect success: script advanced to 1 (slot selection)
    if script == 1 then
        log("=== SUCCESS: script advanced to 1 (slot selection) ===")
        -- Keep logging for a few more frames
        if not done then
            done = true
        end
    end

    -- Detect failure: sub went back to 0 after being > 0
    if transition_started and sub == 0 and script == 0 and ready == 0 then
        log("=== FAILURE: subscript/ready reset to 0 while script=0 ===")
        log("=== This means clear_subscript was called ===")
        -- Continue a few more frames to see recovery
    end

    if sub > 0 and script == 0 then
        transition_started = true
    end

    if done and frame > INJECT_FRAME + 200 then
        break
    end
end

log("")
log("=== TRACE COMPLETE ===")
log_file:close()

client.exit()
