-- zelda_gameplay_probe.lua
-- Drives the front-end flow and records whether the ROM branches into gameplay
-- or a front-end subflow like register/name-entry.
-- ROM_VERSION is patched by run_gameplay_probe.ps1 before launch.

local ROM_VERSION = "zelda_v378"
local MAX_FRAMES  = 6000

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR  = OUT_DIR .. "screens\\"
local OUT_PATH  = OUT_DIR .. "gameplay_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY             = 0xFF0011
local ADDR_SCRIPT            = 0xFF0012
local ADDR_SUBSCRIPT         = 0xFF0013
local ADDR_PPU_LOAD_IDX      = 0xFF0014
local ADDR_CUR_SLOT          = 0xFF0016
local ADDR_MAP_LOCATION      = 0xFF00EB
local ADDR_NEXT_MAP_LOCATION = 0xFF00EC
local ADDR_PAUSE_FLAG        = 0xFF00E0
local ADDR_SCREEN_TRANS      = 0xFF00E3
local ADDR_POS_X_LINK        = 0xFF0070
local ADDR_POS_Y_LINK        = 0xFF0084
local ADDR_DIR_LINK          = 0xFF0098
local ADDR_TIMER_LINK        = 0xFF0028
local ADDR_ROOM_ITEM_FLAG    = 0xFF00BF
local ADDR_ENEMY_CNT         = 0xFF034E
local ADDR_SPR_INDEX_1       = 0xFF0343
local ADDR_JOY_OVERRIDE      = 0xFFEE90
local ADDR_JOY_ENABLE        = 0xFFEE91
local ADDR_SLOT_0            = 0xFF0633
local ADDR_SLOT_1            = 0xFF0634
local ADDR_SLOT_2            = 0xFF0635
local ADDR_SLOT_3            = 0xFF0636
local ADDR_SLOT_4            = 0xFF0637
local ADDR_MESSAGE           = 0xFF0415
local ADDR_CURRENT_QUEST     = 0xFF062D
local ADDR_ITEM_HEARTS       = 0xFF066F
local ADDR_MMC1_CTRL         = 0xFF8000
local ADDR_MMC1_CHR0         = 0xFF8001
local ADDR_MMC1_CHR1         = 0xFF8002
local ADDR_MMC1_PRG          = 0xFF8003

-- Crash diagnostic addresses
local ADDR_CRASH_MAGIC       = 0xFFEE00
local ADDR_CRASH_VECTOR      = 0xFFEE02
local ADDR_CRASH_PC          = 0xFFEE0A

local BTN_START = 0x10
local BTN_SELECT = 0x20
local BTN_A = 0x80
local SCRIPT_GAMEPLAY = 0x05
local SCRIPT_REGISTER = 0x0E
local SCRIPT_ELIMINATION = 0x0F

memory.usememorydomain("M68K BUS")

local frame_num = 0
local log_file = io.open(OUT_PATH, "w")
local shots = {}
local gameplay_entry = nil
local branch_script = nil

local phase = "wait_title_ready"
local phase_frame = nil
local hold_start_title = false
local hold_start_file_select = false
local hold_start_register = false
local hold_a_register = false
local register_seq = 0
local register_seq_frame = 0
local title_shot = false
local file_shot = false
local branch_shot = false

local prev_script = 0xFF
local prev_sub = 0xFF
local last_x = 0xFF
local last_y = 0xFF

-- Track script write events from memory callback
local script_write_log = {}

local function log_crash_diag()
    local ok, err = pcall(function()
        local magic_hi = memory.read_u8(ADDR_CRASH_MAGIC)
        local magic_lo = memory.read_u8(ADDR_CRASH_MAGIC + 1)
        local vec_hi = memory.read_u8(ADDR_CRASH_VECTOR)
        local vec_lo = memory.read_u8(ADDR_CRASH_VECTOR + 1)
        local pc0 = memory.read_u8(ADDR_CRASH_PC)
        local pc1 = memory.read_u8(ADDR_CRASH_PC + 1)
        local pc2 = memory.read_u8(ADDR_CRASH_PC + 2)
        local pc3 = memory.read_u8(ADDR_CRASH_PC + 3)
        local magic = magic_hi * 256 + magic_lo
        local vector = vec_hi * 256 + vec_lo
        local crash_pc = pc0 * 16777216 + pc1 * 65536 + pc2 * 256 + pc3
        log(string.format("CRASH_DIAG: magic=%04X vector=%04X pc=%08X", magic, vector, crash_pc))
    end)
    if not ok then
        log("CRASH_DIAG: error reading crash area: " .. tostring(err))
    end
end

local function log_ram_dump(label, start_addr, num_bytes)
    local ok, err = pcall(function()
        local parts = {}
        for i = 0, num_bytes - 1 do
            parts[#parts + 1] = string.format("%02X", memory.read_u8(start_addr + i))
        end
        log(string.format("RAM_DUMP[%s] @%06X: %s", label, start_addr, table.concat(parts, " ")))
    end)
    if not ok then
        log(string.format("RAM_DUMP[%s]: error: %s", label, tostring(err)))
    end
end

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

local function joypad_targets(mask)
    local start_pressed = (mask & BTN_START) ~= 0
    local select_pressed = (mask & BTN_SELECT) ~= 0
    local a_pressed = (mask & BTN_A) ~= 0
    -- Genesis 3-button pad mapping:
    --   Start -> NES Start (0x10)
    --   C     -> NES Select (0x20)
    --   A     -> NES A (0x80)
    --   B     -> NES B (0x40)
    return {
        { payload = { Start = start_pressed, C = select_pressed, A = a_pressed, B = false }, device = 1 },
        { payload = { ["P1 Start"] = start_pressed, ["P1 C"] = select_pressed, ["P1 A"] = a_pressed, ["P1 B"] = false }, device = nil },
        { payload = { Start = start_pressed }, device = 1 },
        { payload = { C = select_pressed }, device = 1 },
        { payload = { A = a_pressed }, device = 1 },
        { payload = { ["P1 Start"] = start_pressed }, device = nil },
        { payload = { ["P1 C"] = select_pressed }, device = nil },
        { payload = { ["P1 A"] = a_pressed }, device = nil },
    }
end

local function apply_input(mask)
    local jp = rawget(_G, "joypad")

    memory.write_u8(ADDR_JOY_OVERRIDE, mask)
    memory.write_u8(ADDR_JOY_ENABLE, mask ~= 0 and 1 or 0)

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

local function read_state()
    return {
        ready     = memory.read_u8(ADDR_READY),
        script    = memory.read_u8(ADDR_SCRIPT),
        sub       = memory.read_u8(ADDR_SUBSCRIPT),
        ppu       = memory.read_u8(ADDR_PPU_LOAD_IDX),
        slot      = memory.read_u8(ADDR_CUR_SLOT),
        slot0     = memory.read_u8(ADDR_SLOT_0),
        slot1     = memory.read_u8(ADDR_SLOT_1),
        slot2     = memory.read_u8(ADDR_SLOT_2),
        slot3     = memory.read_u8(ADDR_SLOT_3),
        slot4     = memory.read_u8(ADDR_SLOT_4),
        map       = memory.read_u8(ADDR_MAP_LOCATION),
        next_map  = memory.read_u8(ADDR_NEXT_MAP_LOCATION),
        x         = memory.read_u8(ADDR_POS_X_LINK),
        y         = memory.read_u8(ADDR_POS_Y_LINK),
        dir       = memory.read_u8(ADDR_DIR_LINK),
        enemies   = memory.read_u8(ADDR_ENEMY_CNT),
        room_item = memory.read_u8(ADDR_ROOM_ITEM_FLAG),
        message   = memory.read_u8(ADDR_MESSAGE),
        quest     = memory.read_u8(ADDR_CURRENT_QUEST),
        hearts    = memory.read_u8(ADDR_ITEM_HEARTS),
        pause     = memory.read_u8(ADDR_PAUSE_FLAG),
        trans     = memory.read_u8(ADDR_SCREEN_TRANS),
        timer     = memory.read_u8(ADDR_TIMER_LINK),
        spr_idx_1 = memory.read_u8(ADDR_SPR_INDEX_1),
        mmc1_8000 = memory.read_u8(ADDR_MMC1_CTRL),
        mmc1_a000 = memory.read_u8(ADDR_MMC1_CHR0),
        mmc1_c000 = memory.read_u8(ADDR_MMC1_CHR1),
        mmc1_e000 = memory.read_u8(ADDR_MMC1_PRG),
    }
end

local function log_state(prefix, s)
    log(string.format(
        "%s frame=%d script=%d sub=%d ready=%d ppu=0x%02X slot=%d active=[%02X,%02X,%02X,%02X,%02X] map=%02X next=%02X x=%02X y=%02X dir=%02X enemy_cnt=%d room_item=%02X msg=%02X quest=%02X hearts=%02X pause=%d trans=%d timer=%d spr1=%02X mmc=[%02X,%02X,%02X,%02X] phase=%s",
        prefix, frame_num, s.script, s.sub, s.ready, s.ppu, s.slot,
        s.slot0, s.slot1, s.slot2, s.slot3, s.slot4,
        s.map, s.next_map, s.x, s.y, s.dir, s.enemies, s.room_item,
        s.message, s.quest, s.hearts, s.pause, s.trans, s.timer,
        s.spr_idx_1, s.mmc1_8000, s.mmc1_a000, s.mmc1_c000, s.mmc1_e000,
        phase
    ))
end

ensure_dirs()

log("=== GAMEPLAY PROBE " .. ROM_VERSION .. " ===")
log("Driving title -> file select -> branch and capturing gameplay if reached.")
log("")

-- Set up memory write callback on ram_script to catch what changes it
local script_watch_ok = false
local ev = rawget(_G, "event")
if type(ev) == "table" and type(ev.onmemorywrite) == "function" then
    local ok = pcall(function()
        ev.onmemorywrite(function()
            local pc_val = 0
            local em = rawget(_G, "emu")
            if type(em) == "table" and type(em.getregister) == "function" then
                local ok2, v = pcall(em.getregister, "M68K PC")
                if ok2 and v then pc_val = v end
            end
            local new_val = memory.read_u8(ADDR_SCRIPT)
            script_write_log[#script_write_log + 1] = string.format(
                "SCRIPT_WRITE: frame=%d new_val=%02X pc=%08X",
                frame_num, new_val, pc_val)
        end, ADDR_SCRIPT, "watch_ram_script")
    end)
    if ok then
        script_watch_ok = true
        log("script_write_watch=ACTIVE addr=FF0012")
    end
end
if not script_watch_ok then
    log("script_write_watch=UNAVAILABLE (event.onmemorywrite not supported)")
end

while frame_num < MAX_FRAMES do
    local input_mask = 0
    if hold_start_title or hold_start_file_select or hold_start_register then
        input_mask = BTN_START
    elseif register_seq > 0 then
        -- Persistent register flow pulses until script transitions:
        -- A (enter char) -> Select (advance) -> Start (confirm/exit).
        local step = (frame_num - register_seq_frame) % 24
        if step == 0 then
            input_mask = BTN_A
        elseif step == 8 then
            input_mask = BTN_SELECT
        elseif step == 16 then
            input_mask = BTN_START
        end
    elseif hold_a_register then
        -- A/B are consumed via edge-triggered btn_press, so pulse A instead of holding it.
        if frame_num % 10 == 0 then
            input_mask = BTN_A
        end
    end

    if input_mask ~= 0 then
        apply_input(input_mask)
    else
        clear_buttons()
    end

    emu.frameadvance()
    frame_num = frame_num + 1

    local s = read_state()

    if s.script ~= prev_script or s.sub ~= prev_sub then
        log_state("state", s)
        -- Flush any script write events collected during this frame
        for _, msg in ipairs(script_write_log) do
            log(msg)
        end
        script_write_log = {}

        -- When script changes from 4 to 0, dump crash diagnostics
        if prev_script == 4 and s.script == 0 then
            log("=== SCRIPT 4->0 CRASH DIAGNOSTIC ===")
            -- Read crash diag area byte by byte with individual pcalls
            local results = {}
            for offset = 0, 15 do
                local addr = ADDR_CRASH_MAGIC + offset
                local ok2, val = pcall(memory.read_u8, addr)
                if ok2 then
                    results[#results + 1] = string.format("%02X", val)
                else
                    results[#results + 1] = "??"
                end
            end
            log("CRASH_AREA @FFEE00: " .. table.concat(results, " "))
            -- Read crash PC area
            results = {}
            for offset = 0, 7 do
                local addr = ADDR_CRASH_PC + offset
                local ok2, val = pcall(memory.read_u8, addr)
                if ok2 then
                    results[#results + 1] = string.format("%02X", val)
                else
                    results[#results + 1] = "??"
                end
            end
            log("CRASH_PC @FFEE0A: " .. table.concat(results, " "))
            -- Canary area ($FFEE80+) -- instrumentation writes
            results = {}
            for offset = 0, 15 do
                local addr = 0xFFEE80 + offset
                local ok2, val = pcall(memory.read_u8, addr)
                if ok2 then
                    results[#results + 1] = string.format("%02X", val)
                else
                    results[#results + 1] = "??"
                end
            end
            log("CANARY @FFEE80: " .. table.concat(results, " "))
            -- Zero page dump from known-good area
            results = {}
            for offset = 0, 31 do
                local ok2, val = pcall(memory.read_u8, 0xFF0000 + offset)
                if ok2 then
                    results[#results + 1] = string.format("%02X", val)
                else
                    results[#results + 1] = "??"
                end
            end
            log("ZEROPAGE @FF0000: " .. table.concat(results, " "))
            -- Stack pointer area
            results = {}
            for offset = 0, 31 do
                local ok2, val = pcall(memory.read_u8, 0xFF01E0 + offset)
                if ok2 then
                    results[#results + 1] = string.format("%02X", val)
                else
                    results[#results + 1] = "??"
                end
            end
            log("STACK @FF01E0: " .. table.concat(results, " "))
            log("=== END CRASH DIAGNOSTIC ===")
        end
    end

    if phase == "wait_title_ready" then
        if s.script == 0 and s.sub == 0 and s.ready == 1 and s.ppu == 0 then
            if not title_shot then
                shot(ROM_VERSION .. "_title_ready_f" .. frame_num .. ".png")
                title_shot = true
                phase_frame = frame_num
                log("title_ready_frame=" .. frame_num)
            else
                if phase_frame == nil then phase_frame = frame_num end
            end

            if title_shot and frame_num >= phase_frame + 20 then
                hold_start_title = true
                phase = "wait_title_exit"
                phase_frame = frame_num
                log("action=hold_start_title frame=" .. frame_num)
            end
        else
            if not title_shot then phase_frame = nil end
        end
    elseif phase == "wait_title_exit" then
        if s.script ~= 0 then
            hold_start_title = false
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
            elseif frame_num >= phase_frame + 20 then
                hold_start_file_select = true
                phase = "wait_branch"
                phase_frame = frame_num
                log("action=hold_start_file_select frame=" .. frame_num)
            end
        end
    elseif phase == "wait_branch" then
        if s.script ~= 1 then
            hold_start_file_select = false
            branch_script = s.script
            if not branch_shot then
                shot(ROM_VERSION .. "_branch_f" .. frame_num .. ".png")
                branch_shot = true
            end
            log("branch_frame=" .. frame_num .. " branch_script=" .. s.script)
            if s.script == SCRIPT_GAMEPLAY then
                gameplay_entry = frame_num
                phase = "capture_gameplay"
                log("")
                log("*** GAMEPLAY ENTRY ***")
                log_state("entry", s)
                shot(ROM_VERSION .. "_gameplay_entry_f" .. frame_num .. ".png")
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
            hold_start_file_select = false
            phase = "timed_out_wait_branch"
            log("branch_timeout_frame=" .. frame_num)
            break
        end
    elseif phase == "wait_gameplay_after_other" then
        if s.script == SCRIPT_GAMEPLAY then
            gameplay_entry = frame_num
            phase = "capture_gameplay"
            log("")
            log("*** GAMEPLAY ENTRY (AFTER OTHER BRANCH) ***")
            log_state("entry", s)
            shot(ROM_VERSION .. "_gameplay_entry_after_other_f" .. frame_num .. ".png")
        elseif frame_num >= phase_frame + 900 then
            phase = "timed_out_after_other_branch"
            log("other_branch_timeout_frame=" .. frame_num)
            break
        end
    elseif phase == "wait_register_resolution" then
        if s.script == SCRIPT_GAMEPLAY then
            hold_start_register = false
            gameplay_entry = frame_num
            phase = "capture_gameplay"
            log("")
            log("*** GAMEPLAY ENTRY (POST-REGISTER) ***")
            log_state("entry", s)
            shot(ROM_VERSION .. "_gameplay_entry_post_register_f" .. frame_num .. ".png")
        elseif s.script == 1 and s.ready == 1 and s.ppu == 0 then
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
            register_seq_frame = frame_num
            log("action=register_sequence_begin frame=" .. frame_num)
        elseif frame_num >= phase_frame + 1800 then
            hold_start_register = false
            hold_a_register = false
            register_seq = 0
            phase = "timed_out_register_resolution"
            log("register_resolution_timeout_frame=" .. frame_num)
            break
        end
    elseif phase == "capture_gameplay" and gameplay_entry ~= nil then
        local delta = frame_num - gameplay_entry
        if (s.x ~= last_x or s.y ~= last_y) and delta <= 240 then
            log_state("move", s)
        end
        if delta == 30 then
            shot(ROM_VERSION .. "_gameplay_f" .. frame_num .. ".png")
            log_state("f+30", s)
        elseif delta == 120 then
            shot(ROM_VERSION .. "_gameplay_f" .. frame_num .. ".png")
            log_state("f+120", s)
        elseif delta == 240 then
            shot(ROM_VERSION .. "_gameplay_f" .. frame_num .. ".png")
            log_state("f+240", s)
            break
        end
    end

    if frame_num % 120 == 0 and gameplay_entry == nil then
        log_state("heartbeat", s)
    end

    prev_script = s.script
    prev_sub = s.sub
    last_x = s.x
    last_y = s.y
end

clear_buttons()

log("")
log("=== SUMMARY ===")
-- Flush any remaining script write events
for _, msg in ipairs(script_write_log) do
    log(msg)
end
local final = read_state()
log_state("final", final)
log("final_phase=" .. phase)
log("branch_script=" .. tostring(branch_script))
log("gameplay_entry_frame=" .. tostring(gameplay_entry))
for _, s in ipairs(shots) do
    log("captured=" .. s)
end

if log_file then log_file:close() end
