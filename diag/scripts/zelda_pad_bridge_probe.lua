-- zelda_pad_bridge_probe.lua
-- Verifies Genesis controller -> NES button bridge without using RAM override.

local ROM_VERSION = "zelda_v611"
local MAX_FRAMES = 1200
local TITLE_STABLE_FRAMES = 20
local PRESS_FRAMES = 3
local RELEASE_FRAMES = 8

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "pad_bridge_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY        = 0xFF0011
local ADDR_SCRIPT       = 0xFF0012
local ADDR_SUBSCRIPT    = 0xFF0013
local ADDR_PPU_LOAD     = 0xFF0014
local ADDR_PAD_DATA     = 0xA10003
local ADDR_JOY_MIRROR   = 0xFF00F0
local ADDR_BTN_PRESS    = 0xFF00F8
local ADDR_BTN_HOLD     = 0xFF00FA
local ADDR_JOY_OVERRIDE = 0xFFEE90
local ADDR_JOY_ENABLE   = 0xFFEE91
local ADDR_TRACE_LAST   = 0xFFF000
local ADDR_TRACE_SEQ    = 0xFFF002

local BTN_RIGHT  = 0x01
local BTN_LEFT   = 0x02
local BTN_DOWN   = 0x04
local BTN_UP     = 0x08
local BTN_START  = 0x10
local BTN_SELECT = 0x20
local BTN_B      = 0x40
local BTN_A      = 0x80

local ACTIONS = {
    { name = "start", expected = BTN_START, payloads = {
        { device = 1,   state = { Start = true,  A = false, B = false, C = false, Up = false, Down = false, Left = false, Right = false, Mode = false } },
        { device = nil, state = { ["P1 Start"] = true, ["P1 A"] = false, ["P1 B"] = false, ["P1 C"] = false, ["P1 Up"] = false, ["P1 Down"] = false, ["P1 Left"] = false, ["P1 Right"] = false, ["P1 Mode"] = false } },
    }},
    { name = "a", expected = BTN_A, payloads = {
        { device = 1,   state = { Start = false, A = true,  B = false, C = false, Up = false, Down = false, Left = false, Right = false, Mode = false } },
        { device = nil, state = { ["P1 Start"] = false, ["P1 A"] = true, ["P1 B"] = false, ["P1 C"] = false, ["P1 Up"] = false, ["P1 Down"] = false, ["P1 Left"] = false, ["P1 Right"] = false, ["P1 Mode"] = false } },
    }},
    { name = "b", expected = BTN_B, payloads = {
        { device = 1,   state = { Start = false, A = false, B = true,  C = false, Up = false, Down = false, Left = false, Right = false, Mode = false } },
        { device = nil, state = { ["P1 Start"] = false, ["P1 A"] = false, ["P1 B"] = true, ["P1 C"] = false, ["P1 Up"] = false, ["P1 Down"] = false, ["P1 Left"] = false, ["P1 Right"] = false, ["P1 Mode"] = false } },
    }},
    { name = "c_select", expected = BTN_SELECT, payloads = {
        { device = 1,   state = { Start = false, A = false, B = false, C = true,  Up = false, Down = false, Left = false, Right = false, Mode = false } },
        { device = nil, state = { ["P1 Start"] = false, ["P1 A"] = false, ["P1 B"] = false, ["P1 C"] = true, ["P1 Up"] = false, ["P1 Down"] = false, ["P1 Left"] = false, ["P1 Right"] = false, ["P1 Mode"] = false } },
    }},
    { name = "up", expected = BTN_UP, payloads = {
        { device = 1,   state = { Start = false, A = false, B = false, C = false, Up = true,  Down = false, Left = false, Right = false, Mode = false } },
        { device = nil, state = { ["P1 Start"] = false, ["P1 A"] = false, ["P1 B"] = false, ["P1 C"] = false, ["P1 Up"] = true, ["P1 Down"] = false, ["P1 Left"] = false, ["P1 Right"] = false, ["P1 Mode"] = false } },
    }},
    { name = "down", expected = BTN_DOWN, payloads = {
        { device = 1,   state = { Start = false, A = false, B = false, C = false, Up = false, Down = true,  Left = false, Right = false, Mode = false } },
        { device = nil, state = { ["P1 Start"] = false, ["P1 A"] = false, ["P1 B"] = false, ["P1 C"] = false, ["P1 Up"] = false, ["P1 Down"] = true, ["P1 Left"] = false, ["P1 Right"] = false, ["P1 Mode"] = false } },
    }},
    { name = "left", expected = BTN_LEFT, payloads = {
        { device = 1,   state = { Start = false, A = false, B = false, C = false, Up = false, Down = false, Left = true,  Right = false, Mode = false } },
        { device = nil, state = { ["P1 Start"] = false, ["P1 A"] = false, ["P1 B"] = false, ["P1 C"] = false, ["P1 Up"] = false, ["P1 Down"] = false, ["P1 Left"] = true, ["P1 Right"] = false, ["P1 Mode"] = false } },
    }},
    { name = "right", expected = BTN_RIGHT, payloads = {
        { device = 1,   state = { Start = false, A = false, B = false, C = false, Up = false, Down = false, Left = false, Right = true,  Mode = false } },
        { device = nil, state = { ["P1 Start"] = false, ["P1 A"] = false, ["P1 B"] = false, ["P1 C"] = false, ["P1 Up"] = false, ["P1 Down"] = false, ["P1 Left"] = false, ["P1 Right"] = true, ["P1 Mode"] = false } },
    }},
}

memory.usememorydomain("M68K BUS")

local function ensure_dirs()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
end

local function hex(v, w)
    return string.format("%0" .. tostring(w or 2) .. "X", v or 0)
end

local function has_mask(value, mask)
    local range = mask * 2
    return (value % range) >= mask
end

local function read_u8(addr)
    return memory.read_u8(addr) or 0
end

local function read_u16(addr)
    return memory.read_u16_be(addr) or 0
end

ensure_dirs()
local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
    print(msg)
end

local function read_state()
    local raw_high = 0
    local raw_low = 0
    memory.write_u8(ADDR_PAD_DATA, 0x40)
    raw_high = read_u8(ADDR_PAD_DATA)
    memory.write_u8(ADDR_PAD_DATA, 0x00)
    raw_low = read_u8(ADDR_PAD_DATA)
    memory.write_u8(ADDR_PAD_DATA, 0x40)

    return {
        ready = read_u8(ADDR_READY),
        script = read_u8(ADDR_SCRIPT),
        sub = read_u8(ADDR_SUBSCRIPT),
        ppu = read_u8(ADDR_PPU_LOAD),
        joy = read_u8(ADDR_JOY_MIRROR),
        press = read_u8(ADDR_BTN_PRESS),
        hold = read_u8(ADDR_BTN_HOLD),
        raw_high = raw_high,
        raw_low = raw_low,
        trace_last = read_u16(ADDR_TRACE_LAST),
        trace_seq = read_u16(ADDR_TRACE_SEQ),
    }
end

local function is_callable(value)
    local kind = type(value)
    return kind == "function" or kind == "userdata"
end

local function log_state(prefix, frame_num, action_name, s)
    log(string.format(
        "%s frame=%d action=%s ready=%d script=%d sub=%d ppu=%02X joy=%02X btn=[%02X,%02X] trace=[%04X,%04X]",
        prefix,
        frame_num,
        action_name or "idle",
        s.ready,
        s.script,
        s.sub,
        s.ppu,
        s.joy,
        s.press,
        s.hold,
        s.raw_high,
        s.raw_low,
        s.trace_last,
        s.trace_seq
    ))
end

local function summarize_pressed_keys(states)
    local pressed = {}
    for _, state in ipairs(states or {}) do
        for key, value in pairs(state) do
            if value == true then
                pressed[#pressed + 1] = key
            end
        end
    end
    table.sort(pressed)
    if #pressed == 0 then
        return "none"
    end
    return table.concat(pressed, ",")
end

local function joypad_get_states()
    local jp = rawget(_G, "joypad")
    if type(jp) ~= "table" or not is_callable(jp.get) then
        return {}
    end

    local states = {}
    local devices = { 1, nil, "Controller 1", "P1", "Port 1" }
    for _, device in ipairs(devices) do
        local ok, state
        if device == nil then
            ok, state = pcall(jp.get)
        else
            ok, state = pcall(jp.get, device)
        end
        if ok and type(state) == "table" then
            states[#states + 1] = state
        end
    end
    return states
end

local function apply_payloads(payloads)
    local jp = rawget(_G, "joypad")
    if type(jp) ~= "table" or not is_callable(jp.set) then
        return false
    end

    for _, payload in ipairs(payloads) do
        local ok
        if payload.device == nil then
            ok = pcall(jp.set, payload.state)
        else
            ok = pcall(jp.set, payload.state, payload.device)
        end
        if ok then
            return true
        end
    end

    return false
end

local function release_joypad()
    memory.write_u8(ADDR_JOY_OVERRIDE, 0)
    memory.write_u8(ADDR_JOY_ENABLE, 0)

    local jp = rawget(_G, "joypad")
    if type(jp) ~= "table" or not is_callable(jp.set) then
        return
    end

    pcall(jp.set, { Start = false, A = false, B = false, C = false, Up = false, Down = false, Left = false, Right = false, Mode = false }, 1)
    pcall(jp.set, { ["P1 Start"] = false, ["P1 A"] = false, ["P1 B"] = false, ["P1 C"] = false, ["P1 Up"] = false, ["P1 Down"] = false, ["P1 Left"] = false, ["P1 Right"] = false, ["P1 Mode"] = false })
end

local frame_num = 0
local title_ready_start = nil
local results = {}

log("=== PAD BRIDGE PROBE " .. ROM_VERSION .. " ===")
log("Verifying controller bridge without JOYPAD override.")

while frame_num < MAX_FRAMES do
    release_joypad()
    emu.frameadvance()
    frame_num = frame_num + 1

    local s = read_state()
    if frame_num % 120 == 0 then
        log_state("heartbeat", frame_num, "idle", s)
    end

    if s.script == 0 and s.sub == 0 and s.ready == 1 and s.ppu == 0 then
        if title_ready_start == nil then
            title_ready_start = frame_num
            log("title_ready_frame=" .. frame_num)
        elseif frame_num >= title_ready_start + TITLE_STABLE_FRAMES then
            break
        end
    else
        title_ready_start = nil
    end
end

if title_ready_start == nil then
    log("error=title_not_reached")
else
    for _, action in ipairs(ACTIONS) do
        local detected = false
        local applied = apply_payloads(action.payloads)
        log(string.format("action_begin=%s expected=%02X applied=%s joypad_keys=%s", action.name, action.expected, tostring(applied), summarize_pressed_keys(joypad_get_states())))

        for i = 1, PRESS_FRAMES do
            memory.write_u8(ADDR_JOY_OVERRIDE, 0)
            memory.write_u8(ADDR_JOY_ENABLE, 0)
            emu.frameadvance()
            frame_num = frame_num + 1
            local s = read_state()
            log_state("press", frame_num, action.name, s)
            if has_mask(s.joy, action.expected) or has_mask(s.press, action.expected) or has_mask(s.hold, action.expected) then
                detected = true
            end
            apply_payloads(action.payloads)
        end

        release_joypad()

        for i = 1, RELEASE_FRAMES do
            emu.frameadvance()
            frame_num = frame_num + 1
            local s = read_state()
            if i == 1 then
                log_state("release", frame_num, action.name, s)
            end
        end

        results[#results + 1] = {
            name = action.name,
            expected = action.expected,
            detected = detected,
        }
    end
end

release_joypad()

log("")
log("=== SUMMARY ===")
local passed = true
for _, result in ipairs(results) do
    log(string.format("button=%s expected=%02X detected=%s", result.name, result.expected, tostring(result.detected)))
    if not result.detected then
        passed = false
    end
end
log("result=" .. (passed and "PASS" or "FAIL"))

log_file:close()
