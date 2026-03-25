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

os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')

local log_file = assert(io.open(OUT_PATH, "w"))
local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
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
    local start_pressed = bit.band(mask, BTN_START) ~= 0
    local select_pressed = bit.band(mask, BTN_SELECT) ~= 0
    local a_pressed = bit.band(mask, BTN_A) ~= 0

    local jp = rawget(_G, "joypad")
    if type(jp) ~= "table" or type(jp.set) ~= "function" then
        return
    end

    local targets = {
        { payload = { Start = start_pressed, Select = select_pressed, A = a_pressed, B = false }, device = 1 },
        { payload = { ["P1 Start"] = start_pressed, ["P1 Select"] = select_pressed, ["P1 A"] = a_pressed, ["P1 B"] = false }, device = nil },
        { payload = { Start = start_pressed }, device = 1 },
        { payload = { ["P1 Start"] = start_pressed }, device = nil },
    }

    for _, target in ipairs(targets) do
        local ok
        if target.device == nil then
            ok = pcall(jp.set, target.payload)
        else
            ok = pcall(jp.set, target.payload, target.device)
        end
        if ok then
            return
        end
    end
end

local function read_state()
    return {
        ready = r8(0x0011),
        script = r8(0x0012),
        sub = r8(0x0013),
        ppu = r8(0x0014),
    }
end

local function log_state(prefix, frame_num, s)
    log(string.format("%s frame=%d script=%d sub=%d ready=%d ppu=%02X", prefix, frame_num, s.script, s.sub, s.ready, s.ppu))
end

log("=== NES GAMEPLAY VISUAL CAPTURE ===")
log("domain=" .. tostring(domain))
log("Capturing first fully loaded gameplay screen (entry + 120 frames).")

local phase = "wait_title_ready"
local phase_frame = 0
local frame_num = 0
local gameplay_entry = nil
local hold_start = false
local register_seq = 0
local register_seq_start = 0
local capture_path = OUT_DIR .. "ss_gameplay_nes.png"

while frame_num < MAX_FRAMES do
    local input_mask = 0
    if hold_start then
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
    end

    apply_input(input_mask)
    emu.frameadvance()
    frame_num = frame_num + 1

    local s = read_state()

    if phase == "wait_title_ready" then
        if s.script == SCRIPT_TITLE and s.sub == 0 and s.ready == 1 and s.ppu == 0 then
            if phase_frame == 0 then
                phase_frame = frame_num
                log("title_ready_frame=" .. frame_num)
            elseif frame_num >= phase_frame + 20 then
                hold_start = true
                phase = "wait_title_exit"
                log("action=hold_start_title frame=" .. frame_num)
            end
        else
            phase_frame = 0
        end

    elseif phase == "wait_title_exit" then
        if s.script ~= SCRIPT_TITLE then
            hold_start = false
            phase = "wait_file_select"
            phase_frame = frame_num
            log("title_exit_frame=" .. frame_num)
            log_state("state", frame_num, s)
        end

    elseif phase == "wait_file_select" then
        if s.script == SCRIPT_FILE_SELECT and s.ready == 1 and s.ppu == 0 then
            if frame_num >= phase_frame + 20 then
                hold_start = true
                phase = "wait_branch"
                phase_frame = frame_num
                log("action=hold_start_file_select frame=" .. frame_num)
            end
        end

    elseif phase == "wait_branch" then
        if s.script ~= SCRIPT_FILE_SELECT then
            hold_start = false
            log("branch_frame=" .. frame_num .. " branch_script=" .. s.script)
            if s.script == SCRIPT_GAMEPLAY then
                gameplay_entry = frame_num
                phase = "capture_gameplay"
                log("gameplay_entry_frame=" .. frame_num)
            elseif s.script == SCRIPT_REGISTER or s.script == SCRIPT_ELIMINATION then
                hold_start = true
                register_seq = 1
                register_seq_start = frame_num
                phase = "wait_gameplay_after_register"
                log("register_branch_frame=" .. frame_num)
            else
                phase = "wait_gameplay_after_other"
                phase_frame = frame_num
            end
        elseif frame_num >= phase_frame + 240 then
            log("branch_timeout_frame=" .. frame_num)
            break
        end

    elseif phase == "wait_gameplay_after_register" then
        if s.script == SCRIPT_GAMEPLAY then
            hold_start = false
            register_seq = 0
            gameplay_entry = frame_num
            phase = "capture_gameplay"
            log("gameplay_entry_post_register_frame=" .. frame_num)
        elseif frame_num >= phase_frame + 2400 then
            log("register_timeout_frame=" .. frame_num)
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
end

apply_input(0)
log("final_phase=" .. phase)
log("final_frame=" .. frame_num)
log("=== NES GAMEPLAY VISUAL CAPTURE COMPLETE ===")
log_file:close()
client.exit()
