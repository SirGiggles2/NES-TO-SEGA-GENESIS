-- zelda_input_override_probe.lua
-- Focused title-screen input bridge probe:
-- verifies whether READ_JOYPAD consumes the probe override bytes.

local ROM_VERSION = "zelda_v445"
local MAX_FRAMES = 900

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "input_override_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY        = 0xFF0011
local ADDR_SCRIPT       = 0xFF0012
local ADDR_SUBSCRIPT    = 0xFF0013
local ADDR_PPU_LOAD     = 0xFF0014
local ADDR_SCREEN_TRANS = 0xFF00E3
local ADDR_JOY_MIRROR   = 0xFF00F0
local ADDR_BTN_PRESS    = 0xFF00F8
local ADDR_BTN_HOLD     = 0xFF00FA
local ADDR_JOY_OVERRIDE = 0xFFEE90
local ADDR_JOY_ENABLE   = 0xFFEE91
local ADDR_TRACE_LAST   = 0xFFF000
local ADDR_TRACE_SEQ    = 0xFFF002

local BTN_START = 0x10

memory.usememorydomain("M68K BUS")

local function ensure_dirs()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
end

local function hex(v, w)
    return string.format("%0" .. tostring(w or 2) .. "X", v or 0)
end

local function read_u8(addr)
    return memory.read_u8(addr) or 0
end

ensure_dirs()
local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
    print(msg)
end

local function read_state()
    return {
        ready   = read_u8(ADDR_READY),
        script  = read_u8(ADDR_SCRIPT),
        sub     = read_u8(ADDR_SUBSCRIPT),
        ppu     = read_u8(ADDR_PPU_LOAD),
        trans   = read_u8(ADDR_SCREEN_TRANS),
        joy     = read_u8(ADDR_JOY_MIRROR),
        press   = read_u8(ADDR_BTN_PRESS),
        hold    = read_u8(ADDR_BTN_HOLD),
        ov      = read_u8(ADDR_JOY_OVERRIDE),
        en      = read_u8(ADDR_JOY_ENABLE),
        trace_l = memory.read_u16_be(ADDR_TRACE_LAST) or 0,
        trace_s = memory.read_u16_be(ADDR_TRACE_SEQ) or 0,
    }
end

local function log_state(prefix, frame_num, s)
    log(string.format(
        "%s frame=%d ready=%d script=%d sub=%d ppu=%02X trans=%02X joy=%02X btn=[%02X,%02X] ov=[%02X,%02X] trace=[%04X,%04X]",
        prefix,
        frame_num,
        s.ready,
        s.script,
        s.sub,
        s.ppu,
        s.trans,
        s.joy,
        s.press,
        s.hold,
        s.ov,
        s.en,
        s.trace_l,
        s.trace_s
    ))
end

local frame_num = 0
local phase = "wait_title_ready"
local title_ready_frame = nil
local inject_until = nil
local prev = nil

log("=== INPUT OVERRIDE PROBE " .. ROM_VERSION .. " ===")

while frame_num < MAX_FRAMES do
    if inject_until ~= nil and frame_num <= inject_until then
        memory.write_u8(ADDR_JOY_OVERRIDE, BTN_START)
        memory.write_u8(ADDR_JOY_ENABLE, 1)
    else
        memory.write_u8(ADDR_JOY_OVERRIDE, 0)
        memory.write_u8(ADDR_JOY_ENABLE, 0)
    end

    emu.frameadvance()
    frame_num = frame_num + 1

    local s = read_state()
    local changed =
        prev == nil or
        s.ready ~= prev.ready or
        s.script ~= prev.script or
        s.sub ~= prev.sub or
        s.ppu ~= prev.ppu or
        s.trans ~= prev.trans or
        s.joy ~= prev.joy or
        s.press ~= prev.press or
        s.hold ~= prev.hold or
        s.ov ~= prev.ov or
        s.en ~= prev.en

    if changed then
        log_state("state", frame_num, s)
    end

    if frame_num % 60 == 0 then
        log_state("heartbeat", frame_num, s)
    end

    if phase == "wait_title_ready" then
        if s.script == 0 and s.sub == 0 and s.ready == 1 and s.ppu == 0 then
            if title_ready_frame == nil then
                title_ready_frame = frame_num
                log("title_ready_frame=" .. frame_num)
            elseif frame_num >= title_ready_frame + 20 then
                inject_until = frame_num + 5
                phase = "injecting"
                log("action=start_override frame=" .. frame_num .. " until=" .. inject_until)
            end
        else
            title_ready_frame = nil
        end
    elseif phase == "injecting" and inject_until ~= nil and frame_num > inject_until + 30 then
        break
    end

    prev = s
end

memory.write_u8(ADDR_JOY_OVERRIDE, 0)
memory.write_u8(ADDR_JOY_ENABLE, 0)

log("")
log("=== SUMMARY ===")
log_state("final", frame_num, read_state())

log_file:close()
