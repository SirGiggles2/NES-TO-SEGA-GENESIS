-- zelda_frontend_probe.lua
-- Validates the front-end flow with ROM autostarts disabled:
-- title -> file select -> register/name-entry or gameplay branch
-- ROM_VERSION is patched by run_frontend_probe.ps1 before launch.

local ROM_VERSION = "zelda_v599"
local MAX_FRAMES  = 2400

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR  = OUT_DIR .. "screens\\"
local OUT_PATH  = OUT_DIR .. "frontend_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY        = 0xFF0011
local ADDR_SCRIPT       = 0xFF0012
local ADDR_SUBSCRIPT    = 0xFF0013
local ADDR_PPU_LOAD     = 0xFF0014
local ADDR_FRM_CNT      = 0xFF0015
local ADDR_CUR_SLOT     = 0xFF0016
local ADDR_BTN_PRESS    = 0xFF00F8
local ADDR_BTN_HOLD     = 0xFF00FA
local ADDR_JOY_OVERRIDE = 0xFFEE90
local ADDR_JOY_ENABLE   = 0xFFEE91
local ADDR_SLOT_0       = 0xFF0633
local ADDR_SLOT_1       = 0xFF0634
local ADDR_SLOT_2       = 0xFF0635
local ADDR_SLOT_3       = 0xFF0636
local ADDR_SLOT_4       = 0xFF0637
local ADDR_SPR_1        = 0xFF0343
local ADDR_SPR_2        = 0xFF0344
local ADDR_TRACE_LAST   = 0xFFF000
local ADDR_TRACE_SEQ    = 0xFFF002

memory.usememorydomain("M68K BUS")

local frame_num = 0
local log_file = io.open(OUT_PATH, "w")
local shots = {}

local phase = "wait_title_ready"
local phase_frame = nil
local start_hold_until = nil
local hold_start_file_select = false
local title_shot = false
local file_shot = false
local branch_shot = false
local select_attempts = 0

local prev = nil

local function log(msg)
    if log_file then
        log_file:write(msg .. "\n")
        log_file:flush()
    end
    print(msg)
end

local function ensure_dirs()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
    os.execute('if not exist "' .. SHOT_DIR .. '" mkdir "' .. SHOT_DIR .. '"')
end

local function shot(name)
    ensure_dirs()
    local full = SHOT_DIR .. name
    client.screenshot(full)
    shots[#shots + 1] = full
    log("screenshot=" .. full)
end

local function hex(v, width)
    return string.format("%0" .. tostring(width or 2) .. "X", v or 0)
end

local function read_state()
    return {
        ready      = memory.read_u8(ADDR_READY),
        script     = memory.read_u8(ADDR_SCRIPT),
        sub        = memory.read_u8(ADDR_SUBSCRIPT),
        ppu        = memory.read_u8(ADDR_PPU_LOAD),
        frm        = memory.read_u8(ADDR_FRM_CNT),
        slot       = memory.read_u8(ADDR_CUR_SLOT),
        btn_press  = memory.read_u8(ADDR_BTN_PRESS),
        btn_hold   = memory.read_u8(ADDR_BTN_HOLD),
        slot0      = memory.read_u8(ADDR_SLOT_0),
        slot1      = memory.read_u8(ADDR_SLOT_1),
        slot2      = memory.read_u8(ADDR_SLOT_2),
        slot3      = memory.read_u8(ADDR_SLOT_3),
        slot4      = memory.read_u8(ADDR_SLOT_4),
        spr1       = memory.read_u8(ADDR_SPR_1),
        spr2       = memory.read_u8(ADDR_SPR_2),
        trace_last = memory.read_u16_be(ADDR_TRACE_LAST),
        trace_seq  = memory.read_u16_be(ADDR_TRACE_SEQ),
    }
end

local function log_state(prefix, s)
    log(string.format(
        "%s frame=%d ready=%d script=%d sub=%d ppu=0x%02X frm=%d slot=%d slot_active=[%02X,%02X,%02X,%02X,%02X] btn=[%02X,%02X] spr=[%02X,%02X] trace=[%04X,%04X] phase=%s",
        prefix, frame_num, s.ready, s.script, s.sub, s.ppu, s.frm, s.slot,
        s.slot0, s.slot1, s.slot2, s.slot3, s.slot4, s.btn_press, s.btn_hold, s.spr1, s.spr2,
        s.trace_last, s.trace_seq, phase
    ))
end

local function joypad_targets(pressed, select_pressed)
    return {
        { payload = { Start = pressed, C = select_pressed, Mode = false }, device = 1 },
        { payload = { ["P1 Start"] = pressed, ["P1 C"] = select_pressed, ["P1 Mode"] = false }, device = nil },
        { payload = { Start = pressed, C = select_pressed }, device = 1 },
        { payload = { ["P1 Start"] = pressed, ["P1 C"] = select_pressed }, device = nil },
    }
end

local function apply_buttons(start_pressed, select_pressed)
    local jp = rawget(_G, "joypad")
    local pressed_mask = 0
    if start_pressed then
        pressed_mask = pressed_mask | 0x10
    end
    if select_pressed then
        pressed_mask = pressed_mask | 0x20
    end

    memory.write_u8(ADDR_JOY_OVERRIDE, pressed_mask)
    memory.write_u8(ADDR_JOY_ENABLE, pressed_mask ~= 0 and 1 or 0)

    if type(jp) ~= "table" or type(jp.set) ~= "function" then
        return pressed_mask ~= 0
    end

    for _, target in ipairs(joypad_targets(start_pressed, select_pressed)) do
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

local function press_start_for(frames)
    start_hold_until = frame_num + frames
    apply_buttons(true, false)
end

local function pulse_select()
    apply_buttons(false, true)
end

local function clear_buttons()
    memory.write_u8(ADDR_JOY_OVERRIDE, 0)
    memory.write_u8(ADDR_JOY_ENABLE, 0)
    apply_buttons(false, false)
end

ensure_dirs()
log("=== FRONTEND PROBE " .. ROM_VERSION .. " ===")
log("Validating title -> file select -> name-entry/gameplay branch with ROM autostarts disabled.")
log("")

while frame_num < MAX_FRAMES do
    if hold_start_file_select then
        apply_buttons(true, false)
    elseif start_hold_until ~= nil and frame_num <= start_hold_until then
        apply_buttons(true, false)
    else
        clear_buttons()
    end

    emu.frameadvance()
    frame_num = frame_num + 1
    local s = read_state()

    local changed =
        prev == nil or
        s.script ~= prev.script or
        s.sub ~= prev.sub or
        s.ready ~= prev.ready or
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
            if not title_shot then
                shot(ROM_VERSION .. "_title_ready_f" .. frame_num .. ".png")
                title_shot = true
                log("title_ready_frame=" .. frame_num)
            end

            if phase_frame == nil then
                phase_frame = frame_num
            elseif frame_num >= phase_frame + 19 then
                press_start_for(120)
                phase = "wait_title_exit"
                phase_frame = frame_num
                log("action=hold_start_title frame=" .. frame_num)
            end
        else
            phase_frame = nil
        end
    elseif phase == "wait_title_exit" then
        if s.script ~= 0 then
            start_hold_until = nil
            phase = "wait_file_select"
            phase_frame = frame_num
            log("title_exit_detected frame=" .. frame_num)
        end
    elseif phase == "wait_file_select" then
        if s.script == 1 and s.ready == 1 and s.ppu == 0 then
            if not file_shot then
                shot(ROM_VERSION .. "_file_select_ready_f" .. frame_num .. ".png")
                file_shot = true
                phase_frame = frame_num
                log("file_select_ready_frame=" .. frame_num)
            end

            if frame_num >= phase_frame + 20 then
                local has_active = (s.slot0 ~= 0 or s.slot1 ~= 0 or s.slot2 ~= 0)
                if has_active and s.slot < 3 and select_attempts < 4 then
                    pulse_select()
                    select_attempts = select_attempts + 1
                    phase_frame = frame_num
                    log("action=press_select_to_seek_register frame=" .. frame_num .. " attempt=" .. select_attempts)
                elseif frame_num >= phase_frame + 8 then
                    hold_start_file_select = true
                    phase = "wait_branch"
                    phase_frame = frame_num
                    log("action=hold_start_file_select frame=" .. frame_num)
                end
            end
        end
    elseif phase == "wait_branch" then
        if s.script ~= 1 then
            hold_start_file_select = false
            if not branch_shot then
                shot(ROM_VERSION .. "_frontend_branch_f" .. frame_num .. ".png")
                branch_shot = true
                log("branch_frame=" .. frame_num .. " branch_script=" .. s.script)
            end
            if s.script >= 5 or s.script == 0x0D or s.script == 0x0E or s.script == 0x0F then
                break
            end
        elseif frame_num >= phase_frame + 180 then
            hold_start_file_select = false
            log("branch_timeout_frame=" .. frame_num)
            break
        end
    end

    prev = s
end

clear_buttons()

log("")
log("=== SUMMARY ===")
local final = read_state()
log_state("final", final)
log("final_phase=" .. phase)
for _, s in ipairs(shots) do
    log("captured=" .. s)
end

if log_file then
    log_file:close()
end
