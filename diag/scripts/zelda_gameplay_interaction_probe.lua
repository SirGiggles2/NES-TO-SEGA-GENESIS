-- zelda_gameplay_interaction_probe.lua
local ROM_VERSION = "zelda_v601"
local MAX_FRAMES = 18000

local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR = OUT_DIR .. "screens\\"
local OUT_PATH = OUT_DIR .. "gameplay_interaction_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY = 0xFF0011
local ADDR_SCRIPT = 0xFF0012
local ADDR_SUBSCRIPT = 0xFF0013
local ADDR_PPU_LOAD_IDX = 0xFF0014
local ADDR_RENDERING_FLAG = 0xFF0017
local ADDR_CUR_SLOT = 0xFF0016
local ADDR_MAP_LOCATION = 0xFF00EB
local ADDR_NEXT_MAP_LOCATION = 0xFF00EC
local ADDR_PAUSE_FLAG = 0xFF00E0
local ADDR_PAUSE_SCRIPT = 0xFF00E1
local ADDR_SCREEN_TRANS = 0xFF00E3
local ADDR_PREV_SCREEN_TRANS = 0xFF00F3
local ADDR_POS_X_LINK = 0xFF0070
local ADDR_CURTAIN_COUNTER = 0xFF007C
local ADDR_CURTAIN_COUNTER_NEXT = 0xFF007D
local ADDR_POS_Y_LINK = 0xFF0084
local ADDR_DIR_LINK = 0xFF0098
local ADDR_TIMER_LINK = 0xFF0028
local ADDR_ROOM_ITEM_FLAG = 0xFF00BF
local ADDR_ENEMY_CNT = 0xFF034E
local ADDR_SPR_INDEX_1 = 0xFF0343
local ADDR_JOY_OVERRIDE = 0xFFEE90
local ADDR_JOY_ENABLE = 0xFFEE91
local ADDR_JOY_MIRROR = 0xFF00F0
local ADDR_BTN_PRESS = 0xFF00F8
local ADDR_BTN_HOLD = 0xFF00FA
local ADDR_SLOT_0 = 0xFF0633
local ADDR_SLOT_1 = 0xFF0634
local ADDR_SLOT_2 = 0xFF0635
local ADDR_SLOT_3 = 0xFF0636
local ADDR_SLOT_4 = 0xFF0637
local ADDR_MESSAGE = 0xFF0415
local ADDR_CURRENT_QUEST = 0xFF062D
local ADDR_ITEM_HEARTS = 0xFF066F
local ADDR_ROOM_GATE = 0xFF005A
local ADDR_CURTAIN_COL = 0xFF00E8
local ADDR_ROOM_MASK = 0xFF00EE
local ADDR_BUFFER_INDEX = 0xFF0301
local ADDR_ROOM_PHASE = 0xFF051C
local ADDR_ROOM_SCRIPT = 0xFF051F
local ADDR_COLUMNS_TABLE_LO = 0xFF6827
local ADDR_COLUMNS_TABLE_HI = 0xFF6828
local ADDR_CANARY = 0xFFEE80
local ADDR_TRACE_LAST = 0xFFF000
local ADDR_TRACE_SEQ = 0xFFF002
local ADDR_TRACE_RING = 0xFFF010
local ADDR_TRACE_SEQ_PTR_RAW = 0xFFF094
local ADDR_TRACE_SEQ_PTR_RES = 0xFFF098
local ADDR_TRACE_SEQ_INDEX = 0xFFF09C
local ADDR_TRACE_SEQ_BYTE = 0xFFF09E
local ADDR_TRACE_SEQ_SOURCE = 0xFFF0A0

local BTN_RIGHT = 0x01
local BTN_LEFT = 0x02
local BTN_DOWN = 0x04
local BTN_UP = 0x08
local BTN_START = 0x10
local BTN_SELECT = 0x20
local BTN_A = 0x80

local SCRIPT_TITLE = 0x00
local SCRIPT_FILE_SELECT = 0x01
local SCRIPT_GAMEPLAY = 0x05
local SCRIPT_REGISTER = 0x0E
local SCRIPT_ELIMINATION = 0x0F

local TITLE_SETTLE_FRAMES = 20
local FILE_SELECT_SETTLE_FRAMES = 20
local OTHER_BRANCH_TIMEOUT = 900
local REGISTER_TIMEOUT = 1800
local GAMEPLAY_READY_TIMEOUT = 600
local GAMEPLAY_SETTLE_FRAMES = 30
local MOVEMENT_HOLD_FRAMES = 45
local MOVEMENT_SETTLE_FRAMES = 20
local PAUSE_PULSE_FRAMES = 24
local PAUSE_TIMEOUT_FRAMES = 90
local POST_PAUSE_SETTLE_FRAMES = 20
local TRANSITION_HOLD_FRAMES = 240
local TRANSITION_ATTEMPT_SETTLE = 20
local TRANSITION_SETTLE_TIMEOUT = 1800
local TRANSITION_STABLE_REQUIRED = 60
local PAUSE_TRACE_EXTRA_FRAMES = 24
local TRANSITION_TRACE_PRE_DETECT_FRAMES = TRANSITION_HOLD_FRAMES + 6
local TRANSITION_TRACE_POST_DETECT_FRAMES = 90
local WRITE_WATCH_START = 1
local WRITE_WATCH_END = 2060

local TRANSITION_ATTEMPTS = {
    { label = "RIGHT", mask = BTN_RIGHT },
    { label = "DOWN", mask = BTN_DOWN },
    { label = "LEFT", mask = BTN_LEFT },
    { label = "UP", mask = BTN_UP },
}

memory.usememorydomain("M68K BUS")

local function ensure_dirs()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
    os.execute('if not exist "' .. SHOT_DIR .. '" mkdir "' .. SHOT_DIR .. '"')
end

ensure_dirs()

local log_file = assert(io.open(OUT_PATH, "w"))
local shots = {}

local function should_echo_console(msg)
    return not (
        msg:match("^state frame=") or
        msg:match("^heartbeat frame=") or
        msg:match("^pause_trace frame=") or
        msg:match("^transition_trace frame=") or
        msg:match("^transition_stall frame=")
    )
end

local function log(msg)
    if log_file then
        log_file:write(msg .. "\n")
        log_file:flush()
    end
    if should_echo_console(msg) then
        print(msg)
    end
end

local function shot(name)
    local full = SHOT_DIR .. name
    client.screenshot(full)
    shots[#shots + 1] = full
    log("screenshot=" .. full)
end

local function hexn(value, width)
    return string.format("%0" .. tostring(width or 2) .. "X", value or 0)
end

local function hex2(value)
    return hexn(value, 2)
end

local function hex4(value)
    return hexn(value, 4)
end

local function bool_str(value)
    return value and "true" or "false"
end

local function read_reg(name)
    local em = rawget(_G, "emu")
    if type(em) ~= "table" then
        return 0
    end
    if type(em.getregister) == "function" then
        local ok, value = pcall(em.getregister, name)
        if ok and type(value) == "number" then
            return value
        end
    end
    if type(em.getregisters) == "function" then
        local ok, regs = pcall(em.getregisters)
        if ok and type(regs) == "table" then
            for _, key in ipairs({ name, "M68K PC", "68K PC", "PC", "pc", "PPC" }) do
                if type(regs[key]) == "number" then
                    return regs[key]
                end
            end
        end
    end
    return 0
end

local function copy_state(s)
    local out = {}
    for k, v in pairs(s) do
        out[k] = v
    end
    return out
end

local function joypad_targets(mask)
    local right_pressed = (mask & BTN_RIGHT) ~= 0
    local left_pressed = (mask & BTN_LEFT) ~= 0
    local down_pressed = (mask & BTN_DOWN) ~= 0
    local up_pressed = (mask & BTN_UP) ~= 0
    local start_pressed = (mask & BTN_START) ~= 0
    local select_pressed = (mask & BTN_SELECT) ~= 0
    local a_pressed = (mask & BTN_A) ~= 0
    return {
        {
            payload = {
                Start = start_pressed, Up = up_pressed, Down = down_pressed,
                Left = left_pressed, Right = right_pressed,
                A = a_pressed, B = false, C = select_pressed, Mode = false,
            },
            device = 1,
        },
        {
            payload = {
                ["P1 Start"] = start_pressed, ["P1 Up"] = up_pressed, ["P1 Down"] = down_pressed,
                ["P1 Left"] = left_pressed, ["P1 Right"] = right_pressed,
                ["P1 A"] = a_pressed, ["P1 B"] = false, ["P1 C"] = select_pressed, ["P1 Mode"] = false,
            },
            device = nil,
        },
        {
            payload = { Start = start_pressed, Up = up_pressed, Down = down_pressed, Left = left_pressed, Right = right_pressed },
            device = 1,
        },
        {
            payload = { ["P1 Start"] = start_pressed, ["P1 Up"] = up_pressed, ["P1 Down"] = down_pressed, ["P1 Left"] = left_pressed, ["P1 Right"] = right_pressed },
            device = nil,
        },
    }
end

local function apply_input(mask)
    memory.write_u8(ADDR_JOY_OVERRIDE, mask)
    memory.write_u8(ADDR_JOY_ENABLE, mask ~= 0 and 1 or 0)
    local jp = rawget(_G, "joypad")
    if type(jp) ~= "table" or type(jp.set) ~= "function" then
        return mask ~= 0
    end
    for _, target in ipairs(joypad_targets(mask)) do
        local ok
        if target.device == nil then
            ok = pcall(jp.set, target.payload)
        else
            ok = pcall(jp.set, target.payload, target.device)
        end
        if ok then
            return true
        end
    end
    return false
end

local function clear_buttons()
    memory.write_u8(ADDR_JOY_OVERRIDE, 0)
    memory.write_u8(ADDR_JOY_ENABLE, 0)
    apply_input(0)
end

local function safe_read_u8(addr)
    if addr == nil or addr < 0 then
        return nil
    end
    local ok, value = pcall(memory.read_u8, addr)
    if ok then
        return value
    end
    return nil
end

local function safe_read_u16_be(addr)
    if addr == nil or addr < 0 then
        return nil
    end
    local ok, value = pcall(memory.read_u16_be, addr)
    if ok then
        return value
    end
    return nil
end

local function read_trace_ring(trace_seq, count)
    local items = {}
    local ring_count = count or 8
    local next_slot = trace_seq & 0x1F
    local start_slot = (next_slot - ring_count) & 0x1F
    for i = 0, ring_count - 1 do
        local slot = (start_slot + i) & 0x1F
        local value = safe_read_u16_be(ADDR_TRACE_RING + (slot * 2)) or 0
        items[#items + 1] = hex4(value)
    end
    return table.concat(items, ",")
end

local function read_state()
    local trace_source = memory.read_u16_be(ADDR_TRACE_SEQ_SOURCE) or 0
    local trace_ptr_res_full = memory.read_u32_be(ADDR_TRACE_SEQ_PTR_RES) or 0
    local trace_ptr_peek0 = safe_read_u8(trace_ptr_res_full)
    local trace_ptr_peek1 = safe_read_u8(trace_ptr_res_full + 1)
    local trace_ptr_peek2 = safe_read_u8(trace_ptr_res_full + 2)
    local trace_ptr_peek3 = safe_read_u8(trace_ptr_res_full + 3)
    return {
        ready = memory.read_u8(ADDR_READY),
        script = memory.read_u8(ADDR_SCRIPT),
        sub = memory.read_u8(ADDR_SUBSCRIPT),
        ppu = memory.read_u8(ADDR_PPU_LOAD_IDX),
        rendering = memory.read_u8(ADDR_RENDERING_FLAG),
        slot = memory.read_u8(ADDR_CUR_SLOT),
        slot0 = memory.read_u8(ADDR_SLOT_0),
        slot1 = memory.read_u8(ADDR_SLOT_1),
        slot2 = memory.read_u8(ADDR_SLOT_2),
        slot3 = memory.read_u8(ADDR_SLOT_3),
        slot4 = memory.read_u8(ADDR_SLOT_4),
        map = memory.read_u8(ADDR_MAP_LOCATION),
        next_map = memory.read_u8(ADDR_NEXT_MAP_LOCATION),
        x = memory.read_u8(ADDR_POS_X_LINK),
        curtain = memory.read_u8(ADDR_CURTAIN_COUNTER),
        curtain_next = memory.read_u8(ADDR_CURTAIN_COUNTER_NEXT),
        y = memory.read_u8(ADDR_POS_Y_LINK),
        dir = memory.read_u8(ADDR_DIR_LINK),
        enemies = memory.read_u8(ADDR_ENEMY_CNT),
        room_item = memory.read_u8(ADDR_ROOM_ITEM_FLAG),
        message = memory.read_u8(ADDR_MESSAGE),
        quest = memory.read_u8(ADDR_CURRENT_QUEST),
        hearts = memory.read_u8(ADDR_ITEM_HEARTS),
        pause = memory.read_u8(ADDR_PAUSE_FLAG),
        pause_script = memory.read_u8(ADDR_PAUSE_SCRIPT),
        trans = memory.read_u8(ADDR_SCREEN_TRANS),
        prev_trans = memory.read_u8(ADDR_PREV_SCREEN_TRANS),
        joy = memory.read_u8(ADDR_JOY_MIRROR),
        btn_press = memory.read_u8(ADDR_BTN_PRESS),
        btn_hold = memory.read_u8(ADDR_BTN_HOLD),
        joy_override = memory.read_u8(ADDR_JOY_OVERRIDE),
        joy_enable = memory.read_u8(ADDR_JOY_ENABLE),
        room_gate = memory.read_u8(ADDR_ROOM_GATE),
        curtain_col = memory.read_u8(ADDR_CURTAIN_COL),
        room_mask = memory.read_u8(ADDR_ROOM_MASK),
        buffer_index = memory.read_u8(ADDR_BUFFER_INDEX),
        room_phase = memory.read_u8(ADDR_ROOM_PHASE),
        room_script = memory.read_u8(ADDR_ROOM_SCRIPT),
        columns_table_lo = memory.read_u8(ADDR_COLUMNS_TABLE_LO),
        columns_table_hi = memory.read_u8(ADDR_COLUMNS_TABLE_HI),
        canary = memory.read_u8(ADDR_CANARY),
        trace_last = memory.read_u16_be(ADDR_TRACE_LAST) or 0,
        trace_seq = memory.read_u16_be(ADDR_TRACE_SEQ) or 0,
        trace_ptr_raw = memory.read_u16_be(ADDR_TRACE_SEQ_PTR_RAW) or 0,
        trace_ptr_res_full = trace_ptr_res_full,
        trace_ptr_res = memory.read_u16_be(ADDR_TRACE_SEQ_PTR_RES + 2) or 0,
        trace_ptr_peek0 = trace_ptr_peek0 or 0,
        trace_ptr_peek1 = trace_ptr_peek1 or 0,
        trace_ptr_peek2 = trace_ptr_peek2 or 0,
        trace_ptr_peek3 = trace_ptr_peek3 or 0,
        trace_ptr_peek_mask = ((trace_ptr_peek0 and 1 or 0) << 3)
            | ((trace_ptr_peek1 and 1 or 0) << 2)
            | ((trace_ptr_peek2 and 1 or 0) << 1)
            | (trace_ptr_peek3 and 1 or 0),
        trace_idx = memory.read_u16_be(ADDR_TRACE_SEQ_INDEX) or 0,
        trace_byte = memory.read_u16_be(ADDR_TRACE_SEQ_BYTE) or 0,
        trace_source = trace_source,
        trace_lookup_idx = (trace_source >> 8) & 0xFF,
        trace_repeat = trace_source & 0xFF,
        trace_ring = read_trace_ring(memory.read_u16_be(ADDR_TRACE_SEQ) or 0, 8),
        timer = memory.read_u8(ADDR_TIMER_LINK),
        spr_idx_1 = memory.read_u8(ADDR_SPR_INDEX_1),
        pc = read_reg("M68K PC"),
    }
end

local function log_state(prefix, s, phase_name, frame_no, input_mask)
    log(string.format(
        "%s frame=%d script=%d sub=%d ready=%d ppu=0x%02X render=%02X slot=%d active=[%02X,%02X,%02X,%02X,%02X] map=%02X next=%02X x=%02X y=%02X dir=%02X enemy_cnt=%d room_item=%02X msg=%02X quest=%02X hearts=%02X joy=%02X btn=[%02X,%02X] ov=[%02X,%02X] pause=[%d,%d] trans=[%d,%d] room=[%02X,%02X,%02X,%02X] curtain=[%02X,%02X,%02X] buf=%02X cols=[%02X,%02X] canary=%02X trace=[%04X,%04X] ring=[%s] seqdbg=[%04X,%04X,%04X,%04X] seqptr=%08X peek=[%02X,%02X,%02X,%02X] peekok=%X seqsrc=[%02X,%02X] pc=%06X timer=%d spr1=%02X input=%02X phase=%s",
        prefix, frame_no, s.script, s.sub, s.ready, s.ppu, s.rendering, s.slot,
        s.slot0, s.slot1, s.slot2, s.slot3, s.slot4,
        s.map, s.next_map, s.x, s.y, s.dir, s.enemies, s.room_item,
        s.message, s.quest, s.hearts, s.joy, s.btn_press, s.btn_hold,
        s.joy_override, s.joy_enable, s.pause, s.pause_script,
        s.trans, s.prev_trans, s.room_gate, s.room_mask, s.room_phase, s.room_script,
        s.curtain, s.curtain_next, s.curtain_col, s.buffer_index,
        s.columns_table_lo, s.columns_table_hi,
        s.canary, s.trace_last, s.trace_seq, s.trace_ring, s.trace_ptr_raw, s.trace_ptr_res,
        s.trace_idx, s.trace_byte, s.trace_ptr_res_full,
        s.trace_ptr_peek0, s.trace_ptr_peek1, s.trace_ptr_peek2, s.trace_ptr_peek3, s.trace_ptr_peek_mask,
        s.trace_lookup_idx, s.trace_repeat, s.pc, s.timer, s.spr_idx_1, input_mask or 0,
        phase_name
    ))
end

local function log_focus(prefix, s, phase_name, frame_no, input_mask)
    log(string.format(
        "%s frame=%d script=%d sub=%d ready=%d ppu=%02X render=%02X map=%02X next=%02X x=%02X y=%02X joy=%02X btn=[%02X,%02X] ov=[%02X,%02X] pause=[%d,%d] trans=[%d,%d] room=[%02X,%02X,%02X,%02X] curtain=[%02X,%02X,%02X] buf=%02X cols=[%02X,%02X] canary=%02X trace=[%04X,%04X] ring=[%s] seqdbg=[%04X,%04X,%04X,%04X] seqptr=%08X peek=[%02X,%02X,%02X,%02X] peekok=%X seqsrc=[%02X,%02X] pc=%06X input=%02X phase=%s",
        prefix, frame_no, s.script, s.sub, s.ready, s.ppu, s.rendering, s.map, s.next_map, s.x, s.y,
        s.joy, s.btn_press, s.btn_hold, s.joy_override, s.joy_enable,
        s.pause, s.pause_script, s.trans, s.prev_trans,
        s.room_gate, s.room_mask, s.room_phase, s.room_script,
        s.curtain, s.curtain_next, s.curtain_col, s.buffer_index,
        s.columns_table_lo, s.columns_table_hi,
        s.canary, s.trace_last, s.trace_seq, s.trace_ring, s.trace_ptr_raw, s.trace_ptr_res,
        s.trace_idx, s.trace_byte, s.trace_ptr_res_full,
        s.trace_ptr_peek0, s.trace_ptr_peek1, s.trace_ptr_peek2, s.trace_ptr_peek3, s.trace_ptr_peek_mask,
        s.trace_lookup_idx, s.trace_repeat, s.pc, input_mask or 0, phase_name
    ))
end

local frame_num = 0
local phase = "wait_title_ready"
local phase_frame = nil
local gameplay_entry = nil
local gameplay_ready_frame = nil
local gameplay_baseline = nil
local branch_script = nil

local hold_start_title = false
local hold_start_file_select = false
local hold_start_register = false
local register_seq = 0
local register_seq_frame = 0

local title_shot = false
local file_shot = false
local branch_shot = false

local prev_script = 0xFF
local prev_sub = 0xFF
local last_input_mask = 0

local pulse_mask = 0
local pulse_until = -1

local movement_start = nil
local movement_end = nil
local movement_pass = false
local movement_direction = "RIGHT"

local pause_initial = nil
local pause_on_frame = nil
local pause_off_frame = nil
local pause_on_pass = false
local pause_off_pass = false
local pause_pass = false
local pause_input = "SELECT"
local pause_initial_script = nil
local pause_select_joy_frame = nil
local pause_select_press_frame = nil
local pause_select_hold_frame = nil
local pause_pause_script_frame = nil
local pause_trace_until = -1

local transition_attempt_index = 0
local transition_attempt_label = nil
local transition_attempt_mask = 0
local transition_map_before = nil
local transition_next_before = nil
local transition_detected_frame = nil
local transition_detected_map = nil
local transition_detected_next_map = nil
local transition_detected_script = nil
local transition_detected_trans = nil
local transition_stable_frame = nil
local transition_stable_count = 0
local room_transition_pass = false
local room_transition_map_after = nil
local transition_script3_sub8_frame = nil
local transition_trace_until = -1

local function in_write_watch_window(event_frame)
    return event_frame >= WRITE_WATCH_START and event_frame <= WRITE_WATCH_END
end

local write_watch_ok = false
local write_watch_registered = 0
local ev = rawget(_G, "event")
if type(ev) == "table" and type(ev.onmemorywrite) == "function" then
    local function current_watch_frame()
        if type(emu) == "table" and type(emu.framecount) == "function" then
            local ok, value = pcall(emu.framecount)
            if ok and type(value) == "number" then
                return value
            end
        end
        return frame_num
    end

    local function register_write_watch(name, addr)
        local function callback(_, value)
            local event_frame = current_watch_frame()
            if not in_write_watch_window(event_frame) then
                return
            end
            local write_val = value or memory.read_u8(addr) or 0
            log(string.format(
                "write_watch frame=%d name=%s value=%02X pc=%06X script=%02X sub=%02X map=%02X next=%02X room=[%02X,%02X,%02X,%02X] trans=[%02X,%02X]",
                event_frame,
                name,
                write_val,
                read_reg("M68K PC"),
                memory.read_u8(ADDR_SCRIPT),
                memory.read_u8(ADDR_SUBSCRIPT),
                memory.read_u8(ADDR_MAP_LOCATION),
                memory.read_u8(ADDR_NEXT_MAP_LOCATION),
                memory.read_u8(ADDR_ROOM_GATE),
                memory.read_u8(ADDR_ROOM_MASK),
                memory.read_u8(ADDR_ROOM_PHASE),
                memory.read_u8(ADDR_ROOM_SCRIPT),
                memory.read_u8(ADDR_SCREEN_TRANS),
                memory.read_u8(ADDR_PREV_SCREEN_TRANS)
            ))
        end

        local ok, err = pcall(function()
            ev.onmemorywrite(callback, addr, "watch_" .. name, "M68K BUS")
        end)
        if ok then
            write_watch_ok = true
            write_watch_registered = write_watch_registered + 1
            log(string.format("write_watch_registered name=%s addr=%06X api=domain", name, addr))
            return
        end

        local ok2, err2 = pcall(function()
            ev.onmemorywrite(callback, addr, "watch_" .. name)
        end)
        if ok2 then
            write_watch_ok = true
            write_watch_registered = write_watch_registered + 1
            log(string.format("write_watch_registered name=%s addr=%06X api=label", name, addr))
            return
        end

        local ok3, err3 = pcall(function()
            ev.onmemorywrite(callback, addr)
        end)
        if ok3 then
            write_watch_ok = true
            write_watch_registered = write_watch_registered + 1
            log(string.format("write_watch_registered name=%s addr=%06X api=addr", name, addr))
            return
        end

        log(string.format(
            "write_watch_register_failed name=%s addr=%06X err1=%s err2=%s err3=%s",
            name,
            addr,
            tostring(err),
            tostring(err2),
            tostring(err3)
        ))
    end

    register_write_watch("script", ADDR_SCRIPT)
    register_write_watch("subscript", ADDR_SUBSCRIPT)
    register_write_watch("map", ADDR_MAP_LOCATION)
    register_write_watch("next_map", ADDR_NEXT_MAP_LOCATION)
    register_write_watch("room_gate", ADDR_ROOM_GATE)
    register_write_watch("room_phase", ADDR_ROOM_PHASE)
    register_write_watch("ram_6BAD", 0xFF6BAD)
end

if write_watch_ok then
    log(string.format(
        "write_watch=ACTIVE frames=%d-%d registrations=%d",
        WRITE_WATCH_START,
        WRITE_WATCH_END,
        write_watch_registered
    ))
else
    log("write_watch=UNAVAILABLE")
end

local function set_pulse(mask, duration)
    local pulse_frames = duration or PAUSE_PULSE_FRAMES
    pulse_mask = mask
    pulse_until = frame_num + pulse_frames - 1
end

local function start_transition_attempt(s, index)
    if index > #TRANSITION_ATTEMPTS then
        transition_attempt_label = nil
        transition_attempt_mask = 0
        log("room_transition_exhausted=true")
        return false
    end
    local attempt = TRANSITION_ATTEMPTS[index]
    transition_attempt_index = index
    transition_attempt_label = attempt.label
    transition_attempt_mask = attempt.mask
    transition_map_before = s.map
    transition_next_before = s.next_map
    phase = "transition_hold"
    phase_frame = frame_num
    transition_trace_until = frame_num + TRANSITION_TRACE_PRE_DETECT_FRAMES
    log(string.format(
        "room_transition_attempt_frame=%d direction=%s map_before=%02X next_before=%02X x=%02X y=%02X",
        frame_num, transition_attempt_label, s.map, s.next_map, s.x, s.y
    ))
    return true
end

log("=== GAMEPLAY INTERACTION PROBE " .. ROM_VERSION .. " ===")
log("Driving title -> file select -> gameplay, then validating movement, pause, and room transition.")
log("")

while frame_num < MAX_FRAMES do
    local input_mask = 0
    if pulse_until >= frame_num then
        input_mask = pulse_mask
    elseif hold_start_title or hold_start_file_select or hold_start_register then
        input_mask = BTN_START
    elseif register_seq > 0 then
        local step = (frame_num - register_seq_frame) % 24
        if step == 0 then
            input_mask = BTN_A
        elseif step == 8 then
            input_mask = BTN_SELECT
        elseif step == 16 then
            input_mask = BTN_START
        end
    elseif phase == "movement_right" then
        input_mask = BTN_RIGHT
    elseif phase == "transition_hold" then
        input_mask = transition_attempt_mask
    end

    last_input_mask = input_mask
    if input_mask ~= 0 then
        apply_input(input_mask)
    else
        clear_buttons()
    end

    emu.frameadvance()
    frame_num = frame_num + 1
    local s = read_state()

    if s.script ~= prev_script or s.sub ~= prev_sub then
        log_state("state", s, phase, frame_num, last_input_mask)
    elseif frame_num % 180 == 0 then
        log_state("heartbeat", s, phase, frame_num, last_input_mask)
    end

    -- v638 diagnostic: trace ram_0526 and ram_6BAD during init phase
    if frame_num <= 800 then
        local v0526 = memory.read_u8(0xFF0526)
        local v6BAD = memory.read_u8(0xFF6BAD)
        local vDL = memory.read_u8(0xFF0010)
        local vQuest = memory.read_u8(0xFF062D)
        local vSlot = memory.read_u8(0xFF0016)
        if frame_num >= 490 and frame_num <= 760 then
            -- Per-frame trace in the critical window
            log(string.format("init_trace frame=%d script=%d sub=%d map=%02X ram0526=%02X ram6BAD=%02X dungeon=%02X quest=%02X slot=%02X q0=%02X q1=%02X q2=%02X", frame_num, s.script, s.sub, s.map, v0526, v6BAD, vDL, vQuest, vSlot, memory.read_u8(0xFF062D), memory.read_u8(0xFF062E), memory.read_u8(0xFF062F)))
        elseif v0526 ~= (init_prev_0526 or -1) or v6BAD ~= (init_prev_6BAD or -1) or s.map ~= (init_prev_map or -1) then
            log(string.format("init_trace frame=%d script=%d sub=%d map=%02X ram0526=%02X ram6BAD=%02X dungeon=%02X", frame_num, s.script, s.sub, s.map, v0526, v6BAD, vDL))
        end
        init_prev_0526 = v0526
        init_prev_6BAD = v6BAD
        init_prev_map = s.map
    end

    if phase == "wait_pause_on" or phase == "wait_pause_off_pulse" or phase == "wait_pause_off" then
        if frame_num <= pause_trace_until then
            log_focus("pause_trace", s, phase, frame_num, last_input_mask)
        end
        if pause_select_joy_frame == nil and (s.joy & BTN_SELECT) ~= 0 then
            pause_select_joy_frame = frame_num
        end
        if pause_select_press_frame == nil and (s.btn_press & BTN_SELECT) ~= 0 then
            pause_select_press_frame = frame_num
        end
        if pause_select_hold_frame == nil and (s.btn_hold & BTN_SELECT) ~= 0 then
            pause_select_hold_frame = frame_num
        end
        if pause_pause_script_frame == nil and pause_initial_script ~= nil and s.pause_script ~= pause_initial_script then
            pause_pause_script_frame = frame_num
        end
    end

    if phase == "transition_hold" and frame_num <= transition_trace_until then
        log_focus("transition_trace", s, phase, frame_num, last_input_mask)
    elseif phase == "wait_transition_stable" then
        if frame_num <= transition_trace_until then
            log_focus("transition_trace", s, phase, frame_num, last_input_mask)
        elseif s.script == 3 and s.sub == 8 and frame_num % 60 == 0 then
            log_focus("transition_stall", s, phase, frame_num, last_input_mask)
        end
        if transition_script3_sub8_frame == nil and s.script == 3 and s.sub == 8 then
            transition_script3_sub8_frame = frame_num
        end
    end

    if phase == "wait_title_ready" then
        if s.script == SCRIPT_TITLE and s.sub == 0 and s.ready == 1 and s.ppu == 0 then
            if not title_shot then
                shot(ROM_VERSION .. "_interaction_title_ready_f" .. frame_num .. ".png")
                title_shot = true
                phase_frame = frame_num
                log("title_ready_frame=" .. frame_num)
            elseif frame_num >= phase_frame + TITLE_SETTLE_FRAMES then
                hold_start_title = true
                phase = "wait_title_exit"
                phase_frame = frame_num
                log("action=hold_start_title frame=" .. frame_num)
            end
        end
    elseif phase == "wait_title_exit" then
        if s.script ~= SCRIPT_TITLE then
            hold_start_title = false
            phase = "wait_file_select"
            phase_frame = frame_num
            log("title_exit_detected frame=" .. frame_num)
        end
    elseif phase == "wait_file_select" then
        if s.script == SCRIPT_FILE_SELECT and s.ready == 1 and s.ppu == 0 then
            if not file_shot then
                shot(ROM_VERSION .. "_interaction_file_select_ready_f" .. frame_num .. ".png")
                file_shot = true
                phase_frame = frame_num
                log("file_select_ready_frame=" .. frame_num)
            elseif frame_num >= phase_frame + FILE_SELECT_SETTLE_FRAMES then
                hold_start_file_select = true
                phase = "wait_branch"
                phase_frame = frame_num
                log("action=hold_start_file_select frame=" .. frame_num)
            end
        end
    elseif phase == "wait_branch" then
        if s.script ~= SCRIPT_FILE_SELECT then
            hold_start_file_select = false
            branch_script = s.script
            if not branch_shot then
                shot(ROM_VERSION .. "_interaction_branch_f" .. frame_num .. ".png")
                branch_shot = true
            end
            log("branch_frame=" .. frame_num .. " branch_script=" .. s.script)
            if s.script == SCRIPT_GAMEPLAY then
                gameplay_entry = frame_num
                phase = "wait_gameplay_ready"
                phase_frame = frame_num
                log("")
                log("*** GAMEPLAY ENTRY ***")
                log_state("entry", s, phase, frame_num, last_input_mask)
                shot(ROM_VERSION .. "_interaction_gameplay_entry_f" .. frame_num .. ".png")
            elseif s.script == SCRIPT_REGISTER or s.script == SCRIPT_ELIMINATION then
                hold_start_register = true
                register_seq = 0
                phase = "wait_register_resolution"
                phase_frame = frame_num
                log("non_gameplay_branch_detected=" .. s.script .. " -> continue driving register flow")
            else
                phase = "wait_gameplay_after_other"
                phase_frame = frame_num
                log("other_branch_detected=" .. s.script .. " -> continue observing for gameplay")
            end
        elseif frame_num >= phase_frame + 180 then
            phase = "timed_out_wait_branch"
            log("branch_timeout_frame=" .. frame_num)
            break
        end
    elseif phase == "wait_gameplay_after_other" then
        if s.script == SCRIPT_GAMEPLAY then
            gameplay_entry = frame_num
            phase = "wait_gameplay_ready"
            phase_frame = frame_num
            log("")
            log("*** GAMEPLAY ENTRY (AFTER OTHER BRANCH) ***")
            log_state("entry", s, phase, frame_num, last_input_mask)
            shot(ROM_VERSION .. "_interaction_gameplay_entry_after_other_f" .. frame_num .. ".png")
        elseif frame_num >= phase_frame + OTHER_BRANCH_TIMEOUT then
            phase = "timed_out_after_other_branch"
            log("other_branch_timeout_frame=" .. frame_num)
            break
        end
    elseif phase == "wait_register_resolution" then
        if s.script == SCRIPT_GAMEPLAY then
            hold_start_register = false
            register_seq = 0
            gameplay_entry = frame_num
            phase = "wait_gameplay_ready"
            phase_frame = frame_num
            log("")
            log("*** GAMEPLAY ENTRY (POST-REGISTER) ***")
            log_state("entry", s, phase, frame_num, last_input_mask)
            shot(ROM_VERSION .. "_interaction_gameplay_entry_post_register_f" .. frame_num .. ".png")
        elseif s.script == SCRIPT_FILE_SELECT and s.ready == 1 and s.ppu == 0 then
            hold_start_register = false
            register_seq = 0
            hold_start_file_select = true
            phase = "wait_branch"
            phase_frame = frame_num
            log("returned_to_file_select_frame=" .. frame_num .. " action=resume_hold_start_file_select")
        elseif hold_start_register and s.sub >= 4 and s.ready == 1 then
            hold_start_register = false
            register_seq = 1
            register_seq_frame = frame_num
            log("action=register_sequence_begin frame=" .. frame_num)
        elseif frame_num >= phase_frame + REGISTER_TIMEOUT then
            phase = "timed_out_register_resolution"
            log("register_resolution_timeout_frame=" .. frame_num)
            break
        end
    elseif phase == "wait_gameplay_ready" then
        if s.script == SCRIPT_GAMEPLAY and s.ready == 1 then
            gameplay_ready_frame = frame_num
            gameplay_baseline = copy_state(s)
            phase = "settle_gameplay"
            phase_frame = frame_num
            log("gameplay_ready_frame=" .. frame_num)
            shot(ROM_VERSION .. "_interaction_gameplay_ready_f" .. frame_num .. ".png")
        elseif frame_num >= phase_frame + GAMEPLAY_READY_TIMEOUT then
            phase = "timed_out_wait_gameplay_ready"
            log("gameplay_ready_timeout_frame=" .. frame_num)
            break
        end
    elseif phase == "settle_gameplay" then
        if frame_num >= phase_frame + GAMEPLAY_SETTLE_FRAMES then
            movement_start = copy_state(s)
            phase = "movement_right"
            phase_frame = frame_num
            log("movement_begin_frame=" .. frame_num .. " movement_direction=" .. movement_direction)
        end
    elseif phase == "movement_right" then
        if frame_num >= phase_frame + MOVEMENT_HOLD_FRAMES then
            movement_end = copy_state(s)
            local delta_x = movement_end.x - movement_start.x
            local delta_y = movement_end.y - movement_start.y
            movement_pass = delta_x >= 4
            log("movement_end_frame=" .. frame_num)
            log("movement_initial_x=" .. movement_start.x)
            log("movement_initial_y=" .. movement_start.y)
            log("movement_final_x=" .. movement_end.x)
            log("movement_final_y=" .. movement_end.y)
            log("movement_delta_x=" .. delta_x)
            log("movement_delta_y=" .. delta_y)
            log("movement_dir_before=" .. movement_start.dir)
            log("movement_dir_after=" .. movement_end.dir)
            log("movement_pass=" .. bool_str(movement_pass))
            shot(ROM_VERSION .. "_interaction_move_f" .. frame_num .. ".png")
            phase = "movement_release"
            phase_frame = frame_num
        end
    elseif phase == "movement_release" then
        if frame_num >= phase_frame + MOVEMENT_SETTLE_FRAMES then
            pause_initial = s.pause
            pause_initial_script = s.pause_script
            phase = "wait_pause_on"
            phase_frame = frame_num
            pause_trace_until = frame_num + PAUSE_TIMEOUT_FRAMES + PAUSE_TRACE_EXTRA_FRAMES
            set_pulse(BTN_SELECT, PAUSE_PULSE_FRAMES)
            log("pause_on_pulse_frame=" .. frame_num)
            log("pause_input=" .. pause_input)
            log("pause_initial=" .. pause_initial)
            log("pause_initial_script=" .. pause_initial_script)
        end
    elseif phase == "wait_pause_on" then
        if s.pause ~= pause_initial then
            pause_on_frame = frame_num
            pause_on_pass = true
            phase = "wait_pause_off_pulse"
            phase_frame = frame_num
            pause_trace_until = frame_num + POST_PAUSE_SETTLE_FRAMES + PAUSE_TRACE_EXTRA_FRAMES
            log("pause_on_frame=" .. frame_num)
            log("pause_on_value=" .. s.pause)
            shot(ROM_VERSION .. "_interaction_pause_on_f" .. frame_num .. ".png")
        elseif frame_num >= phase_frame + PAUSE_TIMEOUT_FRAMES then
            phase = "prepare_transition"
            phase_frame = frame_num
            log("pause_on_timeout_frame=" .. frame_num)
            log("pause_on_pass=false")
        end
    elseif phase == "wait_pause_off_pulse" then
        if frame_num >= phase_frame + POST_PAUSE_SETTLE_FRAMES
            and pulse_until < frame_num
            and (s.joy & BTN_SELECT) == 0
            and (s.btn_hold & BTN_SELECT) == 0 then
            phase = "wait_pause_off"
            phase_frame = frame_num
            pause_trace_until = frame_num + PAUSE_TIMEOUT_FRAMES + PAUSE_TRACE_EXTRA_FRAMES
            set_pulse(BTN_SELECT, PAUSE_PULSE_FRAMES)
            log("pause_off_pulse_frame=" .. frame_num)
        end
    elseif phase == "wait_pause_off" then
        if s.pause == pause_initial then
            pause_off_frame = frame_num
            pause_off_pass = true
            pause_pass = pause_on_pass and pause_off_pass
            phase = "prepare_transition"
            phase_frame = frame_num
            log("pause_off_frame=" .. frame_num)
            log("pause_off_value=" .. s.pause)
            log("pause_pass=" .. bool_str(pause_pass))
            shot(ROM_VERSION .. "_interaction_pause_off_f" .. frame_num .. ".png")
        elseif frame_num >= phase_frame + PAUSE_TIMEOUT_FRAMES then
            phase = "prepare_transition"
            phase_frame = frame_num
            log("pause_off_timeout_frame=" .. frame_num)
            log("pause_off_pass=false")
            log("pause_pass=false")
        end
    elseif phase == "prepare_transition" then
        if frame_num >= phase_frame + TRANSITION_ATTEMPT_SETTLE then
            if not start_transition_attempt(s, 1) then
                phase = "transition_failed"
                break
            end
        end
    elseif phase == "transition_hold" then
        if transition_detected_frame == nil and (s.trans ~= 0 or s.map ~= transition_map_before or s.next_map ~= transition_next_before) then
            transition_detected_frame = frame_num
            transition_detected_map = s.map
            transition_detected_next_map = s.next_map
            transition_detected_script = s.script
            transition_detected_trans = s.trans
            phase = "wait_transition_stable"
            phase_frame = frame_num
            transition_trace_until = frame_num + TRANSITION_TRACE_POST_DETECT_FRAMES
            log("room_transition_detected_frame=" .. frame_num)
            log("room_transition_direction=" .. transition_attempt_label)
            log("room_transition_detected_map=" .. transition_detected_map)
            log("room_transition_detected_next_map=" .. transition_detected_next_map)
            log("room_transition_detected_script=" .. transition_detected_script)
            log("room_transition_detected_trans=" .. transition_detected_trans)
            shot(ROM_VERSION .. "_interaction_transition_detected_f" .. frame_num .. ".png")
        elseif frame_num >= phase_frame + TRANSITION_HOLD_FRAMES then
            log("room_transition_attempt_timeout_frame=" .. frame_num .. " direction=" .. transition_attempt_label)
            phase = "transition_attempt_settle"
            phase_frame = frame_num
        end
    elseif phase == "transition_attempt_settle" then
        if frame_num >= phase_frame + TRANSITION_ATTEMPT_SETTLE then
            if not start_transition_attempt(s, transition_attempt_index + 1) then
                phase = "transition_failed"
                break
            end
        end
    elseif phase == "wait_transition_stable" then
        if gameplay_baseline ~= nil and s.map ~= gameplay_baseline.map and s.script >= SCRIPT_GAMEPLAY and s.ready == 1 then
            if transition_stable_count == 0 then
                transition_stable_frame = frame_num
                room_transition_map_after = s.map
                log("room_transition_stable_start_frame=" .. frame_num)
                log("room_transition_map_after=" .. s.map)
                shot(ROM_VERSION .. "_interaction_transition_stable_f" .. frame_num .. ".png")
            end
            transition_stable_count = transition_stable_count + 1
            if transition_stable_count >= TRANSITION_STABLE_REQUIRED then
                room_transition_pass = true
                phase = "complete"
                log("room_transition_stable_count=" .. transition_stable_count)
                log("room_transition_pass=true")
                break
            end
        else
            if transition_stable_count > 0 then
                log("room_transition_stable_reset_frame=" .. frame_num)
            end
            transition_stable_count = 0
        end
        if frame_num >= phase_frame + TRANSITION_SETTLE_TIMEOUT then
            log("room_transition_settle_timeout_frame=" .. frame_num)
            phase = "transition_failed"
            break
        end
    end

    prev_script = s.script
    prev_sub = s.sub
end

clear_buttons()
if not pause_pass then
    pause_pass = pause_on_pass and pause_off_pass
end
local interaction_core_pass = movement_pass and pause_pass
local interaction_overall_pass = interaction_core_pass and room_transition_pass

log("")
log("=== SUMMARY ===")
local final = read_state()
log_state("final", final, phase, frame_num, last_input_mask)
log("final_phase=" .. phase)
log("branch_script=" .. tostring(branch_script))
log("gameplay_entry_frame=" .. tostring(gameplay_entry))
log("gameplay_ready_frame=" .. tostring(gameplay_ready_frame))
log("movement_direction=" .. movement_direction)
log("movement_pass=" .. bool_str(movement_pass))
if movement_start ~= nil and movement_end ~= nil then
    log("movement_delta_x=" .. tostring(movement_end.x - movement_start.x))
    log("movement_delta_y=" .. tostring(movement_end.y - movement_start.y))
end
log("pause_on_pass=" .. bool_str(pause_on_pass))
log("pause_off_pass=" .. bool_str(pause_off_pass))
log("pause_pass=" .. bool_str(pause_pass))
log("pause_input=" .. pause_input)
log("pause_on_frame=" .. tostring(pause_on_frame))
log("pause_off_frame=" .. tostring(pause_off_frame))
log("pause_select_joy_frame=" .. tostring(pause_select_joy_frame))
log("pause_select_press_frame=" .. tostring(pause_select_press_frame))
log("pause_select_hold_frame=" .. tostring(pause_select_hold_frame))
log("pause_pause_script_frame=" .. tostring(pause_pause_script_frame))
log("room_transition_direction=" .. tostring(transition_attempt_label))
log("room_transition_detected=" .. bool_str(transition_detected_frame ~= nil))
log("room_transition_detected_frame=" .. tostring(transition_detected_frame))
log("room_transition_pass=" .. bool_str(room_transition_pass))
log("room_transition_stable_frame=" .. tostring(transition_stable_frame))
log("room_transition_stable_count=" .. tostring(transition_stable_count))
log("room_transition_script3_sub8_frame=" .. tostring(transition_script3_sub8_frame))
log("room_transition_map_before=" .. (gameplay_baseline and hex2(gameplay_baseline.map) or "nil"))
log("room_transition_map_after=" .. (room_transition_map_after and hex2(room_transition_map_after) or "nil"))
log("room_transition_final_room_gate=" .. hex2(final.room_gate))
log("room_transition_final_room_mask=" .. hex2(final.room_mask))
log("room_transition_final_room_phase=" .. hex2(final.room_phase))
log("room_transition_final_room_script=" .. hex2(final.room_script))
log("room_transition_final_curtain=" .. hex2(final.curtain))
log("room_transition_final_curtain_next=" .. hex2(final.curtain_next))
log("room_transition_final_curtain_col=" .. hex2(final.curtain_col))
log("room_transition_final_buffer_index=" .. hex2(final.buffer_index))
log("room_transition_final_canary=" .. hex2(final.canary))
log("room_transition_final_trace_last=" .. hex4(final.trace_last))
log("room_transition_final_trace_seq=" .. hex4(final.trace_seq))
log("room_transition_final_pc=" .. hexn(final.pc, 6))
log("interaction_core_pass=" .. bool_str(interaction_core_pass))
log("interaction_overall_pass=" .. bool_str(interaction_overall_pass))
for _, path in ipairs(shots) do
    log("captured=" .. path)
end
if log_file then
    log_file:close()
end
