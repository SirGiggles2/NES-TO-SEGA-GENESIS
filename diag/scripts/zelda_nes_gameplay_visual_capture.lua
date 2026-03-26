-- zelda_nes_gameplay_visual_capture.lua
-- Capture the first fully loaded gameplay screen from NES oracle ROM.

local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "nes_gameplay_visual_capture.txt"
local MAX_FRAMES = 12000

local BTN_START = 0x10
local BTN_SELECT = 0x20
local BTN_A = 0x80

local SCRIPT_TITLE = 0x00
local SCRIPT_FILE_SELECT = 0x01
local SCRIPT_GAMEPLAY = 0x05
local SCRIPT_REGISTER = 0x0E
local SCRIPT_ELIMINATION = 0x0F

local ADDR_FRM_CNT = 0x0015
local ADDR_CUR_SLOT = 0x0016
local ADDR_BTN_PRESS = 0x00F8
local ADDR_BTN_HOLD = 0x00FA
local ADDR_SPR_INDEX_1 = 0x0343
local ADDR_SPR_INDEX_2 = 0x0344

local START_KEYS = { "Start", "P1 Start", "P1 RetroPad Start", "1 Start" }
local SELECT_KEYS = { "Select", "P1 Select", "P1 RetroPad Select", "1 Select" }
local A_KEYS = { "A", "P1 A", "P1 RetroPad A", "1 A" }
local B_KEYS = { "B", "P1 B", "P1 RetroPad B", "1 B" }

os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')

local log_file = assert(io.open(OUT_PATH, "w"))
local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
end

local function is_callable(value)
    local kind = type(value)
    return kind == "function" or kind == "userdata"
end

local function joypad_get_states()
    local jp = rawget(_G, "joypad")
    if type(jp) ~= "table" or not is_callable(jp.get) then
        return {}
    end

    local states = {}
    local devices = { nil, 1, "Controller 1", "P1", "Port 1" }
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

local function verify_any_key(keys, expected)
    for _, state in ipairs(joypad_get_states()) do
        for _, key in ipairs(keys) do
            local value = state[key]
            if value ~= nil then
                return value == expected, key
            end
        end
    end
    return nil, nil
end

local function describe_joypad_states()
    local states = joypad_get_states()
    if #states == 0 then
        return "unavailable"
    end

    local groups = {
        { name = "Start", keys = START_KEYS },
        { name = "Select", keys = SELECT_KEYS },
        { name = "A", keys = A_KEYS },
        { name = "B", keys = B_KEYS },
    }

    local parts = {}
    for index, state in ipairs(states) do
        local entries = {}
        for _, group in ipairs(groups) do
            for _, key in ipairs(group.keys) do
                if state[key] ~= nil then
                    entries[#entries + 1] = string.format("%s=%s", key, tostring(state[key]))
                    break
                end
            end
        end
        if #entries > 0 then
            parts[#parts + 1] = string.format("state%d[%s]", index, table.concat(entries, ","))
        end
    end

    if #parts == 0 then
        return "no_relevant_keys"
    end
    return table.concat(parts, " | ")
end

local domain = nil
for _, d in ipairs(memory.getmemorydomainlist()) do
    if d == "RAM" then
        domain = "RAM"
        break
    end
end
if not domain then
    for _, d in ipairs(memory.getmemorydomainlist()) do
        if d == "System Bus" then
            domain = "System Bus"
            break
        end
    end
end
if not domain then
    domain = memory.getmemorydomainlist()[1]
end
memory.usememorydomain(domain)

local use_sysbus = (domain == "System Bus")
local function r8(addr)
    if not use_sysbus and addr > 0x07FF then
        local ok, val = pcall(function()
            memory.usememorydomain("System Bus")
            local v = memory.read_u8(addr)
            memory.usememorydomain(domain)
            return v
        end)
        if ok then
            return val or 0
        end
        return 0
    end
    return memory.read_u8(addr) or 0
end

local function apply_input(mask)
    local start_pressed = (mask & BTN_START) ~= 0
    local select_pressed = (mask & BTN_SELECT) ~= 0
    local a_pressed = (mask & BTN_A) ~= 0

    local jp = rawget(_G, "joypad")
    if type(jp) ~= "table" or not is_callable(jp.set) then
        return false, nil, nil
    end

    local targets = {
        {
            label = "start_select_a_device1",
            payload = { Start = start_pressed, Select = select_pressed, A = a_pressed, B = false },
            device = 1,
            verify = START_KEYS,
        },
        {
            label = "p1_keys_default_device",
            payload = { ["P1 Start"] = start_pressed, ["P1 Select"] = select_pressed, ["P1 A"] = a_pressed, ["P1 B"] = false },
            device = nil,
            verify = START_KEYS,
        },
        {
            label = "p1_keys_device1",
            payload = { ["P1 Start"] = start_pressed, ["P1 Select"] = select_pressed, ["P1 A"] = a_pressed, ["P1 B"] = false },
            device = 1,
            verify = START_KEYS,
        },
        {
            label = "retropad_default_device",
            payload = { ["P1 RetroPad Start"] = start_pressed, ["P1 RetroPad Select"] = select_pressed, ["P1 RetroPad A"] = a_pressed, ["P1 RetroPad B"] = false },
            device = nil,
            verify = START_KEYS,
        },
        {
            label = "one_prefix_default_device",
            payload = { ["1 Start"] = start_pressed, ["1 Select"] = select_pressed, ["1 A"] = a_pressed, ["1 B"] = false },
            device = nil,
            verify = START_KEYS,
        },
        { label = "start_only_device1", payload = { Start = start_pressed }, device = 1, verify = START_KEYS },
        { label = "p1_start_default", payload = { ["P1 Start"] = start_pressed }, device = nil, verify = START_KEYS },
        { label = "p1_start_device1", payload = { ["P1 Start"] = start_pressed }, device = 1, verify = START_KEYS },
        { label = "retropad_start_default", payload = { ["P1 RetroPad Start"] = start_pressed }, device = nil, verify = START_KEYS },
        { label = "one_start_default", payload = { ["1 Start"] = start_pressed }, device = nil, verify = START_KEYS },
    }

    for _, target in ipairs(targets) do
        local ok
        if target.device == nil then
            ok = pcall(jp.set, target.payload)
        else
            ok = pcall(jp.set, target.payload, target.device)
        end
        if ok then
            local verified, key = verify_any_key(target.verify, start_pressed)
            if verified == nil or verified then
                return true, target.label, key
            end
        end
    end

    return false, nil, nil
end

local requested_input_mask = 0

local function update_requested_input(mask)
    requested_input_mask = mask or 0
end

local function pump_requested_input()
    apply_input(requested_input_mask)
end

local function read_state()
    return {
        ready = r8(0x0011),
        script = r8(0x0012),
        sub = r8(0x0013),
        ppu = r8(0x0014),
        frm = r8(ADDR_FRM_CNT),
        slot = r8(ADDR_CUR_SLOT),
        btn_press = r8(ADDR_BTN_PRESS),
        btn_hold = r8(ADDR_BTN_HOLD),
        spr1 = r8(ADDR_SPR_INDEX_1),
        spr2 = r8(ADDR_SPR_INDEX_2),
    }
end

local function log_state(prefix, frame_num, s)
    log(string.format("%s frame=%d script=%d sub=%d ready=%d ppu=%02X frm=%02X slot=%d btn_press=%02X btn_hold=%02X spr=[%02X,%02X]", prefix, frame_num, s.script, s.sub, s.ready, s.ppu, s.frm, s.slot, s.btn_press, s.btn_hold, s.spr1, s.spr2))
end

log("=== NES GAMEPLAY VISUAL CAPTURE ===")
log("domain=" .. tostring(domain))
log("Capturing first fully loaded gameplay screen (entry + 120 frames).")
log("joypad_state_startup=" .. describe_joypad_states())

local input_hook_mode = "per_frame_loop"
local ev = rawget(_G, "event")
if type(ev) == "table" and is_callable(ev.oninputpoll) then
    pcall(function()
        ev.oninputpoll(function()
            pump_requested_input()
        end, "nes_gameplay_visual_capture_inputpoll")
    end)
    input_hook_mode = "event.oninputpoll"
elseif type(ev) == "table" and is_callable(ev.onframestart) then
    pcall(function()
        ev.onframestart(function()
            pump_requested_input()
        end, "nes_gameplay_visual_capture_framestart")
    end)
    input_hook_mode = "event.onframestart"
end
log("input_hook_mode=" .. input_hook_mode)

local phase = "wait_title_ready"
local phase_frame = nil
local frame_num = 0
local gameplay_entry = nil
local hold_start_title = false
local hold_start_file_select = false
local hold_start_register = false
local hold_a_register = false
local register_seq = 0
local register_seq_start = 0
local capture_path = OUT_DIR .. "ss_gameplay_nes.png"
local title_ready_frame = nil
local file_select_ready_frame = nil
local prev_script = 0xFF
local prev_sub = 0xFF
local prev_ready = 0xFF
local prev_ppu = 0xFF
local prev_btn_press = 0xFF
local prev_btn_hold = 0xFF
local branch_script = nil
local last_input_probe_frame = -999
local last_verified_label = nil

while frame_num < MAX_FRAMES do
    local input_mask = 0
    if hold_start_title or hold_start_file_select or hold_start_register then
        input_mask = BTN_START
    elseif register_seq > 0 then
        local step = (frame_num - register_seq_start) % 24
        if step == 0 then
            input_mask = BTN_A
        elseif step == 8 then
            input_mask = BTN_SELECT
        elseif step == 16 then
            input_mask = BTN_START
        end
    elseif hold_a_register then
        if frame_num % 10 == 0 then
            input_mask = BTN_A
        end
    end

    update_requested_input(input_mask)
    local applied_ok, applied_label, verified_key = apply_input(input_mask)
    if applied_ok and applied_label ~= last_verified_label then
        last_verified_label = applied_label
        log(string.format("input_apply_ok frame=%d mask=%02X target=%s key=%s states=%s", frame_num, input_mask, applied_label, tostring(verified_key), describe_joypad_states()))
    elseif input_mask ~= 0 and frame_num >= last_input_probe_frame + 120 then
        last_input_probe_frame = frame_num
        log(string.format("input_probe frame=%d mask=%02X applied=%s states=%s", frame_num, input_mask, tostring(applied_ok), describe_joypad_states()))
    end

    if input_hook_mode == "per_frame_loop" then
        pump_requested_input()
    end
    emu.frameadvance()
    frame_num = frame_num + 1

    local s = read_state()

    if s.script ~= prev_script or s.sub ~= prev_sub or s.ready ~= prev_ready or s.ppu ~= prev_ppu then
        log_state("state", frame_num, s)
    elseif s.btn_press ~= prev_btn_press or s.btn_hold ~= prev_btn_hold then
        log_state("input_state", frame_num, s)
    elseif frame_num % 120 == 0 and gameplay_entry == nil then
        log_state("heartbeat", frame_num, s)
    end

    if phase == "wait_title_ready" then
        if s.script == SCRIPT_TITLE and s.sub == 0 and s.ready == 1 and s.ppu == 0 then
            if title_ready_frame == nil then
                title_ready_frame = frame_num
                phase_frame = frame_num
                log("title_ready_frame=" .. frame_num)
            elseif frame_num >= title_ready_frame + 20 then
                hold_start_title = true
                phase = "wait_title_exit"
                phase_frame = frame_num
                log("action=hold_start_title frame=" .. frame_num)
            end
        end

    elseif phase == "wait_title_exit" then
        local title_exited =
            s.script ~= SCRIPT_TITLE or
            s.sub ~= 0 or
            s.ppu ~= 0 or
            s.btn_press ~= 0 or
            s.btn_hold ~= 0

        if title_exited then
            hold_start_title = false
            update_requested_input(0)
            phase = "wait_file_select"
            phase_frame = frame_num
            log("title_exit_frame=" .. frame_num)
            log_state("state", frame_num, s)
        elseif frame_num >= phase_frame + 360 then
            hold_start_title = false
            update_requested_input(0)
            log("title_exit_timeout_frame=" .. frame_num)
            break
        end

    elseif phase == "wait_file_select" then
        if s.script == SCRIPT_FILE_SELECT and s.ready == 1 and s.ppu == 0 then
            if file_select_ready_frame == nil then
                file_select_ready_frame = frame_num
                phase_frame = frame_num
                log("file_select_ready_frame=" .. frame_num)
            elseif frame_num >= phase_frame + 20 then
                hold_start_file_select = true
                phase = "wait_branch"
                phase_frame = frame_num
                log("action=hold_start_file_select frame=" .. frame_num)
            end
        elseif frame_num >= phase_frame + 1200 then
            log("file_select_timeout_frame=" .. frame_num)
            break
        end

    elseif phase == "wait_branch" then
        if s.script ~= SCRIPT_FILE_SELECT then
            hold_start_file_select = false
            update_requested_input(0)
            branch_script = s.script
            log("branch_frame=" .. frame_num .. " branch_script=" .. s.script)
            if s.script == SCRIPT_GAMEPLAY then
                gameplay_entry = frame_num
                phase = "capture_gameplay"
                log("gameplay_entry_frame=" .. frame_num)
            elseif s.script == SCRIPT_REGISTER or s.script == SCRIPT_ELIMINATION then
                hold_start_register = true
                register_seq = 0
                phase = "wait_register_resolution"
                phase_frame = frame_num
                log("register_branch_frame=" .. frame_num)
            else
                phase = "wait_gameplay_after_other"
                phase_frame = frame_num
            end
        elseif frame_num >= phase_frame + 240 then
            log("branch_timeout_frame=" .. frame_num)
            break
        end

    elseif phase == "wait_register_resolution" then
        if s.script == SCRIPT_GAMEPLAY then
            hold_start_register = false
            hold_a_register = false
            register_seq = 0
            update_requested_input(0)
            gameplay_entry = frame_num
            phase = "capture_gameplay"
            log("gameplay_entry_post_register_frame=" .. frame_num)
        elseif s.script == SCRIPT_FILE_SELECT and s.ready == 1 and s.ppu == 0 then
            hold_start_register = false
            hold_a_register = false
            register_seq = 0
            hold_start_file_select = true
            phase = "wait_branch"
            phase_frame = frame_num
            log("returned_to_file_select_frame=" .. frame_num .. " action=resume_hold_start_file_select")
        elseif hold_start_register and s.sub >= 4 and s.ready == 1 then
            hold_start_register = false
            hold_a_register = false
            register_seq = 1
            register_seq_start = frame_num
            log("action=register_sequence_begin frame=" .. frame_num)
        elseif frame_num >= phase_frame + 2400 then
            hold_start_register = false
            hold_a_register = false
            register_seq = 0
            update_requested_input(0)
            log("register_resolution_timeout_frame=" .. frame_num)
            break
        end

    elseif phase == "wait_gameplay_after_other" then
        if s.script == SCRIPT_GAMEPLAY then
            gameplay_entry = frame_num
            phase = "capture_gameplay"
            log("gameplay_entry_after_other_frame=" .. frame_num)
        elseif frame_num >= phase_frame + 1200 then
            log("other_branch_timeout_frame=" .. frame_num)
            break
        end

    elseif phase == "capture_gameplay" and gameplay_entry ~= nil then
        local delta = frame_num - gameplay_entry
        if delta == 120 then
            client.screenshot(capture_path)
            log("screenshot=" .. capture_path)
            log_state("capture_state", frame_num, s)
            break
        end
    end

    prev_script = s.script
    prev_sub = s.sub
    prev_ready = s.ready
    prev_ppu = s.ppu
    prev_btn_press = s.btn_press
    prev_btn_hold = s.btn_hold
end

update_requested_input(0)
pump_requested_input()
log("final_phase=" .. phase)
log("branch_script=" .. tostring(branch_script))
log("gameplay_entry_frame=" .. tostring(gameplay_entry))
log("final_frame=" .. frame_num)
log("=== NES GAMEPLAY VISUAL CAPTURE COMPLETE ===")
log_file:close()
client.exit()
