-- zelda_file_select_nav_probe.lua
-- Verifies that file-select navigation actually moves between active entries
-- and records the associated cursor OAM changes.

local ROM_VERSION = "zelda_v430"
local MAX_FRAMES = 1500
local SETTLE_FRAMES = 45
local POST_INPUT_WAIT = 20

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR = OUT_DIR .. "screens\\"
local OUT_PATH = OUT_DIR .. "file_select_nav_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY       = 0xFF0011
local ADDR_SCRIPT      = 0xFF0012
local ADDR_SUBSCRIPT   = 0xFF0013
local ADDR_PPU_LOAD    = 0xFF0014
local ADDR_CUR_SLOT    = 0xFF0016
local ADDR_BTN_PRESS   = 0xFF00F8
local ADDR_BTN_HOLD    = 0xFF00FA
local ADDR_JOY_OVERRIDE = 0xFFEE90
local ADDR_JOY_ENABLE   = 0xFFEE91
local ADDR_SLOT_0      = 0xFF0633
local ADDR_SLOT_1      = 0xFF0634
local ADDR_SLOT_2      = 0xFF0635
local ADDR_SLOT_3      = 0xFF0636
local ADDR_SLOT_4      = 0xFF0637
local ADDR_SPR_BASE    = 0xFF0200
local ADDR_SPR_INDEX_1 = 0xFF0343
local ADDR_SPR_INDEX_2 = 0xFF0344
local ADDR_TRACE_LAST  = 0xFFF000
local ADDR_TRACE_SEQ   = 0xFFF002
local BTN_DOWN         = 0x04
local BTN_UP           = 0x08
local BTN_START        = 0x10

memory.usememorydomain("M68K BUS")

local function ensure_dirs()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
    os.execute('if not exist "' .. SHOT_DIR .. '" mkdir "' .. SHOT_DIR .. '"')
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

local function shot(name)
    local full = SHOT_DIR .. name
    client.screenshot(full)
    log("screenshot=" .. full)
end

local function clear_ram_buttons()
    memory.write_u8(ADDR_JOY_OVERRIDE, 0)
    memory.write_u8(ADDR_JOY_ENABLE, 0)
    memory.write_u8(ADDR_BTN_PRESS, 0)
    memory.write_u8(ADDR_BTN_HOLD, 0)
end

local START_KEYS  = { "Start", "P1 Start", "P1 RetroPad Start", "1 Start" }
local DOWN_KEYS   = { "Down", "P1 Down", "P1 RetroPad Down", "1 Down" }
local UP_KEYS     = { "Up", "P1 Up", "P1 RetroPad Up", "1 Up" }

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

local function verify_requested_state(states, start_pressed, down_pressed, up_pressed)
    local ok = true
    local saw_any = false

    local start_ok, saw_start = verify_button_state(states, START_KEYS, start_pressed)
    if saw_start then
        saw_any = true
        ok = ok and start_ok
    end

    local down_ok, saw_down = verify_button_state(states, DOWN_KEYS, down_pressed)
    if saw_down then
        saw_any = true
        ok = ok and down_ok
    end

    local up_ok, saw_up = verify_button_state(states, UP_KEYS, up_pressed)
    if saw_up then
        saw_any = true
        ok = ok and up_ok
    end

    return ok, saw_any
end

local function release_joypad()
    local jp = rawget(_G, "joypad")
    if type(jp) == "table" and type(jp.set) == "function" then
        pcall(jp.set, { Start = false, Down = false, Up = false, A = false, B = false, C = false, Mode = false }, 1)
        pcall(jp.set, { ["P1 Start"] = false, ["P1 Down"] = false, ["P1 Up"] = false, ["P1 A"] = false, ["P1 B"] = false, ["P1 C"] = false, ["P1 Mode"] = false })
    end
end

local function joypad_targets(start_pressed, down_pressed, up_pressed)
    return {
        { payload = { Start = start_pressed, Down = down_pressed, Up = up_pressed, A = false, B = false, C = false, Mode = false }, device = 1 },
        { payload = { ["P1 Start"] = start_pressed, ["P1 Down"] = down_pressed, ["P1 Up"] = up_pressed, ["P1 A"] = false, ["P1 B"] = false, ["P1 C"] = false, ["P1 Mode"] = false }, device = nil },
        { payload = { Start = start_pressed, Down = down_pressed, Up = up_pressed }, device = 1 },
        { payload = { ["P1 Start"] = start_pressed, ["P1 Down"] = down_pressed, ["P1 Up"] = up_pressed }, device = nil },
    }
end

local function apply_buttons(start_pressed, down_pressed, up_pressed)
    local jp = rawget(_G, "joypad")
    local pressed_mask = 0
    if start_pressed then
        pressed_mask = pressed_mask | BTN_START
    end
    if down_pressed then
        pressed_mask = pressed_mask | BTN_DOWN
    end
    if up_pressed then
        pressed_mask = pressed_mask | BTN_UP
    end

    memory.write_u8(ADDR_JOY_OVERRIDE, pressed_mask)
    memory.write_u8(ADDR_JOY_ENABLE, pressed_mask ~= 0 and 1 or 0)
    memory.write_u8(ADDR_BTN_PRESS, pressed_mask)
    memory.write_u8(ADDR_BTN_HOLD, pressed_mask)

    if type(jp) ~= "table" or type(jp.set) ~= "function" then
        return pressed_mask ~= 0, "ram injection fallback"
    end

    for _, target in ipairs(joypad_targets(start_pressed, down_pressed, up_pressed)) do
        local ok
        if target.device == nil then
            ok = pcall(jp.set, target.payload)
        else
            ok = pcall(jp.set, target.payload, target.device)
        end
        if ok then
            local states = joypad_get_states()
            local verified, saw_any = verify_requested_state(states, start_pressed, down_pressed, up_pressed)
            if verified or not saw_any then
                return true, summarize_pressed_keys(states)
            end
        end
    end

    return false, summarize_pressed_keys(joypad_get_states())
end

local function pulse_down()
    return apply_buttons(false, true, false)
end

local function pulse_start()
    return apply_buttons(true, false, false)
end

local function pulse_up()
    return apply_buttons(false, false, true)
end

local function read_state()
    return {
        ready = read_u8(ADDR_READY),
        script = read_u8(ADDR_SCRIPT),
        sub = read_u8(ADDR_SUBSCRIPT),
        ppu = read_u8(ADDR_PPU_LOAD),
        slot = read_u8(ADDR_CUR_SLOT),
        btn_press = read_u8(ADDR_BTN_PRESS),
        btn_hold = read_u8(ADDR_BTN_HOLD),
        slot0 = read_u8(ADDR_SLOT_0),
        slot1 = read_u8(ADDR_SLOT_1),
        slot2 = read_u8(ADDR_SLOT_2),
        slot3 = read_u8(ADDR_SLOT_3),
        slot4 = read_u8(ADDR_SLOT_4),
        spr1 = read_u8(ADDR_SPR_INDEX_1),
        spr2 = read_u8(ADDR_SPR_INDEX_2),
        trace_last = memory.read_u16_be(ADDR_TRACE_LAST) or 0,
        trace_seq = memory.read_u16_be(ADDR_TRACE_SEQ) or 0,
    }
end

local function log_sprite_rows(count)
    for i = 0, count - 1 do
        local base = ADDR_SPR_BASE + (i * 4)
        log(string.format(
            "spr[%d]=Y:%02X T:%02X A:%02X X:%02X",
            i,
            read_u8(base + 0),
            read_u8(base + 1),
            read_u8(base + 2),
            read_u8(base + 3)
        ))
    end
end

local function log_state(prefix, frame_num, s)
    log(string.format(
        "%s frame=%d ready=%d script=%d sub=%d ppu=%02X slot=%d btn=[%02X,%02X] active=[%02X,%02X,%02X,%02X,%02X] spr_idx=[%02X,%02X] trace=[%04X,%04X]",
        prefix,
        frame_num,
        s.ready,
        s.script,
        s.sub,
        s.ppu,
        s.slot,
        s.btn_press,
        s.btn_hold,
        s.slot0,
        s.slot1,
        s.slot2,
        s.slot3,
        s.slot4,
        s.spr1,
        s.spr2,
        s.trace_last,
        s.trace_seq
    ))
end

local frame_num = 0
local stable_count = 0
local stage = "wait_title_ready"
local pulses = 0
local wait_until = nil
local prev_slot = nil
local prev_cursor_y = nil
local prev_state = nil
local joypad_release_pending = false
local title_ready_frame = nil

log("=== FILE SELECT NAV PROBE " .. ROM_VERSION .. " ===")
clear_ram_buttons()
release_joypad()

while frame_num < MAX_FRAMES do
    if stage == "hold_start_title" then
        local ok, keys = apply_buttons(true, false, false)
        if frame_num == title_ready_frame + 21 then
            log("hold_start_status frame=" .. frame_num .. " input_ok=" .. tostring(ok) .. " joypad_keys=" .. tostring(keys))
        end
        joypad_release_pending = true
    elseif stage == "pulse_select" then
        local ok, keys
        if pulses <= 1 then
            ok, keys = pulse_down()
            log("down_pulse_status frame=" .. frame_num .. " input_ok=" .. tostring(ok) .. " joypad_keys=" .. tostring(keys))
        else
            ok, keys = pulse_up()
            log("up_pulse_status frame=" .. frame_num .. " input_ok=" .. tostring(ok) .. " joypad_keys=" .. tostring(keys))
        end
        joypad_release_pending = true
    elseif stage == "wait_after_pulse" then
        clear_ram_buttons()
        if joypad_release_pending then
            release_joypad()
            joypad_release_pending = false
        end
    else
        -- Leave input completely untouched while waiting for settled file select.
        -- Even writing zeros here can perturb the front-end timing/state machine.
    end

    emu.frameadvance()
    frame_num = frame_num + 1

    local s = read_state()
    local changed =
        prev_state == nil or
        s.ready ~= prev_state.ready or
        s.script ~= prev_state.script or
        s.sub ~= prev_state.sub or
        s.ppu ~= prev_state.ppu or
        s.slot ~= prev_state.slot or
        s.slot0 ~= prev_state.slot0 or
        s.slot1 ~= prev_state.slot1 or
        s.slot2 ~= prev_state.slot2 or
        s.slot3 ~= prev_state.slot3 or
        s.slot4 ~= prev_state.slot4 or
        s.spr1 ~= prev_state.spr1 or
        s.spr2 ~= prev_state.spr2

    if changed then
        log_state("state", frame_num, s)
    end

    if stage == "wait_title_ready" then
        if s.script == 0 and s.sub == 0 and s.ready == 1 and s.ppu == 0 then
            if title_ready_frame == nil then
                title_ready_frame = frame_num
                log("title_ready_frame=" .. frame_num)
            elseif frame_num >= title_ready_frame + 19 then
                stage = "hold_start_title"
                local ok, keys = apply_buttons(true, false, false)
                log("action=hold_start_title frame=" .. frame_num .. " input_ok=" .. tostring(ok) .. " joypad_keys=" .. tostring(keys))
            end
        else
            title_ready_frame = nil
        end
    elseif stage == "hold_start_title" then
        if s.script ~= 0 then
            clear_ram_buttons()
            if joypad_release_pending then
                release_joypad()
                joypad_release_pending = false
            end
            log("title_exit_detected frame=" .. frame_num)
            stage = "wait_stable"
        end
    elseif stage == "wait_stable" then
        if s.script == 1 and s.sub == 0 and s.ready == 1 and s.ppu == 0 then
            stable_count = stable_count + 1
            if stable_count == SETTLE_FRAMES then
                prev_slot = s.slot
                prev_cursor_y = read_u8(ADDR_SPR_BASE + 0)
                log_state("stable", frame_num, s)
                log_sprite_rows(10)
                shot(ROM_VERSION .. "_file_select_nav_initial_f" .. frame_num .. ".png")
                stage = "pulse_select"
            end
        else
            stable_count = 0
        end
    elseif stage == "pulse_select" then
        pulses = pulses + 1
        if pulses <= 2 then
            log("action=down_pulse index=" .. pulses .. " frame=" .. frame_num)
        else
            log("action=up_pulse index=1 frame=" .. frame_num)
        end
        stage = "wait_after_pulse"
        wait_until = frame_num + POST_INPUT_WAIT
    elseif stage == "wait_after_pulse" then
        if frame_num >= wait_until and s.script == 1 and s.sub == 0 and s.ready == 1 and s.ppu == 0 then
            local cursor_y = read_u8(ADDR_SPR_BASE + 0)
            log_state("after_select", frame_num, s)
            log_sprite_rows(10)
            shot(ROM_VERSION .. "_file_select_nav_p" .. pulses .. "_f" .. frame_num .. ".png")
            if s.slot == prev_slot then
                log("slot_change=NO")
            else
                log("slot_change=YES " .. tostring(prev_slot) .. "->" .. tostring(s.slot))
            end
            if cursor_y == prev_cursor_y then
                log("cursor_y_change=NO current=" .. hex(cursor_y, 2))
            else
                log("cursor_y_change=YES " .. hex(prev_cursor_y, 2) .. "->" .. hex(cursor_y, 2))
            end
            prev_slot = s.slot
            prev_cursor_y = cursor_y
            if pulses >= 3 then
                break
            end
            stage = "pulse_select"
        end
    end

    prev_state = s
end

clear_ram_buttons()
release_joypad()

log("")
log("=== SUMMARY ===")
local final = read_state()
log_state("final", frame_num, final)
log_sprite_rows(10)

log_file:close()
