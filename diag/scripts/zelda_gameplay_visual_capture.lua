-- zelda_gameplay_visual_capture.lua
-- Capture the first fully loaded gameplay screen from the Genesis port.
-- ROM_VERSION is patched by run_gameplay_visual_capture.ps1 before launch.

local ROM_VERSION = "zelda_v601"
local MAX_FRAMES = 9000

local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "gameplay_visual_capture_" .. ROM_VERSION .. ".txt"

local ADDR_READY        = 0xFF0011
local ADDR_SCRIPT       = 0xFF0012
local ADDR_SUBSCRIPT    = 0xFF0013
local ADDR_PPU_LOAD_IDX = 0xFF0014
local ADDR_CUR_SLOT     = 0xFF0016
local ADDR_SPR_INDEX_1  = 0xFF0343
local ADDR_JOY_OVERRIDE = 0xFFEE90
local ADDR_JOY_ENABLE   = 0xFFEE91

local BTN_START = 0x10
local BTN_SELECT = 0x20
local BTN_A = 0x80

local SCRIPT_TITLE = 0x00
local SCRIPT_FILE_SELECT = 0x01
local SCRIPT_GAMEPLAY = 0x05
local SCRIPT_REGISTER = 0x0E
local SCRIPT_ELIMINATION = 0x0F

memory.usememorydomain("M68K BUS")
os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')

local log_file = assert(io.open(OUT_PATH, "w"))
local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
end

local function read_state()
    return {
        ready = memory.read_u8(ADDR_READY),
        script = memory.read_u8(ADDR_SCRIPT),
        sub = memory.read_u8(ADDR_SUBSCRIPT),
        ppu = memory.read_u8(ADDR_PPU_LOAD_IDX),
        slot = memory.read_u8(ADDR_CUR_SLOT),
        spr1 = memory.read_u8(ADDR_SPR_INDEX_1),
    }
end

local function joypad_targets(mask)
    local start_pressed = (mask & BTN_START) ~= 0
    local select_pressed = (mask & BTN_SELECT) ~= 0
    local a_pressed = (mask & BTN_A) ~= 0
    return {
        { payload = { Start = start_pressed, C = select_pressed, A = a_pressed, B = false }, device = 1 },
        { payload = { ["P1 Start"] = start_pressed, ["P1 C"] = select_pressed, ["P1 A"] = a_pressed, ["P1 B"] = false }, device = nil },
        { payload = { Start = start_pressed }, device = 1 },
        { payload = { ["P1 Start"] = start_pressed }, device = nil },
    }
end

local function apply_input(mask)
    memory.write_u8(ADDR_JOY_OVERRIDE, mask)
    memory.write_u8(ADDR_JOY_ENABLE, mask ~= 0 and 1 or 0)

    local jp = rawget(_G, "joypad")
    if type(jp) ~= "table" or type(jp.set) ~= "function" then
        return
    end

    for _, target in ipairs(joypad_targets(mask)) do
        local ok
        if target.device == nil then
            ok = pcall(jp.set, target.payload)
        else
            ok = pcall(jp.set, target.payload, target.device)
        end
        if ok then return end
    end
end

local function clear_input()
    apply_input(0)
end

local function log_state(prefix, frame_num, s)
    log(string.format("%s frame=%d script=%d sub=%d ready=%d ppu=%02X slot=%d spr1=%02X", prefix, frame_num, s.script, s.sub, s.ready, s.ppu, s.slot, s.spr1))
end

log("=== GAMEPLAY VISUAL CAPTURE " .. ROM_VERSION .. " ===")
log("Capturing first fully loaded gameplay screen (entry + 120 frames).")

local phase = "wait_title_ready"
local phase_frame = nil
local frame_num = 0
local gameplay_entry = nil
local capture_path = OUT_DIR .. "ss_gameplay_genesis_" .. ROM_VERSION .. ".png"
local hold_start_title = false
local hold_start_file_select = false
local hold_start_register = false
local hold_a_register = false
local register_seq = 0
local register_seq_start = 0
local title_ready_frame = nil
local file_select_ready_frame = nil
local prev_script = 0xFF
local prev_sub = 0xFF
local branch_script = nil

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

    apply_input(input_mask)
    emu.frameadvance()
    frame_num = frame_num + 1

    local s = read_state()

    if s.script ~= prev_script or s.sub ~= prev_sub then
        log_state("state", frame_num, s)
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
        if s.script ~= SCRIPT_TITLE then
            hold_start_title = false
            phase = "wait_file_select"
            phase_frame = frame_num
            log("title_exit_frame=" .. frame_num)
            log_state("state", frame_num, s)
        elseif frame_num >= phase_frame + 300 then
            hold_start_title = false
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
        elseif frame_num >= phase_frame + 600 then
            log("file_select_timeout_frame=" .. frame_num)
            break
        end

    elseif phase == "wait_branch" then
        if s.script ~= SCRIPT_FILE_SELECT then
            hold_start_file_select = false
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
        elseif frame_num >= phase_frame + 180 then
            log("branch_timeout_frame=" .. frame_num)
            break
        end

    elseif phase == "wait_register_resolution" then
        if s.script == SCRIPT_GAMEPLAY then
            hold_start_register = false
            hold_a_register = false
            register_seq = 0
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
        elseif frame_num >= phase_frame + 1800 then
            hold_start_register = false
            hold_a_register = false
            register_seq = 0
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
end

clear_input()
log("final_phase=" .. phase)
log("branch_script=" .. tostring(branch_script))
log("gameplay_entry_frame=" .. tostring(gameplay_entry))
log("final_frame=" .. frame_num)
log("=== GAMEPLAY VISUAL CAPTURE COMPLETE ===")
log_file:close()
client.exit()
