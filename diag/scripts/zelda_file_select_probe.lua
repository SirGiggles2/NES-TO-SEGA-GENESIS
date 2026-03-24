-- zelda_file_select_probe.lua
-- Drives from title to stable file select with a deliberate Start pulse,
-- then records the 5-entry active table and cursor selection.

local ROM_VERSION = "zelda_v430"
local MAX_FRAMES  = 1400
local STABLE_FRAMES = 90

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR = OUT_DIR .. "screens\\"
local OUT_PATH = OUT_DIR .. "file_select_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY      = 0xFF0011
local ADDR_SCRIPT     = 0xFF0012
local ADDR_SUBSCRIPT  = 0xFF0013
local ADDR_PPU_LOAD   = 0xFF0014
local ADDR_BTN_PRESS  = 0xFF00F8
local ADDR_BTN_HOLD   = 0xFF00FA
local ADDR_JOY_OVERRIDE = 0xFFEE90
local ADDR_JOY_ENABLE   = 0xFFEE91
local ADDR_CUR_SLOT   = 0xFF0016
local ADDR_SLOT_0     = 0xFF0633
local ADDR_SLOT_1     = 0xFF0634
local ADDR_SLOT_2     = 0xFF0635
local ADDR_SLOT_3     = 0xFF0636
local ADDR_SLOT_4     = 0xFF0637
local ADDR_TRACE_LAST = 0xFFF000
local ADDR_TRACE_SEQ  = 0xFFF002

memory.usememorydomain("M68K BUS")

local frame_num = 0
local stable_count = 0
local stable_frame = nil
local prev = nil
local phase = "wait_title_ready"
local phase_frame = nil
local hold_start_title = false

local function ensure_dirs()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
    os.execute('if not exist "' .. SHOT_DIR .. '" mkdir "' .. SHOT_DIR .. '"')
end

ensure_dirs()
local log_file = io.open(OUT_PATH, "w")

local function log(msg)
    if log_file then
        log_file:write(msg .. "\n")
        log_file:flush()
    end
    print(msg)
end

local function shot(name)
    local full = SHOT_DIR .. name
    client.screenshot(full)
    log("screenshot=" .. full)
end

local function joypad_targets(start_pressed)
    return {
        { payload = { Start = start_pressed, C = false, A = false, B = false, Mode = false }, device = 1 },
        { payload = { ["P1 Start"] = start_pressed, ["P1 C"] = false, ["P1 A"] = false, ["P1 B"] = false, ["P1 Mode"] = false }, device = nil },
        { payload = { Start = start_pressed }, device = 1 },
        { payload = { ["P1 Start"] = start_pressed }, device = nil },
    }
end

local START_KEYS = { "Start", "P1 Start", "P1 RetroPad Start", "1 Start" }
local BTN_START  = 0x10

local function joypad_get_states()
    local jp = rawget(_G, "joypad")
    if type(jp) ~= "table" or type(jp.get) ~= "function" then
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

local function verify_button_state(states, keys, expected)
    local saw_key = false
    for _, state in ipairs(states) do
        for _, key in ipairs(keys) do
            local value = state[key]
            if value ~= nil then
                saw_key = true
                if value == expected then
                    return true, true
                end
            end
        end
    end
    return false, saw_key
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
    if #pressed > 8 then
        return table.concat(pressed, ",", 1, 8) .. ",..."
    end
    return table.concat(pressed, ",")
end

local function apply_start(start_pressed)
    local jp = rawget(_G, "joypad")
    local pressed_mask = start_pressed and BTN_START or 0

    memory.write_u8(ADDR_JOY_OVERRIDE, pressed_mask)
    memory.write_u8(ADDR_JOY_ENABLE, pressed_mask ~= 0 and 1 or 0)
    memory.write_u8(ADDR_BTN_PRESS, pressed_mask)
    memory.write_u8(ADDR_BTN_HOLD, pressed_mask)

    if type(jp) ~= "table" or type(jp.set) ~= "function" then
        return pressed_mask ~= 0, "ram injection fallback"
    end

    for _, target in ipairs(joypad_targets(start_pressed)) do
        local ok
        if target.device == nil then
            ok = pcall(jp.set, target.payload)
        else
            ok = pcall(jp.set, target.payload, target.device)
        end
        if ok then
            local states = joypad_get_states()
            local verified, saw_key = verify_button_state(states, START_KEYS, start_pressed)
            if verified or not saw_key then
                return true, summarize_pressed_keys(states)
            end
        end
    end

    return false, summarize_pressed_keys(joypad_get_states())
end

local function read_state()
    return {
        ready      = memory.read_u8(ADDR_READY),
        script     = memory.read_u8(ADDR_SCRIPT),
        sub        = memory.read_u8(ADDR_SUBSCRIPT),
        ppu        = memory.read_u8(ADDR_PPU_LOAD),
        slot       = memory.read_u8(ADDR_CUR_SLOT),
        slot0      = memory.read_u8(ADDR_SLOT_0),
        slot1      = memory.read_u8(ADDR_SLOT_1),
        slot2      = memory.read_u8(ADDR_SLOT_2),
        slot3      = memory.read_u8(ADDR_SLOT_3),
        slot4      = memory.read_u8(ADDR_SLOT_4),
        trace_last = memory.read_u16_be(ADDR_TRACE_LAST),
        trace_seq  = memory.read_u16_be(ADDR_TRACE_SEQ),
    }
end

local function log_state(prefix, s)
    log(string.format(
        "%s frame=%d ready=%d script=%d sub=%d ppu=0x%02X slot=%d active=[%02X,%02X,%02X,%02X,%02X] trace=[%04X,%04X]",
        prefix, frame_num, s.ready, s.script, s.sub, s.ppu, s.slot,
        s.slot0, s.slot1, s.slot2, s.slot3, s.slot4, s.trace_last, s.trace_seq
    ))
end

log("=== FILE SELECT PROBE " .. ROM_VERSION .. " ===")
log("Goal: capture the first stable file-select state with a deliberate title Start pulse.")
log("")

while frame_num < MAX_FRAMES do
    if hold_start_title then
        apply_start(true)
    else
        apply_start(false)
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
        s.slot ~= prev.slot or
        s.slot0 ~= prev.slot0 or
        s.slot1 ~= prev.slot1 or
        s.slot2 ~= prev.slot2 or
        s.slot3 ~= prev.slot3 or
        s.slot4 ~= prev.slot4

    if changed then
        log_state("state", s)
    end

    if frame_num % 120 == 0 then
        log_state("heartbeat", s)
    end

    if phase == "wait_title_ready" then
        if s.script == 0 and s.sub == 0 and s.ready == 1 and s.ppu == 0 then
            if phase_frame == nil then
                phase_frame = frame_num
                log("title_ready_frame=" .. frame_num)
            elseif frame_num >= phase_frame + 19 then
                hold_start_title = true
                local ok, keys = apply_start(true)
                phase = "wait_title_exit"
                log("action=hold_start_title frame=" .. frame_num .. " input_ok=" .. tostring(ok) .. " joypad_keys=" .. tostring(keys))
            end
        else
            phase_frame = nil
        end
    elseif phase == "wait_title_exit" then
        if s.script ~= 0 then
            hold_start_title = false
            phase = "wait_file_select"
            log("title_exit_detected frame=" .. frame_num)
        end
    elseif s.script == 1 and s.sub == 0 and s.ready == 1 and s.ppu == 0 then
        if stable_count == 0 then
            stable_frame = frame_num
            log("file_select_entered frame=" .. frame_num)
        end
        stable_count = stable_count + 1
        if stable_count == 1 or stable_count == 30 or stable_count == STABLE_FRAMES then
            log_state("stable", s)
        end
        if stable_count == STABLE_FRAMES then
            shot(ROM_VERSION .. "_file_select_probe_f" .. frame_num .. ".png")
            break
        end
    else
        stable_count = 0
        stable_frame = nil
    end

    prev = s
end

log("")
log("=== SUMMARY ===")
local final = read_state()
log_state("final", final)
log("stable_count=" .. stable_count)
if stable_frame ~= nil then
    log("stable_start_frame=" .. stable_frame)
end

if log_file then
    log_file:close()
end
