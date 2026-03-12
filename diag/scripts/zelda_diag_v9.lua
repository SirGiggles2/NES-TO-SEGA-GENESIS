-- ============================================================
--  zelda_diag.lua  -  Automated Zelda Genesis Port Diagnostics
--  v8 - loop-release focused telemetry + deterministic batch runner
--
--  Focus:
--   * preserve all v6 diagnostics
--   * stronger tracking for the late self-loop around $0007F6
--   * show the last distinct PCs before the loop stabilized
--   * highlight engine-side flags that never changed vs changed once
--   * summarize likely loop-release candidates
-- ============================================================

-- ======================== CONFIG ============================
local SCRIPT_VERSION = rawget(_G, "ZELDA_DIAG_VERSION") or "v9"
local NUM_FRAMES     = 901
local REPORT_DIR     = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local ROM_DIR        = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\build\\"
local SCREENSHOT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\scripts\\"
local SEND_ME_DIR    = REPORT_DIR .. "Files I Want\\"
local SCREENSHOT_AT  = {1, 30, 60, 120, 180, 240, 300, 420, 600, 780, 900, 901}
local SAMPLE_VRAM    = true
local SAMPLE_CRAM    = true
local PC_DUMP_BEFORE = 16
local PC_DUMP_AFTER  = 48
local TOP_PC_DUMPS   = 8
local STATUS_Y       = 0
local STOP_ON_CRASH  = true
local START_ROM_HINT = "zelda_v340.md" -- auto-set by run_batch.ps1 when needed
local BATCH_MODE     = true -- run sequentially from START_ROM_HINT upward
local BATCH_SIZE     = 5    -- maximum number of ROMs to process in one batch
local BATCH_REOPEN_FIRST_ROM = true
local BATCH_SETTLE_FRAMES = 2
local BATCH_SUMMARY_PATH = REPORT_DIR .. "diag_batch_summary_v9.txt"
local MENU_PPU_BUF_START = 0x0300
local MENU_PPU_BUF_COUNT = 0x20
local MENU_OAM_START = 0x0200
local MENU_OAM_COUNT = 0x10

local TRACE_LAST_ADDR = 0xF000
local TRACE_SEQ_ADDR  = 0xF002
local TRACE_RING_ADDR = 0xF010
local TRACE_RING_SIZE = 32
local TRACE_META_ADDR = 0xF080
local TRACE_SEQ_EVT_COUNT_ADDR = 0xF0AC
local TRACE_PPU_EVT_COUNT_ADDR = 0xF0AE
local TRACE_SEQ_EVT_RING_ADDR  = 0xF0C0
local TRACE_PPU_EVT_RING_ADDR  = 0xF140
local TRACE_EVT_RING_SIZE      = 8
local TRACE_EVT_SLOT_SIZE      = 16
local CRASH_AUX_ADDR  = 0xEE80
local CRASH_REGS_ADDR = 0xEE40

local function exit_bizhawk()
    if not (client and type(client.exit) == "function") then
        return
    end

    if event and type(event.onframeend) == "function" and emu and type(emu.frameadvance) == "function" then
        local requested = false
        event.onframeend(function()
            if requested then
                return
            end
            requested = true
            client.exit()
        end, "zelda_diag_v9_auto_exit")
        emu.frameadvance()
        return
    end

    client.exit()
end

-- Specific loop / guard addresses we care about right now
local TARGET_LOOP_PC          = 0x0007F6
local TARGET_LOOP_PREHISTORY  = 24   -- how many distinct/chronological PCs to keep before the loop
local LOOP_STABLE_THRESHOLD   = 30   -- same threshold as stuck detection

-- Suspect helper/logic addresses we care about
local HOT_SYMBOLS = {
    {name="PPU_WRITE_2000",    addr=0x000534},
    {name="PPU_READ_2002",     addr=0x0004BC},
    {name="PPU_WRITE_2006",    addr=0x000544},
    {name="PPU_WRITE_2007",    addr=0x000576},
    {name="TARGET_LOOP_0007F6",addr=0x0007F6},
    {name="TITLE/NMI LOOP",    addr=0x014B80},
    {name="vec_0x01E494_NMI",  addr=0x01E494},
}

local KNOWN_PC_LABELS = {
    [0x00000D78] = "Late idle loop after substantial startup progress (v99-style stall)",
    [0x00015B9C] = "Bank-6 PPU buffer pointer decode stall during startup/title path (v100-style stall)",
    [0x00015BB8] = "Bank-6 PPU buffer pointer decode stall during startup/title path (v101-style stall)",
}

local TRACE_NAMES = {
    [0x0101] = "GENESIS_RESET: joypad init complete",
    [0x0102] = "GENESIS_RESET: jump to Zelda reset",
    [0x0201] = "VDP_VBLANK_HANDLER: entry",
    [0x0202] = "VDP_VBLANK_HANDLER: calling translated NMI",
    [0x0203] = "VDP_VBLANK_HANDLER: translated NMI returned",
    [0x0301] = "vec_0x01E494_NMI: frame body reached",
    [0x0302] = "vec_0x01E494_NMI: taking startup handler 1",
    [0x0303] = "vec_0x01E494_NMI: taking steady-state handler 2",
    [0x0310] = "sub_E8F8_main_script_handler_1: entry",
    [0x0311] = "sub_E8F8_main_script_handler_1: before battery copy",
    [0x0312] = "sub_E8F8_main_script_handler_1: before sub_0x01809C",
    [0x0313] = "sub_E8F8_main_script_handler_1: setup complete",
    [0x0314] = "sub_E8F8_main_script_handler_1: title script dispatch",
    [0x0315] = "sub_E8F8_main_script_handler_1: bank 5 selected",
    [0x0316] = "sub_E8F8_main_script_handler_1: before script helper",
    [0x0317] = "sub_E5E2_jump_to_pointers_after_JSR: sanitized index ready",
    [0x0318] = "sub_E5E2_jump_to_pointers_after_JSR: target resolved",
    [0x0320] = "ofs_main_script_1_E94B_00_title_screen: entry",
    [0x0321] = "ofs_main_script_1_E94B_00_title_screen: taking stage 1 path",
    [0x0322] = "ofs_main_script_1_E94B_00_title_screen: bank 2 selected",
    [0x0323] = "ofs_main_script_1_E94B_00_title_screen: jumping to fill 1",
    [0x0400] = "PPU_WRITE_2006: address latched",
    [0x0401] = "PPU_READ_2007: entry",
    [0x0402] = "PPU_READ_2007: exit",
    [0x0403] = "PPU_WRITE_2006: VDP command programmed",
    [0x0410] = "TITLE_FILL_1: stage 1 completion stub",
    [0x0411] = "TITLE_FILL_2: stage 2 completion stub",
    [0x0412] = "TITLE_FILL_3: stage 3 completion stub",
    [0x0420] = "sub_E8F8_main_script_handler_1: direct title call bypass",
    [0x0421] = "sub_E8F8_main_script_handler_1: direct title call returned",
    [0x0430] = "TITLE_WARMUP: stage advanced",
    [0x0431] = "TITLE_WARMUP: screen ready set",
    [0x0432] = "TITLE_DEMO: stage advanced",
    [0x0433] = "TITLE_FALLBACK: forced screen-ready release",
    [0x0434] = "TITLE_DEMO: text page advanced",
    [0x0435] = "TITLE_FALLBACK: forced PPUMASK/display release",
    [0x0440] = "BANK6_PPU: translated ROM buffer selected",
    [0x0441] = "BANK6_PPU: translated ROM buffer complete",
    [0x0442] = "BANK6_PPU: legacy pointer fallback used",
    [0x0450] = "BANK0_AUDIO: early boot full sound-driver bypass",
    [0x0451] = "BANK0_AUDIO: early boot music bypass",
    [0x0452] = "BANK0_AUDIO: early boot music self-loop release",
    [0x0453] = "BANK0_AUDIO: early boot DPCM/SFX1 bypass",
    [0x0460] = "BANK6_BAT: startup BAT import begin",
    [0x0461] = "BANK6_BAT: startup BAT import complete",
    [0x0462] = "BANK6_PPU: BAT ROM buffer selected",
    [0x0463] = "BANK6_BAT: startup BAT import skipped",
    [0x0464] = "BANK0_MUSIC: title music gate force-released",
    [0x0465] = "BANK0_MUSIC: title music request hard-bypassed",
    [0x0466] = "TITLE_WARMUP: title music request suppressed",
    [0x0467] = "TITLE_WARMUP: stale title music latch cleared",
    [0x0470] = "TITLE_SYNC: title music request restored",
    [0x0471] = "TITLE_SYNC: early Start gated until title ready",
    [0x0472] = "BANK0_MUSIC: title track initialized from real ROM data",
    [0x0473] = "BANK0_MUSIC: early-title music self-loop bypassed",
    [0x0474] = "TITLE_INPUT: Start ignored while title PPU load still active",
    [0x0475] = "TITLE_INPUT: Start ignored until title screen reaches stage 2",
    [0x0476] = "BANK0_MUSIC: real 8D60/8D84 init dispatch",
    [0x0477] = "BANK0_MUSIC: real 8D60/8D84 init complete",
    [0x0478] = "BANK0_MUSIC: code 06 shortcut disabled",
    [0x0479] = "BANK0_MUSIC: title track forced through real 0x19 init",
    [0x047A] = "BANK0_MUSIC: extra bank-0 audio tables active",
    [0x047B] = "BANK0_MUSIC: title prep latch cleared after active title music",
    [0x047C] = "BANK0_MUSIC: title display/rendering armed from bank-0 recovery",
    [0x047D] = "BANK0_MUSIC: preserved active title track through old stale-latch clear path",
    [0x0480] = "BANK0_MUSIC: title request rerouted to translated title sequence",
    [0x0481] = "BANK0_MUSIC: title request consumed from ram_music",
    [0x0482] = "BANK0_MUSIC: title ppu_load_index released during music handoff",
    [0x0483] = "BANK0_MUSIC: title display/rendering primed during music handoff",
    [0x0484] = "BANK0_MUSIC: title request intercepted at bra_9C76",
    [0x0485] = "BANK6_PPU: optional 1E/2A real buffer enabled",
    [0x0486] = "BANK6_PPU: optional 6A/6C real buffer enabled",
    [0x0487] = "BANK6_PPU: optional 76/78 real buffer enabled",
    [0x0488] = "BANK6_PPU: optional 26/50/5A real buffer enabled",
    [0x0489] = "BANK6_PPU: optional continue buffer enabled",
    [0x048A] = "BANK6_PPU: optional real buffer forced back to legacy",
    [0x048B] = "BANK0_MUSIC: custom title/music preamble bypassed",
    [0x0436] = "BANK2_TITLE: title advanced into slot-select script",
    [0x0437] = "BANK2_MENU: slot-selection script entered",
    [0x0438] = "BANK2_MENU: file-select buffer 6A staged",
    [0x048C] = "BANK0_MUSIC: forced title-track init suppressed",
    [0x048D] = "BANK0_MUSIC: early-title sequencer entry suppressed",
    [0x048E] = "BANK0_MUSIC: NES raw sequence pointer resolved to materialized data",
    [0x048F] = "BANK0_MUSIC: sequence pointer fell back to native 68k address",
    [0x0490] = "BANK0_MUSIC: unresolved title-state sequence forced to translated title track",
    [0x0491] = "BANK0_MUSIC: exact 6502 rotate-derived sequence index path used",
    [0x0492] = "BANK0_MUSIC: exact 6502 pitch-adjust carry path used",
    [0x0493] = "BANK6_PPU: legacy title buffer index redirected to translated title payload",
    [0x0494] = "BANK6_PPU: RAM $0302 buffer redirected to translated stream writer",
    [0x0495] = "BANK6_PPU: legacy title alias redirected to RAM $0302 stream writer",
    [0x0496] = "BANK6_PPU: RAM $0302 request redirected to empty translated buffer",
    [0x0497] = "BANK0_MUSIC: early title music request consumed and request byte cleared",
    [0x04A0] = "BANK6_PPU_LEGACY: raw header byte captured",
    [0x04A1] = "BANK6_PPU_LEGACY: literal header decoded",
    [0x04A2] = "BANK6_PPU_LEGACY: repeat header decoded",
    [0x04A3] = "BANK6_PPU_LEGACY: palette fixup branch",
    [0x04A4] = "BANK6_PPU_LEGACY: pointer advanced",
    [0x04A8] = "BANK6_PPU: fallback request captured",
    [0x04A9] = "BANK6_PPU: request captured",
    [0x04AA] = "BANK2_TITLE: logo palette header written",
    [0x04AB] = "BANK2_TITLE: title template header written",
    [0x04AC] = "BANK2_TITLE: title block header written",
    [0x04B1] = "BANK0_SEQ: 9D37 primary byte fetch",
    [0x04B2] = "BANK0_SEQ: 9D63 command-follow byte fetch",
    [0x04B3] = "BANK0_SEQ: 9DBE pulse-1 byte fetch",
    [0x04B4] = "BANK0_SEQ: 9DCE pulse-1 follow byte fetch",
    [0x04B5] = "BANK0_SEQ: 9E2C triangle/control byte fetch",
    [0x04B6] = "BANK0_SEQ: 9E66 triangle-follow byte fetch",
    [0x04B7] = "BANK0_SEQ: 9EA7 noise/envelope byte fetch",
  }

local VECTOR_NAMES = {
    [0x0002] = "Bus error",
    [0x0003] = "Address error",
    [0x0004] = "Illegal instruction",
    [0x0005] = "Division by zero",
    [0x0006] = "CHK exception",
    [0x0007] = "TRAPV exception",
    [0x0008] = "Privilege violation",
    [0x0009] = "Trace",
    [0x000A] = "Line A emulator",
    [0x000B] = "Line F emulator",
    [0x0018] = "Spurious interrupt",
    [0x0019] = "Level 1 interrupt",
    [0x001A] = "Level 2 interrupt",
    [0x001B] = "Level 3 interrupt",
    [0x001C] = "Level 4 interrupt",
    [0x001D] = "Level 5 interrupt",
    [0x001F] = "Level 7 interrupt",
    [0x0020] = "TRAP #0",
    [0x0021] = "TRAP #1",
    [0x0022] = "TRAP #2",
    [0x0023] = "TRAP #3",
    [0x0024] = "TRAP #4",
    [0x0025] = "TRAP #5",
    [0x0026] = "TRAP #6",
    [0x0027] = "TRAP #7",
    [0x0028] = "TRAP #8",
    [0x0029] = "TRAP #9",
    [0x002A] = "TRAP #10",
    [0x002B] = "TRAP #11",
    [0x002C] = "TRAP #12",
    [0x002D] = "TRAP #13",
    [0x002E] = "TRAP #14",
    [0x002F] = "TRAP #15",
    [0xFFFF] = "Unlabeled exception",
}
-- ============================================================

-- ======================== HELPERS ============================
local function hex(val, digits)
    digits = digits or 2
    if val == nil then val = 0 end
    if val < 0 then val = 0 end
    return string.format("$%0" .. digits .. "X", val)
end

local function read_ram(addr, sz)
    if sz == 4 then
        return memory.read_u32_be(addr, "68K RAM")
    elseif sz == 2 then
        return memory.read_u16_be(addr, "68K RAM")
    else
        return memory.readbyte(addr, "68K RAM")
    end
end

local function safe_read_u16(domain, addr)
    local ok, v = pcall(memory.read_u16_be, addr, domain)
    if ok then return v end
    return 0
end

local function safe_read_u32(domain, addr)
    local ok, v = pcall(memory.read_u32_be, addr, domain)
    if ok then return v end
    return 0
end

local function safe_read_byte(domain, addr)
    local ok, v = pcall(memory.readbyte, addr, domain)
    if ok then return v end
    return 0
end

local function csv_escape(value)
    local s = tostring(value or "")
    if s:find('[,",\r\n]') then
        s = '"' .. s:gsub('"', '""') .. '"'
    end
    return s
end

local function write_csv_row(file_handle, values)
    for i, value in ipairs(values) do
        if i > 1 then
            file_handle:write(",")
        end
        file_handle:write(csv_escape(value))
    end
    file_handle:write("\n")
end

local function append_range_header(header, prefix, count)
    for i = 0, count - 1 do
        header[#header + 1] = string.format("%s_%02X", prefix, i)
    end
end

local function append_range_values(row, start_addr, count)
    for i = 0, count - 1 do
        row[#row + 1] = string.format("%02X", read_ram(start_addr + i, 1))
    end
end

local function menu_trace_header()
    local header = {
        "frame", "system", "rom_label", "pc",
        "screen_ready", "ram_script", "ram_subscript", "ppu_load_index",
        "cur_save_slot", "ram_004D", "ram_next_script",
        "ram_00E7", "ram_map_location", "ram_next_map_location",
        "ram_0000_t41", "ram_0000_t42",
        "ram_041F", "ram_0421", "ram_0423",
        "ram_0000", "ram_0001", "ram_0002", "ram_0003", "ram_0004", "ram_0005",
        "spr_index_1", "spr_index_2",
        "trace_last",
        "PPU_REQ_INDEX", "PPU_REQ_PTR", "PPU_REQ_RES",
        "SEQ_EVT_COUNT", "PPU_EVT_COUNT"
    }
    append_range_header(header, "ppu_buf", MENU_PPU_BUF_COUNT)
    append_range_header(header, "oam", MENU_OAM_COUNT)
    return header
end

local function capture_menu_trace_row(frame, rom_name, pc)
    local rom_label = tostring(rom_name or "")
    rom_label = rom_label:gsub("%.[Mm][Dd]$", "")
    local row = {
        frame,
        "genesis",
        rom_label,
        string.format("%06X", pc or 0),
        string.format("%02X", read_ram(0x0011, 1)),
        string.format("%02X", read_ram(0x0012, 1)),
        string.format("%02X", read_ram(0x0013, 1)),
        string.format("%02X", read_ram(0x0014, 1)),
        string.format("%02X", read_ram(0x0016, 1)),
        string.format("%02X", read_ram(0x004D, 1)),
        string.format("%02X", read_ram(0x005B, 1)),
        string.format("%02X", read_ram(0x00E7, 1)),
        string.format("%02X", read_ram(0x00EB, 1)),
        string.format("%02X", read_ram(0x00EC, 1)),
        string.format("%02X", read_ram(0x0000, 1)),
        string.format("%02X", read_ram(0x0001, 1)),
        string.format("%02X", read_ram(0x041F, 1)),
        string.format("%02X", read_ram(0x0421, 1)),
        string.format("%02X", read_ram(0x0423, 1)),
        string.format("%02X", read_ram(0x0000, 1)),
        string.format("%02X", read_ram(0x0001, 1)),
        string.format("%02X", read_ram(0x0002, 1)),
        string.format("%02X", read_ram(0x0003, 1)),
        string.format("%02X", read_ram(0x0004, 1)),
        string.format("%02X", read_ram(0x0005, 1)),
        string.format("%02X", read_ram(0x0343, 1)),
        string.format("%02X", read_ram(0x0344, 1)),
        string.format("%04X", read_ram(0xF000, 2)),
        string.format("%04X", read_ram(0xF0A2, 2)),
        string.format("%04X", read_ram(0xF0A4, 2)),
        string.format("%08X", read_ram(0xF0A8, 4)),
        string.format("%04X", read_ram(0xF0AC, 2)),
        string.format("%04X", read_ram(0xF0AE, 2)),
    }
    append_range_values(row, MENU_PPU_BUF_START, MENU_PPU_BUF_COUNT)
    append_range_values(row, MENU_OAM_START, MENU_OAM_COUNT)
    return row
end

local function scan_roms()
    local roms = {}
    local handle = io.popen('dir /b /o-d "' .. ROM_DIR .. 'zelda_v*.md" 2>nul')
    if handle then
        for line in handle:lines() do roms[#roms+1] = line end
        handle:close()
    end
    return roms
end

local function filename_version_number(name)
    if not name or name == "" then return nil end
    local digits = tostring(name):match("[Zz]elda_[Vv](%d+)")
    if not digits then
        digits = tostring(name):match("[\\/]zelda_[Vv](%d+)")
    end
    if not digits then return nil end
    return tonumber(digits)
end

local function sorted_roms_ascending()
    local roms = scan_roms()
    table.sort(roms, function(a, b)
        local av = filename_version_number(a) or -1
        local bv = filename_version_number(b) or -1
        if av == bv then return a < b end
        return av < bv
    end)
    return roms
end

local function batch_queue_from(start_rom)
    local start_ver = filename_version_number(start_rom)
    local queue = {}
    for _, rom in ipairs(sorted_roms_ascending()) do
        local ver = filename_version_number(rom)
        if ver and start_ver and ver >= start_ver then
            queue[#queue + 1] = rom
            if #queue >= BATCH_SIZE then
                break
            end
        end
    end
    return queue
end

local function open_rom(rom_name)
    local full_path = ROM_DIR .. rom_name
    local attempts = {
        function() return client and client.openrom and client.openrom(full_path) end,
        function() return client and client.open_rom and client.open_rom(full_path) end,
        function() return emu and emu.loadrom and emu.loadrom(full_path) end,
    }

    for _, attempt in ipairs(attempts) do
        local ok = pcall(attempt)
        if ok then
            return true, full_path
        end
    end

    return false, full_path
end

local ensure_report_dir
local bundle_file

local function write_batch_summary(results)
    ensure_report_dir()
    local f = io.open(BATCH_SUMMARY_PATH, "w")
    if not f then return end
    f:write("Zelda diagnostic batch summary " .. SCRIPT_VERSION .. "\n\n")
    for _, result in ipairs(results) do
        f:write(string.format(
            "%s | %d PASS | %d FAIL | %s\n",
            result.rom,
            result.pass or 0,
            result.fail or 0,
            result.status or "done"
        ))
    end
    f:close()
    bundle_file(BATCH_SUMMARY_PATH)
end

local function basename(path)
    if not path or path == "" then return nil end
    return (path:gsub("^.*[\\/]", ""))
end

local function extract_rom_stem(name)
    if not name or name == "" then return nil end
    local base = basename(name)
    return base:match("(zelda_v%d+)")
end

local function rom_version_number(name)
    local stem = extract_rom_stem(name)
    if not stem then return nil end
    local digits = stem:match("v(%d+)")
    if not digits then return nil end
    return tonumber(digits)
end

local function canonical_rom_name(name)
    local target_ver = rom_version_number(name)
    if not target_ver then return nil end
    local roms = scan_roms()
    for _, rom in ipairs(roms) do
        if rom_version_number(rom) == target_ver then
            return rom
        end
    end
    local stem = extract_rom_stem(name)
    if stem then
        return stem .. ".md"
    end
    return nil
end

local function current_loaded_rom()
    local candidates = {}

    if gameinfo then
        if type(gameinfo.getromname) == "function" then
            candidates[#candidates+1] = gameinfo.getromname
        end
        if type(gameinfo.getromfilename) == "function" then
            candidates[#candidates+1] = gameinfo.getromfilename
        end
        if type(gameinfo.getfilename) == "function" then
            candidates[#candidates+1] = gameinfo.getfilename
        end
        if type(gameinfo.getpath) == "function" then
            candidates[#candidates+1] = gameinfo.getpath
        end
    end

    if client then
        if type(client.getromname) == "function" then
            candidates[#candidates+1] = client.getromname
        end
        if type(client.getfilename) == "function" then
            candidates[#candidates+1] = client.getfilename
        end
    end

    if emu then
        if type(emu.getromname) == "function" then
            candidates[#candidates+1] = emu.getromname
        end
        if type(emu.getgameinfo) == "function" then
            candidates[#candidates+1] = function()
                local info = emu.getgameinfo()
                if type(info) == "table" then
                    return info.romname or info.filename or info.name or info.path
                end
                return info
            end
        end
    end

    for _, getter in ipairs(candidates) do
        local ok, value = pcall(getter)
        if ok and type(value) == "string" and value ~= "" then
            local name = canonical_rom_name(value)
            if name then
                return name
            end
        end
    end

    return nil
end

local function strip_ext(name)
    if not name then return "unknown_rom" end
    return (name:gsub("%.[^.]+$", ""))
end

local function rom_version_tag(rom_name)
    local stem = strip_ext(rom_name)
    local ver = stem:match("_(v%d+)$")
    if ver then return ver end
    return stem
end

local function vector_name(id)
    return VECTOR_NAMES[id] or "(unknown vector)"
end

ensure_report_dir = function()
    os.execute('if not exist "' .. REPORT_DIR .. '" mkdir "' .. REPORT_DIR .. '"')
end

local function ensure_screenshot_dir()
    os.execute('if not exist "' .. SCREENSHOT_DIR .. '" mkdir "' .. SCREENSHOT_DIR .. '"')
end

local function reset_send_me_dir()
    os.execute('if exist "' .. SEND_ME_DIR .. '" rmdir /s /q "' .. SEND_ME_DIR .. '"')
    os.execute('if not exist "' .. SEND_ME_DIR .. '" mkdir "' .. SEND_ME_DIR .. '"')
end

local function copy_file(src_path, dst_path)
    local src = io.open(src_path, "rb")
    if not src then return false end

    local dst = io.open(dst_path, "wb")
    if not dst then
        src:close()
        return false
    end

    while true do
        local chunk = src:read(65536)
        if not chunk then break end
        dst:write(chunk)
    end

    dst:close()
    src:close()
    return true
end

bundle_file = function(path, alias_name)
    if not path then return nil end
    local name = alias_name or basename(path)
    if not name then return nil end
    local bundled = SEND_ME_DIR .. name
    if copy_file(path, bundled) then
        return bundled
    end
    return nil
end

local function capture_screenshot_file(file_name)
    ensure_screenshot_dir()
    local full_path = SCREENSHOT_DIR .. file_name
    client.screenshot(full_path)
    bundle_file(full_path)
    return full_path
end

local function get_report_paths(rom_name)
    local ver = rom_version_tag(rom_name)
    ensure_report_dir()
    return {
        report = REPORT_DIR .. "diag_report_" .. ver .. ".txt",
        menu = REPORT_DIR .. "diag_menu_" .. ver .. ".csv",
    }
end

local function get_domain_list()
    local ok, list = pcall(memory.getmemorydomainlist)
    if ok and list then return list end
    return {}
end

local function domain_exists(name)
    for _, d in ipairs(get_domain_list()) do
        if d == name then return true end
    end
    return false
end

local function pick_rom_domains()
    local ordered = {}
    local seen = {}
    local function add(name)
        if name and name ~= "" and not seen[name] and domain_exists(name) then
            seen[name] = true
            ordered[#ordered+1] = name
        end
    end

    for _, d in ipairs({"MD CART", "Genesis ROM", "ROM", "CART", "CART ROM", "M68K BUS", "68K BUS"}) do
        add(d)
    end

    for _, d in ipairs(get_domain_list()) do
        local upper = string.upper(d)
        local looks_like_rom =
            upper:find("ROM", 1, true) or
            upper:find("CART", 1, true) or
            upper:find("BUS", 1, true)
        local looks_like_ram =
            upper:find("RAM", 1, true) or
            upper:find("VRAM", 1, true) or
            upper:find("CRAM", 1, true) or
            upper:find("VSRAM", 1, true) or
            upper:find("SRAM", 1, true)
        if looks_like_rom and not looks_like_ram then
            add(d)
        end
    end

    return ordered
end

local function pick_rom_domain()
    local domains = pick_rom_domains()
    return domains[1]
end

local function get_domain_size(name)
    local ok, size = pcall(memory.getmemorydomainsize, name)
    if ok then return size end
    return nil
end

local function read_rom_byte(addr, rom_domain)
    if not rom_domain then return nil end
    if addr < 0 then return nil end
    local ok, val = pcall(memory.readbyte, addr, rom_domain)
    if ok then return val end
    return nil
end

local function make_sample_offsets(file_size)
    local points = {}
    local seen = {}
    local function add(offset)
        offset = math.floor(offset or 0)
        if offset < 0 then offset = 0 end
        if offset >= file_size then offset = file_size - 1 end
        if offset >= 0 and not seen[offset] then
            seen[offset] = true
            points[#points+1] = offset
        end
    end

    add(0)
    add(1)
    add(2)
    add(3)
    add(0x100)
    add(0x101)
    add(0x180)
    add(0x18E)
    add(math.floor(file_size / 4))
    add(math.floor(file_size / 2))
    add(file_size - 0x100)
    add(file_size - 1)
    return points
end

local function file_matches_loaded_rom_in_domain(rom_name, rom_domain)
    local rom_size = get_domain_size(rom_domain)
    if not rom_name or not rom_domain or not rom_size then return false end
    local path = ROM_DIR .. rom_name
    local f = io.open(path, "rb")
    if not f then return false end

    local file_size = f:seek("end")
    f:seek("set", 0)
    if not file_size or rom_size < file_size then
        f:close()
        return false
    end

    for _, offset in ipairs(make_sample_offsets(file_size)) do
        f:seek("set", offset)
        local chunk = f:read(1)
        if not chunk or read_rom_byte(offset, rom_domain) ~= string.byte(chunk, 1) then
            f:close()
            return false
        end
    end

    f:seek("set", 0)
    local addr = 0
    while addr < math.min(file_size, 4096) do
        local chunk = f:read(math.min(256, 4096 - addr))
        if not chunk or #chunk == 0 then break end
        for i = 1, #chunk do
            if read_rom_byte(addr + i - 1, rom_domain) ~= string.byte(chunk, i) then
                f:close()
                return false
            end
        end
        addr = addr + #chunk
    end

    f:close()
    return true
end

local function file_matches_loaded_rom(rom_name)
    for _, rom_domain in ipairs(pick_rom_domains()) do
        if file_matches_loaded_rom_in_domain(rom_name, rom_domain) then
            return true
        end
    end
    return false
end

local function detect_current_rom()
    local hinted = canonical_rom_name(START_ROM_HINT)
    if hinted then
        return hinted
    end

    local loaded = current_loaded_rom()
    if loaded then
        return loaded
    end

    return nil
end

local function dump_rom_bytes(center_pc, before_count, after_count, rom_domain)
    local lines = {}
    if not rom_domain then
        lines[#lines+1] = "  ROM domain not found; cannot dump bytes around PC."
        return lines
    end

    local rom_size = get_domain_size(rom_domain)
    if not rom_size then
        lines[#lines+1] = "  Could not determine ROM size for domain " .. rom_domain
        return lines
    end

    local start_addr = center_pc - before_count
    local end_addr   = center_pc + after_count
    if start_addr < 0 then start_addr = 0 end
    if end_addr >= rom_size then end_addr = rom_size - 1 end

    lines[#lines+1] = "  ROM domain: " .. rom_domain
    lines[#lines+1] = "  ROM size: " .. hex(rom_size, 6)
    lines[#lines+1] = "  Byte window: " .. hex(start_addr, 6) .. " - " .. hex(end_addr, 6)

    local row_start = start_addr - (start_addr % 16)
    while row_start <= end_addr do
        local row = string.format("  %s:", hex(row_start, 6))
        local ascii = ""
        for i = 0, 15 do
            local a = row_start + i
            if a >= 0 and a < rom_size then
                local b = read_rom_byte(a, rom_domain)
                if b == nil then
                    row = row .. " ??"
                    ascii = ascii .. "."
                else
                    row = row .. " " .. string.format("%02X", b)
                    if b >= 32 and b <= 126 then ascii = ascii .. string.char(b) else ascii = ascii .. "." end
                end
            else
                row = row .. "   "
                ascii = ascii .. " "
            end
        end
        row = row .. "  |" .. ascii .. "|"
        lines[#lines+1] = row
        row_start = row_start + 16
    end
    return lines
end

local function append_lines(dst, src)
    for _, s in ipairs(src) do dst[#dst+1] = s end
end

local function resolved_addr_source(addr)
    if not addr or addr == 0 then return "null" end
    if addr >= 0x00FF0000 and addr <= 0x00FFFFFF then return "68K RAM" end
    return "ROM" 
end

local function read_resolved_byte(addr, rom_domain)
    if not addr or addr == 0 then return nil end
    if addr >= 0x00FF0000 and addr <= 0x00FFFFFF then
        return safe_read_byte("68K RAM", addr % 0x10000)
    end
    if rom_domain then
        return read_rom_byte(addr, rom_domain)
    end
    return nil
end

local function dump_resolved_bytes(addr, count, rom_domain)
    local bytes = {}
    if not addr or addr == 0 then return "(null)" end
    for i = 0, count - 1 do
        local v = read_resolved_byte(addr + i, rom_domain)
        if v == nil then
            bytes[#bytes+1] = "??"
        else
            bytes[#bytes+1] = string.format("%02X", v)
        end
    end
    return table.concat(bytes, " ")
end

local function bank6_ptr_note(ptr)
    if ptr == 0xA869 then
        return "NES table entry $10 => title screen tile mappings ($A869)."
    elseif ptr == 0x0302 then
        return "NES table entry points at CPU RAM $0302; original bank 6 stores $FF there after the stream completes, so this is sentinel/cleanup state." 
    end
    return nil
end

local function title_tile_ptr()
    return read_ram(0x0000, 1) | (read_ram(0x0001, 1) << 8)
end

local function title_tile_count()
    return read_ram(0x0002, 1) | (read_ram(0x0003, 1) << 8)
end

local function title_tile_ptr_note(ptr)
    if ptr == 0x807F then
        return "Bank-2 title CHR upload source block 0 ($807F-$877E)."
    elseif ptr == 0x877F then
        return "Bank-2 title CHR upload source block 1 ($877F-$8E7E)."
    elseif ptr == 0x8E7F then
        return "Bank-2 title CHR upload source block 2 ($8E7F-$8F5E)."
    elseif ptr == 0x0000 then
        return "Null tile source pointer."
    end
    return nil
end

local function title_tile_count_note(count)
    if count == 0x0700 then
        return "Expected full 0x700-byte CHR transfer."
    elseif count == 0x00E0 then
        return "Expected short 0x0E0-byte CHR tail transfer."
    elseif count == 0x0000 then
        return "Transfer counter idle/finished."
    end
    return nil
end

local function push_ring(list, value, max_n)
    list[#list+1] = value
    if #list > max_n then
        table.remove(list, 1)
    end
end

local function trace_name(id)
    return TRACE_NAMES[id] or "(unknown checkpoint)"
end

local function pc_label(pc)
    return KNOWN_PC_LABELS[pc]
end

local function read_seq_event_slot(base)
    return {
        event_id = safe_read_u16("68K RAM", base),
        arg = safe_read_u16("68K RAM", base + 2),
        ptr_raw = safe_read_u16("68K RAM", base + 4),
        seq_index = safe_read_u16("68K RAM", base + 6),
        seq_byte = safe_read_u16("68K RAM", base + 8),
        seq_source = safe_read_u16("68K RAM", base + 10),
        ptr_res = safe_read_u32("68K RAM", base + 12),
    }
end

local function read_ppu_event_slot(base)
    return {
        event_id = safe_read_u16("68K RAM", base),
        arg0 = safe_read_u16("68K RAM", base + 2),
        arg1 = safe_read_u16("68K RAM", base + 4),
        arg2 = safe_read_u16("68K RAM", base + 6),
        ppu_index = safe_read_u16("68K RAM", base + 8),
        ptr_raw = safe_read_u16("68K RAM", base + 10),
        ptr_res = safe_read_u32("68K RAM", base + 12),
    }
end

local function read_event_ring(count_addr, ring_addr, decoder)
    local total = read_ram(count_addr, 2)
    local entries = {}
    local used = math.min(total, TRACE_EVT_RING_SIZE)
    for i = 0, used - 1 do
        local ring_index = (total - used + i) % TRACE_EVT_RING_SIZE
        local base = ring_addr + ring_index * TRACE_EVT_SLOT_SIZE
        entries[#entries + 1] = decoder(base)
    end
    return total, entries
end

local function read_trace_state()
    local seq = read_ram(TRACE_SEQ_ADDR, 2)
    local last = read_ram(TRACE_LAST_ADDR, 2)
    local ring = {}
    for i = 0, TRACE_RING_SIZE - 1 do
        ring[#ring+1] = read_ram(TRACE_RING_ADDR + i * 2, 2)
    end
    local seq_evt_count, seq_events = read_event_ring(TRACE_SEQ_EVT_COUNT_ADDR, TRACE_SEQ_EVT_RING_ADDR, read_seq_event_slot)
    local ppu_evt_count, ppu_events = read_event_ring(TRACE_PPU_EVT_COUNT_ADDR, TRACE_PPU_EVT_RING_ADDR, read_ppu_event_slot)
    return {
        seq = seq,
        last = last,
        ring = ring,
        seq_evt_count = seq_evt_count,
        seq_events = seq_events,
        ppu_evt_count = ppu_evt_count,
        ppu_events = ppu_events,
    }
end

local function get_trace_history(state)
    local history = {}
    local count = math.min(state.seq, TRACE_RING_SIZE)
    for i = 0, count - 1 do
        local ring_index = ((state.seq - count + i) % TRACE_RING_SIZE) + 1
        history[#history+1] = state.ring[ring_index]
    end
    return history
end

local function read_crash_info()
    return {
        magic = read_ram(0xEE00, 2),
        vector = read_ram(0xEE02, 2),
        sp = read_ram(0xEE04, 4),
        sr = read_ram(0xEE08, 2),
        pc = read_ram(0xEE0A, 4),
        aux_long = read_ram(CRASH_AUX_ADDR, 4),
        aux_word = read_ram(CRASH_AUX_ADDR + 4, 2),
    }
end

-- ======================== RAM WATCHES ============================
local WATCHES = {
    {addr=0x0000, sz=1, name="ppu_data_lo",    desc="PPU buf ptr lo  [ZP $00]"},
    {addr=0x0001, sz=1, name="ppu_data_hi",    desc="PPU buf ptr hi  [ZP $01]"},
    {addr=0x0000, sz=1, name="ram_0000_t41",   desc="bank-05 branch bitmask / scan state [$00]"},
    {addr=0x0001, sz=1, name="ram_0000_t42",   desc="bank-05 secondary bitmask state [$01]"},
    {addr=0x0002, sz=1, name="slot_tmp_02",    desc="slot/file-select temp byte 0 [ZP $02]"},
    {addr=0x0003, sz=1, name="slot_tmp_03",    desc="slot/file-select temp byte 1 [ZP $03]"},
    {addr=0x0004, sz=1, name="obj_pos_x",      desc="object X-ish scratch [ZP $04]"},
    {addr=0x0005, sz=1, name="obj_pos_y",      desc="object Y-ish scratch [ZP $05]"},
    {addr=0x0010, sz=1, name="game_mode",      desc="dungeon_level/game mode [ZP $10]"},
    {addr=0x0011, sz=1, name="screen_ready",   desc="screen_ready_flag (0=init) [ZP $11]"},
    {addr=0x0012, sz=1, name="ram_script",     desc="current script# (0=title) [ZP $12]"},
    {addr=0x0013, sz=1, name="ram_subscript",  desc="sub-script [ZP $13]"},
    {addr=0x0014, sz=1, name="ppu_load_index", desc="PPU data table index [ZP $14]"},
    {addr=0x0015, sz=1, name="ram_frm_cnt",    desc="frame counter / NMI completion [ZP $15]"},
    {addr=0x0016, sz=1, name="cur_save_slot",  desc="current save slot [ZP $16]"},
    {addr=0x0017, sz=1, name="rendering_flag", desc="blocks render enable [ZP $17]"},
    {addr=0x004D, sz=1, name="ram_004D",       desc="menu/file-select timer/gate [$4D]"},
    {addr=0x005B, sz=1, name="ram_next_script",desc="next_script [ZP $5B]"},
    {addr=0x005C, sz=1, name="ram_005C",       desc="NMI toggle flag [ZP $5C]"},
    {addr=0x0066, sz=1, name="se_ptr_lo",      desc="music seq ptr lo [ZP $66]"},
    {addr=0x0067, sz=1, name="se_ptr_hi",      desc="music seq ptr hi [ZP $67]"},
    {addr=0x006C, sz=1, name="link_dir",       desc="direction / state scratch [ZP $6C]"},
    {addr=0x0070, sz=1, name="obj_id_0",       desc="object slot 0 id [ZP $70]"},
    {addr=0x0071, sz=1, name="obj_id_1",       desc="object slot 1 id [ZP $71]"},
    {addr=0x00E0, sz=1, name="pause_flag",     desc="pause_flag [ZP $E0]"},
    {addr=0x00E1, sz=1, name="pause_script",   desc="pause_script [ZP $E1]"},
    {addr=0x00E3, sz=1, name="screen_trans",   desc="screen_transition_flag [ZP $E3]"},
    {addr=0x00E7, sz=1, name="ram_00E7",       desc="bank-05 branch selector / direction mask [$E7]"},
    {addr=0x00EB, sz=1, name="ram_map_location", desc="current map location [$EB]"},
    {addr=0x00EC, sz=1, name="ram_next_map_location", desc="next map location [$EC]"},
    {addr=0x00F4, sz=1, name="ram_00F4",       desc="reset/setup flag [ZP $F4]"},
    {addr=0x00F8, sz=1, name="btn_press_lo",   desc="button press lo byte"},
    {addr=0x00F9, sz=1, name="btn_press_hi",   desc="button press hi byte"},
    {addr=0x00FA, sz=1, name="btn_hold_lo",    desc="button hold lo byte"},
    {addr=0x00FB, sz=1, name="btn_hold_hi",    desc="button hold hi byte"},
    {addr=0x00FC, sz=1, name="scroll_Y",       desc="ram_scroll_Y [ZP $FC]"},
    {addr=0x00FD, sz=1, name="scroll_X",       desc="ram_scroll_X [ZP $FD]"},
    {addr=0x00FE, sz=1, name="ram_for_2001",   desc="PPU $2001 mirror - render ctrl [ZP $FE]"},
    {addr=0x00FF, sz=1, name="ram_for_2000",   desc="PPU $2000 mirror - NMI enable bit7 [ZP $FF]"},
    {addr=0x0200, sz=1, name="oam_0_y",        desc="OAM sprite0 Y"},
    {addr=0x0201, sz=1, name="oam_0_tile",     desc="OAM sprite0 tile"},
    {addr=0x0202, sz=1, name="oam_0_attr",     desc="OAM sprite0 attr"},
    {addr=0x0203, sz=1, name="oam_0_x",        desc="OAM sprite0 X"},
    {addr=0x0300, sz=1, name="ppu_buf_status", desc="$3F when buffer write complete"},
    {addr=0x0301, sz=1, name="ppu_buf_index",  desc="PPU buffer write index"},
    {addr=0x0302, sz=1, name="ppu_buf_0",      desc="PPU buffer[0] ($FF=terminator)"},
    {addr=0x0303, sz=1, name="ppu_buf_1",      desc="PPU buffer[1]"},
    {addr=0x0304, sz=1, name="ppu_buf_2",      desc="PPU buffer[2]"},
    {addr=0x0305, sz=1, name="ppu_buf_3",      desc="PPU buffer[3]"},
    {addr=0x0310, sz=1, name="ppu_buf_16",     desc="PPU buffer[16]"},
    {addr=0x0311, sz=1, name="ppu_buf_17",     desc="PPU buffer[17]"},
    {addr=0x0343, sz=1, name="spr_index_1",    desc="sprite list index 1 [$0343]"},
    {addr=0x0344, sz=1, name="spr_index_2",    desc="sprite list index 2 [$0344]"},
    {addr=0x041F, sz=1, name="ram_041F",       desc="menu/file-select text row index [$041F]"},
    {addr=0x0421, sz=1, name="ram_0421",       desc="menu/file-select slot char cursor [$0421]"},
    {addr=0x0423, sz=1, name="ram_0423",       desc="menu/file-select name copy counter [$0423]"},
    {addr=0xEF00, sz=1, name="PPUCTRL_SHADOW", desc="Shadow PPU $2000"},
    {addr=0xEF01, sz=1, name="PPUMASK_SHADOW", desc="Shadow PPU $2001"},
    {addr=0xEF04, sz=1, name="PPUADDR_LATCH",  desc="PPUADDR latch state"},
    {addr=0xEF05, sz=1, name="PPUSCROLL_X_sh", desc="HScroll shadow"},
    {addr=0xEF06, sz=1, name="PPUSCROLL_Y_sh", desc="VScroll shadow"},
    {addr=0xEF07, sz=1, name="PPUSCROLL_LATCH",desc="PPUSCROLL latch state"},
    {addr=0xEF08, sz=2, name="VRAM_ADDR_CURR", desc="Current VRAM write addr"},
    {addr=0xEF0A, sz=1, name="VDP_REG1",       desc="VDP Mode2 shadow"},
    {addr=0xEE00, sz=2, name="CRASH_MAGIC",    desc="Crash logger magic"},
    {addr=0xEE02, sz=2, name="CRASH_VEC",      desc="Crash logger vector/format (optional)"},
    {addr=0xEE04, sz=4, name="CRASH_SP",       desc="Crash logger SP (optional)"},
    {addr=0xEE08, sz=2, name="CRASH_SR",       desc="Crash logger SR (optional)"},
    {addr=0xEE0A, sz=4, name="CRASH_PC",       desc="Crash logger PC (optional)"},
    {addr=0xEE80, sz=4, name="CRASH_AUX",      desc="Crash aux data (fault addr for bus/address)"},
    {addr=0xEE84, sz=2, name="CRASH_AUX_W",    desc="Crash aux word (IR/SSW for bus/address)"},
    {addr=0xF000, sz=2, name="TRACE_LAST",     desc="Last startup checkpoint"},
    {addr=0xF002, sz=2, name="TRACE_SEQ",      desc="Startup checkpoint sequence"},
    {addr=0xF080, sz=2, name="BANK_RAW",       desc="Raw bank arg word before byte cleanup"},
    {addr=0xF082, sz=2, name="BANK_POST",      desc="Bank arg word after byte-only shifts"},
    {addr=0xF084, sz=2, name="SCRIPT_RAW",     desc="Raw script selector word seen by helper"},
    {addr=0xF086, sz=2, name="DISPATCH_INDEX", desc="Sanitized helper table offset"},
    {addr=0xF088, sz=4, name="DISPATCH_BASE",  desc="Helper table base / popped return address"},
    {addr=0xF08C, sz=4, name="DISPATCH_TARGET",desc="Resolved helper jump target"},
    {addr=0xF090, sz=4, name="DISPATCH_STACK", desc="Helper caller stack pointer before pop"},
    {addr=0xF094, sz=2, name="SEQ_PTR_RAW",    desc="Raw seq ptr word loaded from $66/$67"},
    {addr=0xF098, sz=4, name="SEQ_PTR_RES",    desc="Resolved seq ptr address used by loader"},
    {addr=0xF09C, sz=2, name="SEQ_INDEX",      desc="Current seq index passed to loader"},
    {addr=0xF09E, sz=2, name="SEQ_BYTE",       desc="Current seq byte returned by loader"},
    {addr=0xF0A0, sz=2, name="SEQ_SOURCE",     desc="Current music source/request during seq load"},
    {addr=0xF0A2, sz=2, name="PPU_REQ_INDEX",  desc="Last bank-6 ppu_load_index request seen by writer"},
    {addr=0xF0A4, sz=2, name="PPU_REQ_PTR",    desc="Raw NES pointer word from bank-6 PPU table"},
    {addr=0xF0A8, sz=4, name="PPU_REQ_RES",    desc="Resolved ROM/BAT buffer address used by bank-6"},
    {addr=0xF0AC, sz=2, name="SEQ_EVT_COUNT",  desc="Sequence event ring total count"},
    {addr=0xF0AE, sz=2, name="PPU_EVT_COUNT",  desc="PPU event ring total count"},
}

-- Hand-picked loop-release suspects to summarize separately.
local LOOP_SUSPECT_NAMES = {
    "game_mode",
    "screen_ready",
    "ram_script",
    "ram_subscript",
    "ppu_load_index",
    "ram_frm_cnt",
    "rendering_flag",
    "ram_next_script",
    "ram_005C",
    "ram_00E7",
    "ram_map_location",
    "ram_next_map_location",
    "se_ptr_lo",
    "se_ptr_hi",
    "scroll_Y",
    "scroll_X",
    "ram_0000_t41",
    "ram_0000_t42",
    "ram_for_2001",
    "ram_for_2000",
    "ppu_buf_status",
    "ppu_buf_index",
    "PPUCTRL_SHADOW",
    "PPUMASK_SHADOW",
    "PPUSCROLL_X_sh",
    "PPUSCROLL_Y_sh",
    "VDP_REG1",
    "SEQ_PTR_RAW",
    "SEQ_PTR_RES",
    "SEQ_INDEX",
    "SEQ_BYTE",
    "SEQ_SOURCE",
    "PPU_REQ_INDEX",
    "PPU_REQ_PTR",
    "PPU_REQ_RES",
}

local function run_diagnostics(rom_name)
    local rom_base = strip_ext(rom_name)
    local report_paths = get_report_paths(rom_name)
    local report_path = report_paths.report
    local report = {}
    local function log(s) report[#report+1] = s end
    local function log_sep(title)
        log("")
        log("=== " .. title .. " " .. string.rep("=", math.max(0, 58 - #title)))
    end

    local rom_domain = pick_rom_domain()

    local ram_prev, ram_changes = {}, {}
    local pc_histogram = {}
    local helper_hits = {}
    local pc_min, pc_max = 0xFFFFFF, 0
    local vram_nonzero, cram_data = 0, {}
    local milestones = {}
    local stuck_pc, stuck_count, last_pc = nil, 0, 0
    local screenshots_taken, screenshot_set = {}, {}
    local vdp_reg1_transitions = {}
    local vdp_lost_vint = false
    local vdp_lost_frame = nil
    local ppu2000_nonzero_frame = nil
    local ppu2001_nonzero_frame = nil
    local last_vdp_reg1 = nil
    local prev_frmcnt = nil
    local nmi_run_count = 0
    local mode_seen = {}
    local max_vram_addr = 0
    local min_vram_addr = 0xFFFF
    local unique_pc_count = 0
    local pc_seen = {}
    local pc_run_len, longest_same_pc, longest_same_pc_addr = 0, 0, 0
    local oam_nonzero_words = 0
    local crash_detected = false
    local crash_frame = nil
    local frames_ran = NUM_FRAMES
    local trace_state = nil

    -- New loop-focused telemetry
    local pc_trace = {}
    local distinct_pc_trace = {}
    local prev_pc = nil
    local target_loop_first_frame = nil
    local target_loop_entry_frame = nil
    local target_loop_entry_prev_pc = nil
    local target_loop_prehistory = {}
    local last_non_target_pc = nil
    local loop_candidate_notes = {}
    local bank6_flow = {}
    local bank6_last = nil
    local title_slice_flow = {}
    local title_slice_last = nil
    local slot_select_flow = {}
    local slot_select_last = nil
    local menu_trace_rows = { menu_trace_header() }
    local menu_milestones = {
        script1 = nil,
        subscript = nil,
        load14 = nil,
        slot = nil,
        row041F = nil,
        row0421 = nil,
        row0423 = nil,
        spr = nil,
        req14 = nil,
    }
    local startup_flags = {
        reached_main_handler = false,
        reached_title_dispatch = false,
        reached_title_stage1 = false,
        reached_title_fill1_stub = false,
        reached_bank6_real_ptr = false,
        reached_bank6_legacy_fallback = false,
        sequence_loader_live = false,
        any_seq_events = false,
        any_ppu_events = false,
    }

    for _, f in ipairs(SCREENSHOT_AT) do screenshot_set[f] = true end
    local function add_ms(frame, event) milestones[#milestones+1] = {frame=frame, event=event} end

    memory.usememorydomain("68K RAM")
    for _, w in ipairs(WATCHES) do
        local val = read_ram(w.addr, w.sz)
        ram_prev[w.addr] = val
        ram_changes[w.addr] = {
            count=0, first_frame=-1, last_frame=-1,
            first_val=val, last_val=val,
            min_val=val, max_val=val,
            unique={[val]=true}, history={}
        }
    end
    prev_frmcnt = read_ram(0x0015,1)
    last_vdp_reg1 = read_ram(0xEF0A,1)

    for i = 1, NUM_FRAMES do
        local regs = emu.getregisters()
        local pc = regs["M68K PC"] or regs["PC"] or 0
        pc_histogram[pc] = (pc_histogram[pc] or 0) + 1
        if not pc_seen[pc] then pc_seen[pc] = true; unique_pc_count = unique_pc_count + 1 end
        if pc < pc_min then pc_min = pc end
        if pc > pc_max then pc_max = pc end

        push_ring(pc_trace, pc, 64)
        if prev_pc == nil or prev_pc ~= pc then
            push_ring(distinct_pc_trace, {frame=i, pc=pc}, TARGET_LOOP_PREHISTORY)
        end

        if pc ~= TARGET_LOOP_PC then
            last_non_target_pc = {frame=i, pc=pc}
        elseif target_loop_first_frame == nil then
            target_loop_first_frame = i
        end

        for _, sym in ipairs(HOT_SYMBOLS) do
            if pc >= sym.addr and pc < (sym.addr + 0x20) then
                helper_hits[sym.name] = (helper_hits[sym.name] or 0) + 1
            end
        end

        if pc == last_pc then
            stuck_count = stuck_count + 1
            pc_run_len = pc_run_len + 1
            if stuck_count == LOOP_STABLE_THRESHOLD and not stuck_pc then
                stuck_pc = pc
                add_ms(i, "STUCK: PC=" .. hex(pc,6) .. " for 30+ frames")
                if pc == TARGET_LOOP_PC then
                    target_loop_entry_frame = i
                    if last_non_target_pc then
                        target_loop_entry_prev_pc = last_non_target_pc.pc
                    end
                    for _, item in ipairs(distinct_pc_trace) do
                        target_loop_prehistory[#target_loop_prehistory+1] = item
                    end
                end
            end
            if pc_run_len > longest_same_pc then
                longest_same_pc = pc_run_len
                longest_same_pc_addr = pc
            end
        else
            stuck_count = 0
            pc_run_len = 1
        end
        last_pc = pc
        prev_pc = pc

        for _, w in ipairs(WATCHES) do
            local val = read_ram(w.addr, w.sz)
            local prev = ram_prev[w.addr]
            local info = ram_changes[w.addr]
            if val ~= prev then
                info.count = info.count + 1
                if info.first_frame == -1 then info.first_frame = i end
                info.last_frame = i
                info.last_val = val
                if val < info.min_val then info.min_val = val end
                if val > info.max_val then info.max_val = val end
                info.unique[val] = true
                if #info.history < 50 then
                    info.history[#info.history+1] = {frame=i, old=prev, new=val}
                end
                ram_prev[w.addr] = val
            end
        end

        local r2000  = read_ram(0x00FF,1)
        local r2001  = read_ram(0x00FE,1)
        local reg1   = read_ram(0xEF0A,1)
        local ppuctrl= read_ram(0xEF00,1)
        local mode   = read_ram(0x0010,1)
        local sub    = read_ram(0x0011,1)
        local frmcnt = read_ram(0x0015,1)
        local vramc  = read_ram(0xEF08,2)
        if vramc > max_vram_addr then max_vram_addr = vramc end
        if vramc < min_vram_addr then min_vram_addr = vramc end

        if ppu2000_nonzero_frame == nil and r2000 ~= 0 then
            ppu2000_nonzero_frame = i
            add_ms(i, "ram_for_2000 became nonzero: " .. hex(r2000))
        end
        if ppu2001_nonzero_frame == nil and r2001 ~= 0 then
            ppu2001_nonzero_frame = i
            add_ms(i, "ram_for_2001 became nonzero: " .. hex(r2001))
        end
        if ppuctrl ~= 0 and ram_changes[0xEF00].count == 1 and ram_changes[0xEF00].last_frame == i then
            add_ms(i, "PPU_WRITE_2000 set shadow=" .. hex(ppuctrl))
        end
        if r2001 >= 0x08 and ram_changes[0x00FE].count == 1 and ram_changes[0x00FE].last_frame == i then
            add_ms(i, "RENDER ENABLED: ram_for_2001=" .. hex(r2001))
        end
        if (reg1 & 0x20) ~= 0 and (last_vdp_reg1 & 0x20) == 0 then
            add_ms(i, "VDP VINT ON: VDP_REG1=" .. hex(reg1))
        end
        if (reg1 & 0x40) ~= 0 and (last_vdp_reg1 & 0x40) == 0 then
            add_ms(i, "VDP DISPLAY ON: VDP_REG1=" .. hex(reg1))
        end
        if (last_vdp_reg1 & 0x20) ~= 0 and (reg1 & 0x20) == 0 and not vdp_lost_vint then
            vdp_lost_vint = true
            vdp_lost_frame = i
            add_ms(i, "VDP VINT LOST: VDP_REG1=" .. hex(reg1))
        end
        if reg1 ~= last_vdp_reg1 then
            vdp_reg1_transitions[#vdp_reg1_transitions+1] = {frame=i, old=last_vdp_reg1, new=reg1}
            last_vdp_reg1 = reg1
        end
        if frmcnt ~= prev_frmcnt then
            nmi_run_count = nmi_run_count + 1
            add_ms(i, "ram_frm_cnt changed: " .. hex(prev_frmcnt) .. " -> " .. hex(frmcnt))
            prev_frmcnt = frmcnt
        end

        local mk = hex(mode) .. "/" .. hex(sub)
        if not mode_seen[mk] then mode_seen[mk] = true; add_ms(i, "GAME MODE: dungeon=" .. hex(mode) .. " screen_ready=" .. hex(sub)) end
        local uflag = read_ram(0x0300,1)
        if uflag == 0x3F and ram_changes[0x0300].count == 0 and i == 1 then
            add_ms(i, "PPU BUFFER WRITE COMPLETE: $0300=$3F")
        elseif uflag == 0x3F and ram_changes[0x0300].count > 0 and ram_changes[0x0300].last_frame == i then
            add_ms(i, "PPU BUFFER WRITE COMPLETE: $0300=$3F")
        end

        local status = string.format("[%s] F:%d PC:%s r2000:%s r2001:%s reg1:%s frm:%s vram:%s",
            rom_name or "?", i, hex(pc,6), hex(r2000), hex(r2001), hex(reg1), hex(frmcnt), hex(vramc,4))
        gui.drawText(0, STATUS_Y, status, 0xFFFFFFFF, 0xCC000000, 10)

        local trace_last = read_ram(TRACE_LAST_ADDR, 2)
        local req_index_now = read_ram(0xF0A2, 2)
        local req_ptr_now = read_ram(0xF0A4, 2)
        local req_res_now = read_ram(0xF0A8, 4)
        local ppu_evt_now = read_ram(0xF0AE, 2)
        local bank6_state = string.format("%04X/%04X/%08X/%04X/%02X/%02X/%02X/%02X/%04X",
            req_index_now,
            req_ptr_now,
            req_res_now,
            ppu_evt_now,
            read_ram(0x0014,1),
            read_ram(0x0300,1),
            read_ram(0x0301,1),
            read_ram(0x0302,1),
            trace_last)
        if bank6_last == nil or bank6_last ~= bank6_state then
            bank6_flow[#bank6_flow+1] = {
                frame = i,
                pc = pc,
                trace_last = trace_last,
                req_index = req_index_now,
                req_ptr = req_ptr_now,
                req_res = req_res_now,
                ppu_evt = ppu_evt_now,
                ppu_load_index = read_ram(0x0014,1),
                buf0 = read_ram(0x0300,1),
                buf1 = read_ram(0x0301,1),
                buf2 = read_ram(0x0302,1),
                buf3 = read_ram(0x0303,1),
                buf4 = read_ram(0x0304,1),
                buf5 = read_ram(0x0305,1),
                note = bank6_ptr_note(req_ptr_now),
            }
            bank6_last = bank6_state
        end
        if trace_last == 0x0310 then startup_flags.reached_main_handler = true end
        if trace_last == 0x0320 then startup_flags.reached_title_dispatch = true end
        if trace_last == 0x0321 then startup_flags.reached_title_stage1 = true end
        if trace_last == 0x0410 then startup_flags.reached_title_fill1_stub = true end
        if trace_last == 0x0440 then startup_flags.reached_bank6_real_ptr = true end
        if trace_last == 0x0442 then startup_flags.reached_bank6_legacy_fallback = true end
        if read_ram(TRACE_SEQ_EVT_COUNT_ADDR, 2) ~= 0 then startup_flags.any_seq_events = true end
        if read_ram(TRACE_PPU_EVT_COUNT_ADDR, 2) ~= 0 then startup_flags.any_ppu_events = true end
        if read_ram(0xF0AC, 2) ~= 0 then startup_flags.sequence_loader_live = true end

        local title_phase = read_ram(0x051D, 1)
        local title_ptr = title_tile_ptr()
        local title_count = title_tile_count()
        local title_vram = read_ram(0xEF08, 2)
        local title_evt = read_ram(0xF0AE, 2)
        local title_state = string.format("%02X/%04X/%04X/%04X/%04X/%02X/%02X/%02X",
            title_phase,
            title_ptr,
            title_count,
            title_vram,
            trace_last,
            read_ram(0x0011,1),
            read_ram(0x0014,1),
            read_ram(0x00F5,1))
        if title_slice_last == nil or title_slice_last ~= title_state then
            title_slice_flow[#title_slice_flow + 1] = {
                frame = i,
                pc = pc,
                trace_last = trace_last,
                phase = title_phase,
                tile_ptr = title_ptr,
                tile_count = title_count,
                vram_addr = title_vram,
                screen_ready = read_ram(0x0011,1),
                ppu_load_index = read_ram(0x0014,1),
                reset_guard = read_ram(0x00F5,1),
                ppu_evt = title_evt,
                ptr_note = title_tile_ptr_note(title_ptr),
                count_note = title_tile_count_note(title_count),
            }
            title_slice_last = title_state
        end

        local slot_script = read_ram(0x0012, 1)
        local slot_sub = read_ram(0x0013, 1)
        local slot_load = read_ram(0x0014, 1)
        local slot_cur = read_ram(0x0016, 1)
        local slot_gate = read_ram(0x004D, 1)
        local slot_i_041F = read_ram(0x041F, 1)
        local slot_i_0421 = read_ram(0x0421, 1)
        local slot_i_0423 = read_ram(0x0423, 1)
        local slot_tmp_02 = read_ram(0x0002, 1)
        local slot_tmp_03 = read_ram(0x0003, 1)
        local slot_tmp_04 = read_ram(0x0004, 1)
        local slot_tmp_05 = read_ram(0x0005, 1)
        local slot_spr_idx_1 = read_ram(0x0343, 1)
        local slot_spr_idx_2 = read_ram(0x0344, 1)
        local slot_state = string.format("%02X/%02X/%02X/%02X/%02X/%02X/%02X/%02X/%02X/%02X/%02X/%02X/%02X/%04X",
            slot_script,
            slot_sub,
            slot_load,
            slot_cur,
            slot_gate,
            slot_i_041F,
            slot_i_0421,
            slot_i_0423,
            slot_tmp_02,
            slot_tmp_03,
            slot_tmp_04,
            slot_tmp_05,
            slot_spr_idx_1,
            slot_spr_idx_2,
            trace_last)
        local slot_interesting =
            slot_script == 0x01 or
            slot_load == 0x6A or slot_load == 0x6C or slot_load == 0x76 or slot_load == 0x78 or
            trace_last == 0x0437 or trace_last == 0x0438
        if slot_interesting and (slot_select_last == nil or slot_select_last ~= slot_state) then
            slot_select_flow[#slot_select_flow + 1] = {
                frame = i,
                pc = pc,
                trace_last = trace_last,
                script = slot_script,
                subscript = slot_sub,
                load = slot_load,
                cur_slot = slot_cur,
                gate = slot_gate,
                idx_041F = slot_i_041F,
                idx_0421 = slot_i_0421,
                idx_0423 = slot_i_0423,
                tmp_02 = slot_tmp_02,
                tmp_03 = slot_tmp_03,
                tmp_04 = slot_tmp_04,
                tmp_05 = slot_tmp_05,
                spr_index_1 = slot_spr_idx_1,
                spr_index_2 = slot_spr_idx_2,
                ppu_evt = ppu_evt_now,
                buf0 = read_ram(0x0300,1),
                buf1 = read_ram(0x0301,1),
                buf2 = read_ram(0x0302,1),
                buf3 = read_ram(0x0303,1),
                buf4 = read_ram(0x0304,1),
                buf5 = read_ram(0x0305,1),
                buf6 = read_ram(0x0306,1),
                buf7 = read_ram(0x0307,1),
            }
            slot_select_last = slot_state
        end

        menu_trace_rows[#menu_trace_rows + 1] = capture_menu_trace_row(i, rom_name, pc)
        if menu_milestones.script1 == nil and slot_script == 0x01 then
            menu_milestones.script1 = i
        end
        if menu_milestones.subscript == nil and slot_sub ~= 0x00 then
            menu_milestones.subscript = i
        end
        if menu_milestones.load14 == nil and slot_load == 0x14 then
            menu_milestones.load14 = i
        end
        if menu_milestones.slot == nil and slot_cur ~= 0x00 then
            menu_milestones.slot = i
        end
        if menu_milestones.row041F == nil and slot_i_041F ~= 0x00 then
            menu_milestones.row041F = i
        end
        if menu_milestones.row0421 == nil and slot_i_0421 ~= 0x00 then
            menu_milestones.row0421 = i
        end
        if menu_milestones.row0423 == nil and slot_i_0423 ~= 0x00 then
            menu_milestones.row0423 = i
        end
        if menu_milestones.spr == nil and (slot_spr_idx_1 ~= 0x00 or slot_spr_idx_2 ~= 0x00) then
            menu_milestones.spr = i
        end
        if menu_milestones.req14 == nil and req_index_now == 0x0014 then
            menu_milestones.req14 = i
        end

        local current_crash = read_crash_info()
        if current_crash.magic == 0xBEEF and not crash_detected then
            crash_detected = true
            crash_frame = i
            frames_ran = i
            trace_state = read_trace_state()
            add_ms(i, "CRASH LOGGER ARMED: vector=" .. hex(current_crash.vector, 4) .. " " .. vector_name(current_crash.vector))
            add_ms(i, "CRASH LOGGER ARMED: last checkpoint=" .. hex(trace_state.last, 4) .. " " .. trace_name(trace_state.last))
            if STOP_ON_CRASH then
                if not screenshot_set[i] then
                    local fname = rom_base .. "_f" .. string.format("%03d", i) .. "_crash.png"
                    screenshots_taken[#screenshots_taken+1] = capture_screenshot_file(fname)
                end
                break
            end
        end

        if screenshot_set[i] then
            local fname = rom_base .. "_f" .. string.format("%03d", i) .. ".png"
            screenshots_taken[#screenshots_taken+1] = capture_screenshot_file(fname)
        end
        emu.frameadvance()
    end

    if not crash_detected then
        trace_state = read_trace_state()
    end

    local crash_info = read_crash_info()

    if SAMPLE_VRAM then
        local vram_regions = {}
        for addr = 0, 65535, 2 do
            local val = safe_read_u16("VRAM", addr)
            if val ~= 0 then
                vram_nonzero = vram_nonzero + 1
                local block = math.floor(addr / 1024)
                vram_regions[block] = (vram_regions[block] or 0) + 1
            end
        end
        ram_changes.vram_regions = vram_regions
    end

    if SAMPLE_CRAM then
        for addr = 0, 127, 2 do
            cram_data[#cram_data+1] = safe_read_u16("CRAM", addr)
        end
    end

    for addr = 0x0200, 0x027F, 2 do
        if safe_read_byte("68K RAM", addr) ~= 0 or safe_read_byte("68K RAM", addr+1) ~= 0 then
            oam_nonzero_words = oam_nonzero_words + 1
        end
    end

    log("================================================================")
    log("  ZELDA GENESIS PORT - DIAGNOSTIC REPORT  " .. SCRIPT_VERSION)
    log("  ROM: " .. (rom_name or "(unknown)"))
    log("  Frames: " .. frames_ran .. "  (~" .. string.format("%.1f", frames_ran/60.0) .. "s)")
    log("  Report path: " .. report_path)
    log("  ROM dir: " .. ROM_DIR)
    log("  ROM domain: " .. (rom_domain or "(not found)"))
    log("================================================================")

    log_sep("EXECUTIVE SUMMARY")
    local checks = {}
    local final_r2000 = read_ram(0x00FF,1)
    local final_reg1  = read_ram(0xEF0A,1)
    local final_shadow= read_ram(0xEF00,1)

    if (final_r2000 & 0x80) ~= 0 then
        checks[#checks+1] = "PASS  NMI enabled (ram_for_2000 bit7=1)"
    elseif final_r2000 ~= 0 then
        checks[#checks+1] = "WARN  NMI partially set (ram_for_2000=" .. hex(final_r2000) .. " bit7=0)"
    else
        checks[#checks+1] = "FAIL  NMI never enabled (ram_for_2000 always 0)"
    end

    if nmi_run_count > 0 then
        checks[#checks+1] = "PASS  NMI handler visibly completed (ram_frm_cnt changed " .. nmi_run_count .. " times)"
    else
        checks[#checks+1] = "FAIL  NMI handler never visibly completed (ram_frm_cnt stuck)"
    end

    if final_shadow ~= 0 then
        checks[#checks+1] = "PASS  PPU_WRITE_2000 updated shadow (PPUCTRL_SHADOW=" .. hex(final_shadow) .. ")"
    else
        checks[#checks+1] = "FAIL  PPU_WRITE_2000 never updated shadow"
    end

    if (final_reg1 & 0x20) ~= 0 then
        checks[#checks+1] = "PASS  VDP VINT enabled"
    else
        checks[#checks+1] = "FAIL  VDP VINT never enabled"
    end

    if (final_reg1 & 0x40) ~= 0 then
        checks[#checks+1] = "PASS  VDP display enabled"
    else
        checks[#checks+1] = "FAIL  VDP display never enabled"
    end

    if vram_nonzero > 0 then checks[#checks+1] = "PASS  VRAM has " .. vram_nonzero .. " nonzero words" else checks[#checks+1] = "FAIL  VRAM completely empty" end

    local palette_nonzero = 0
    for _, v in ipairs(cram_data) do if v ~= 0 then palette_nonzero = palette_nonzero + 1 end end
    if palette_nonzero > 0 then checks[#checks+1] = "PASS  CRAM has " .. palette_nonzero .. " nonzero colors" else checks[#checks+1] = "FAIL  CRAM empty" end

    if read_ram(0x0300,1) == 0x3F then checks[#checks+1] = "PASS  PPU buffer write completed" else checks[#checks+1] = "FAIL  PPU buffer write never completed (ppu_buf_0=" .. hex(read_ram(0x0302,1)) .. ")" end
    if not stuck_pc then checks[#checks+1] = "PASS  CPU not stuck in a single location" else checks[#checks+1] = "FAIL  CPU STUCK at PC=" .. hex(stuck_pc,6) .. " for 30+ frames" end
    if read_ram(0x00FE,1) >= 0x08 then checks[#checks+1] = "PASS  Rendering enabled (ram_for_2001=" .. hex(read_ram(0x00FE,1)) .. ")" else checks[#checks+1] = "WARN  Rendering never enabled" end

    local unique_modes = 0
    for _ in pairs(mode_seen) do unique_modes = unique_modes + 1 end
    if unique_modes > 1 then checks[#checks+1] = "PASS  Game mode changed (" .. unique_modes .. " states seen)" else checks[#checks+1] = "WARN  Game mode never changed (stuck in mode " .. hex(read_ram(0x0010,1)) .. ")" end
    if ram_changes[0xEF05].count > 0 or ram_changes[0xEF06].count > 0 then checks[#checks+1] = "PASS  Scroll shadows changed" else checks[#checks+1] = "WARN  No scroll shadow activity observed" end
    if vdp_lost_vint then checks[#checks+1] = "WARN  VDP VINT was enabled then lost at frame " .. tostring(vdp_lost_frame) end

    if crash_info.magic == 0xBEEF then
        checks[#checks+1] = "FAIL  EXCEPTION_HANDLER hit! vector=" .. hex(crash_info.vector,4) .. " " .. vector_name(crash_info.vector) .. " crash_pc=" .. hex(crash_info.pc,8)
    end

    local pass_count, fail_count = 0, 0
    for _, c in ipairs(checks) do
        log("  " .. c)
        if c:sub(1,4) == "PASS" then pass_count = pass_count + 1 end
        if c:sub(1,4) == "FAIL" then fail_count = fail_count + 1 end
    end
    log("")
    log("  Score: " .. pass_count .. " PASS / " .. fail_count .. " FAIL / " .. (#checks - pass_count - fail_count) .. " WARN")
    log("  NMI completion count: " .. nmi_run_count)
    log("  PC range observed: " .. hex(pc_min,6) .. " - " .. hex(pc_max,6))
    log("  Unique PCs sampled: " .. tostring(unique_pc_count))
    log("  Longest same-PC run: " .. tostring(longest_same_pc) .. " frames at " .. hex(longest_same_pc_addr,6))
    if stuck_pc and pc_label(stuck_pc) then
        log("  Known stuck-PC label: " .. pc_label(stuck_pc))
    end

    log_sep("MILESTONES (chronological)")
    if #milestones == 0 then
        log("  (none detected)")
    else
        table.sort(milestones, function(a,b) return a.frame < b.frame end)
        for _,m in ipairs(milestones) do
            log("  Frame " .. string.format("%4d", m.frame) .. ": " .. m.event)
        end
    end

    log_sep("DEEP DIAG / INTERPRETATION")
    log("  Helper activity heuristic:")
    for _, sym in ipairs(HOT_SYMBOLS) do
        log(string.format("    %-18s  %4d frames in sampled windows near %s", sym.name, helper_hits[sym.name] or 0, hex(sym.addr,6)))
    end
    log("  VRAM addr observed min/max: " .. hex(min_vram_addr,4) .. " / " .. hex(max_vram_addr,4))
    log("  OAM nonzero pairs in $0200-$027F: " .. tostring(oam_nonzero_words))
    log("  PPUCTRL first nonzero frame: " .. tostring(ppu2000_nonzero_frame or "never"))
    log("  PPUMASK first nonzero frame: " .. tostring(ppu2001_nonzero_frame or "never"))
    log("  VDP REG1 transitions: " .. tostring(#vdp_reg1_transitions))
    if #vdp_reg1_transitions > 0 then
        for i = 1, math.min(10, #vdp_reg1_transitions) do
            local t = vdp_reg1_transitions[i]
            log("    Frame " .. string.format("%4d", t.frame) .. ": " .. hex(t.old) .. " -> " .. hex(t.new))
        end
    end

    log_sep("LOOP TRACE / RELEASE HINTS")
    log("  Target loop PC: " .. hex(TARGET_LOOP_PC,6))
    log("  First frame at target loop: " .. tostring(target_loop_first_frame or "never"))
    log("  Stable stuck entry frame: " .. tostring(target_loop_entry_frame or "not reached"))
    log("  Last non-target PC before stable loop: " .. (target_loop_entry_prev_pc and hex(target_loop_entry_prev_pc,6) or "(unknown)"))
    log("  Recent distinct PCs before loop stabilization:")
    if #target_loop_prehistory == 0 then
        log("    (loop-specific prehistory not captured)")
    else
        for _, item in ipairs(target_loop_prehistory) do
            log("    Frame " .. string.format("%4d", item.frame) .. ": " .. hex(item.pc,6))
        end
    end

    log("")
    log("  Loop-release suspect summary:")
    for _, suspect_name in ipairs(LOOP_SUSPECT_NAMES) do
        for _, w in ipairs(WATCHES) do
            if w.name == suspect_name then
                local info = ram_changes[w.addr]
                local digits = (w.sz == 4) and 8 or ((w.sz == 2) and 4 or 2)
                local uniq = 0
                for _ in pairs(info.unique) do uniq = uniq + 1 end
                local status = ""
                if info.count == 0 then
                    status = "never changed"
                elseif info.count == 1 then
                    status = "changed once"
                else
                    status = "changed " .. tostring(info.count) .. " times"
                end
                log(string.format("    %-18s final=%-8s  %-14s  first=%-5s last=%-5s uniq=%d",
                    suspect_name,
                    hex(info.last_val, digits),
                    status,
                    (info.first_frame == -1 and "-" or tostring(info.first_frame)),
                    (info.last_frame == -1 and "-" or tostring(info.last_frame)),
                    uniq))
                break
            end
        end
    end

    log("")
    log("  Candidate interpretation:")
    for _, suspect_name in ipairs(LOOP_SUSPECT_NAMES) do
        for _, w in ipairs(WATCHES) do
            if w.name == suspect_name then
                local info = ram_changes[w.addr]
                if info.count == 0 then
                    log("    " .. suspect_name .. " never changed; possible missing release flag.")
                elseif info.count == 1 then
                    log("    " .. suspect_name .. " changed once and froze; possible half-complete handshake.")
                end
                break
            end
        end
    end

    log_sep("STARTUP / TITLE HANDSHAKE")
    local function flag_line(label, value)
        log(string.format("  %-34s %s", label, value and "YES" or "no"))
    end
    flag_line("Reached main handler ($0310)", startup_flags.reached_main_handler)
    flag_line("Reached title dispatch ($0320)", startup_flags.reached_title_dispatch)
    flag_line("Reached title stage 1 ($0321)", startup_flags.reached_title_stage1)
    flag_line("Reached title fill-1 stub ($0410)", startup_flags.reached_title_fill1_stub)
    flag_line("Used bank-6 real pointer path ($0440)", startup_flags.reached_bank6_real_ptr)
    flag_line("Used bank-6 legacy fallback ($0442)", startup_flags.reached_bank6_legacy_fallback)
    flag_line("Sequence loader showed activity", startup_flags.sequence_loader_live)
    flag_line("Any sequence events recorded", startup_flags.any_seq_events)
    flag_line("Any PPU events recorded", startup_flags.any_ppu_events)
    if stuck_pc then
        log("")
        if pc_label(stuck_pc) then
            log("  Stall interpretation: " .. pc_label(stuck_pc))
        else
            log("  Stall interpretation: unknown stuck PC; compare listing/report around " .. hex(stuck_pc, 6))
        end
    end

    log_sep("RAM WATCH SUMMARY")
    log(string.format("  %-20s  %-10s  %-8s  %-10s  %-10s  %s", "Name", "Final", "Changes", "Min", "Max", "Description"))
    log("  " .. string.rep("-", 95))
    for _, w in ipairs(WATCHES) do
        local info = ram_changes[w.addr]
        local digits = (w.sz == 4) and 8 or ((w.sz == 2) and 4 or 2)
        log(string.format("  %-20s  %-10s  %-8d  %-10s  %-10s  %s", w.name, hex(info.last_val, digits), info.count, hex(info.min_val, digits), hex(info.max_val, digits), w.desc))
    end

    log_sep("RAM CHANGE HISTORY (all key vars with any change)")
    for _, w in ipairs(WATCHES) do
        local info = ram_changes[w.addr]
        if info.count > 0 and #info.history > 0 then
            local digits = (w.sz == 4) and 8 or ((w.sz == 2) and 4 or 2)
            log("  " .. w.name .. " [" .. hex(w.addr,4) .. "] - " .. info.count .. " changes:")
            local show = math.min(#info.history, 20)
            for j = 1, show do
                local h = info.history[j]
                log("    Frame " .. string.format("%4d", h.frame) .. ": " .. hex(h.old, digits) .. " -> " .. hex(h.new, digits))
            end
            if #info.history > 20 then log("    ... (" .. (#info.history - 20) .. " more)") end
        end
    end

    if SAMPLE_VRAM then
        log_sep("VRAM CONTENT")
        log("  Nonzero words: " .. vram_nonzero .. " / 32768")
        local blocks = {}
        for k,v in pairs(ram_changes.vram_regions or {}) do blocks[#blocks+1] = {block=k,count=v} end
        table.sort(blocks, function(a,b) return a.block < b.block end)
        for _, b in ipairs(blocks) do
            local base = b.block * 1024
            log(string.format("    VRAM $%04X-$%04X: %d nonzero words", base, base+1023, b.count))
        end
    end

    if SAMPLE_CRAM then
        log_sep("CRAM / PALETTE")
        log("  Nonzero entries: " .. palette_nonzero .. " / 64")
        for pal = 0, 3 do
            local pline = "  Palette " .. pal .. ":"
            for c = 0, 15 do
                local idx = pal*16+c+1
                pline = pline .. " " .. hex(cram_data[idx] or 0, 4)
            end
            log(pline)
        end
    end

    log_sep("PC HOTSPOTS (sampled once/frame)")
    log("  PC range this run: " .. hex(pc_min,6) .. " - " .. hex(pc_max,6))
    local pc_sorted = {}
    for pc_val, count in pairs(pc_histogram) do pc_sorted[#pc_sorted+1] = {pc=pc_val, count=count} end
    table.sort(pc_sorted, function(a,b) return a.count > b.count end)
    for idx = 1, math.min(#pc_sorted, 30) do
        local p = pc_sorted[idx]
        log(string.format("  %s: %4d frames (%.1f%%)", hex(p.pc,6), p.count, p.count/math.max(1, frames_ran)*100))
    end

    log_sep("ROM BYTE DUMPS AROUND STUCK/HOT PCS")
    if stuck_pc then
        log("  STUCK PC dump for " .. hex(stuck_pc,6))
        append_lines(report, dump_rom_bytes(stuck_pc, PC_DUMP_BEFORE, PC_DUMP_AFTER, rom_domain))
    else
        log("  No stuck PC detected.")
    end

    log("")
    log("  TARGET LOOP PC dump for " .. hex(TARGET_LOOP_PC,6))
    append_lines(report, dump_rom_bytes(TARGET_LOOP_PC, PC_DUMP_BEFORE, PC_DUMP_AFTER, rom_domain))

    for i = 1, math.min(#pc_sorted, TOP_PC_DUMPS) do
        local p = pc_sorted[i]
        log("")
        log("  HOT PC #" .. i .. "  " .. hex(p.pc,6) .. "  (" .. p.count .. " frames)")
        append_lines(report, dump_rom_bytes(p.pc, PC_DUMP_BEFORE, PC_DUMP_AFTER, rom_domain))
    end

    if crash_info.magic == 0xBEEF and crash_info.pc ~= 0 then
        log("")
        log("  CRASH PC BYTE DUMP")
        append_lines(report, dump_rom_bytes(crash_info.pc, 16, 48, rom_domain))
    end

    log_sep("BANK6 REQUEST FLOW")
    log("  NES reference: bank 6 loads a stream pointer from table $A000, writes it via $A0F6, then stores $FF into $0302.")
    if #bank6_flow == 0 then
        log("  (no bank-6 request snapshots captured)")
    else
        local start_idx = math.max(1, #bank6_flow - 15)
        for idx = start_idx, #bank6_flow do
            local snap = bank6_flow[idx]
            log(string.format(
                "  F%3d PC=%s trace=%s req_idx=%s req_ptr=%s req_res=%s ppu_evt=%s load=%s $0300/$0301/$0302=%s/%s/%s",
                snap.frame,
                hex(snap.pc,6),
                hex(snap.trace_last,4),
                hex(snap.req_index,4),
                hex(snap.req_ptr,4),
                hex(snap.req_res,8),
                hex(snap.ppu_evt,4),
                hex(snap.ppu_load_index),
                hex(snap.buf0),
                hex(snap.buf1),
                hex(snap.buf2)
            ))
            log("    Resolved source: " .. resolved_addr_source(snap.req_res))
            if snap.note then
                log("    Pointer note: " .. snap.note)
            end
            if snap.req_res ~= 0 then
                log("    Resolved bytes: " .. dump_resolved_bytes(snap.req_res, 24, rom_domain))
            end
            log(string.format("    RAM $0300 bytes: %s %s %s %s %s %s",
                hex(snap.buf0), hex(snap.buf1), hex(snap.buf2), hex(snap.buf3), hex(snap.buf4), hex(snap.buf5)))
        end
    end

    log_sep("TITLE SLICE WATCHER")
    log("  Focus: bank-2 title CHR uploader / title-ready handshake.")
    log("  Fields: phase=$051D ptr=$0000/$0001 count=$0002/$0003 vram=$EF08 trace=$F000 ready=$11 load=$14 guard=$F5")
    if #title_slice_flow == 0 then
        log("  (no title-slice snapshots captured)")
    else
        local start_idx = math.max(1, #title_slice_flow - 23)
        for idx = start_idx, #title_slice_flow do
            local snap = title_slice_flow[idx]
            log(string.format(
                "  F%3d PC=%s trace=%s phase=%s ptr=%s count=%s vram=%s ready=%s load=%s guard=%s ppu_evt=%s",
                snap.frame,
                hex(snap.pc,6),
                hex(snap.trace_last,4),
                hex(snap.phase),
                hex(snap.tile_ptr,4),
                hex(snap.tile_count,4),
                hex(snap.vram_addr,4),
                hex(snap.screen_ready),
                hex(snap.ppu_load_index),
                hex(snap.reset_guard),
                hex(snap.ppu_evt,4)
            ))
            if snap.ptr_note then
                log("    Source: " .. snap.ptr_note)
            end
            if snap.count_note then
                log("    Counter: " .. snap.count_note)
            end
        end
    end

    log_sep("MENU HANDOFF MILESTONES")
    log("  Focus: first frame where the title/file-select path visibly wakes up.")
    log("  Menu trace CSV: " .. report_paths.menu)
    log("  script=$01 first frame: " .. tostring(menu_milestones.script1 or "never"))
    log("  nonzero subscript first frame: " .. tostring(menu_milestones.subscript or "never"))
    log("  ppu_load_index=$14 first frame: " .. tostring(menu_milestones.load14 or "never"))
    log("  bank-6 req index $0014 first frame: " .. tostring(menu_milestones.req14 or "never"))
    log("  cur_save_slot nonzero first frame: " .. tostring(menu_milestones.slot or "never"))
    log("  ram_041F nonzero first frame: " .. tostring(menu_milestones.row041F or "never"))
    log("  ram_0421 nonzero first frame: " .. tostring(menu_milestones.row0421 or "never"))
    log("  ram_0423 nonzero first frame: " .. tostring(menu_milestones.row0423 or "never"))
    log("  sprite index active first frame: " .. tostring(menu_milestones.spr or "never"))

    log_sep("SLOT SELECT WATCHER")
    log("  Focus: bank-2 slot/file-select handoff after title Start.")
    log("  Fields: script=$12 sub=$13 load=$14 slot=$16 gate=$4D next=$5B branch=$E7 map=$EB next_map=$EC bitmask=$00/$01 idx=$041F/$0421/$0423 tmp=$02/$03/$04/$05 spr=$0343/$0344 trace=$F000")
    if #slot_select_flow == 0 then
        log("  (no slot-select snapshots captured)")
    else
        local start_idx = math.max(1, #slot_select_flow - 23)
        for idx = start_idx, #slot_select_flow do
            local snap = slot_select_flow[idx]
            log(string.format(
                "  F%3d PC=%s trace=%s script=%s sub=%s load=%s slot=%s gate=%s idx=%s/%s/%s tmp=%s/%s/%s/%s spr=%s/%s ppu_evt=%s",
                snap.frame,
                hex(snap.pc,6),
                hex(snap.trace_last,4),
                hex(snap.script),
                hex(snap.subscript),
                hex(snap.load),
                hex(snap.cur_slot),
                hex(snap.gate),
                hex(snap.idx_041F),
                hex(snap.idx_0421),
                hex(snap.idx_0423),
                hex(snap.tmp_02),
                hex(snap.tmp_03),
                hex(snap.tmp_04),
                hex(snap.tmp_05),
                hex(snap.spr_index_1),
                hex(snap.spr_index_2),
                hex(snap.ppu_evt,4)
            ))
            log(string.format("    RAM $0300 bytes: %s %s %s %s %s %s %s %s",
                hex(snap.buf0), hex(snap.buf1), hex(snap.buf2), hex(snap.buf3),
                hex(snap.buf4), hex(snap.buf5), hex(snap.buf6), hex(snap.buf7)))
        end
    end

    log_sep("CHECKPOINT TRACE")
    log("  Trace sequence: " .. tostring(trace_state.seq))
    log("  Last checkpoint: " .. hex(trace_state.last, 4) .. "  " .. trace_name(trace_state.last))
    local trace_history = get_trace_history(trace_state)
    if #trace_history == 0 then
        log("  (no checkpoints recorded)")
    else
        for i, id in ipairs(trace_history) do
            log(string.format("  %2d. %s  %s", i, hex(id, 4), trace_name(id)))
        end
    end

    log_sep("EVENT TRACE")
    log("  Sequence events captured: " .. tostring(trace_state.seq_evt_count))
    if #trace_state.seq_events == 0 then
        log("  Sequence ring: (empty)")
    else
        for i, evt in ipairs(trace_state.seq_events) do
            log(string.format(
                "  SEQ %2d. %s  %s  arg=%s ptr_raw=%s idx=%s byte=%s src=%s ptr_res=%s",
                i,
                hex(evt.event_id, 4),
                trace_name(evt.event_id),
                hex(evt.arg, 4),
                hex(evt.ptr_raw, 4),
                hex(evt.seq_index, 4),
                hex(evt.seq_byte, 4),
                hex(evt.seq_source, 4),
                hex(evt.ptr_res, 8)
            ))
        end
    end
    log("  PPU events captured: " .. tostring(trace_state.ppu_evt_count))
    if #trace_state.ppu_events == 0 then
        log("  PPU ring: (empty)")
    else
        for i, evt in ipairs(trace_state.ppu_events) do
            log(string.format(
                "  PPU %2d. %s  %s  a0=%s a1=%s a2=%s idx=%s ptr_raw=%s ptr_res=%s",
                i,
                hex(evt.event_id, 4),
                trace_name(evt.event_id),
                hex(evt.arg0, 4),
                hex(evt.arg1, 4),
                hex(evt.arg2, 4),
                hex(evt.ppu_index, 4),
                hex(evt.ptr_raw, 4),
                hex(evt.ptr_res, 8)
            ))
        end
    end

    if crash_info.magic == 0xBEEF then
        log_sep("CRASH LOGGER")
        log("  Crash frame: " .. tostring(crash_frame or frames_ran))
        log("  Magic: " .. hex(crash_info.magic, 4))
        log("  Vector: " .. hex(crash_info.vector, 4) .. "  " .. vector_name(crash_info.vector))
        log("  Saved SP: " .. hex(crash_info.sp, 8))
        log("  Saved SR: " .. hex(crash_info.sr, 4))
        log("  Saved PC: " .. hex(crash_info.pc, 8))
        if crash_info.vector == 0x0002 or crash_info.vector == 0x0003 then
            log("  Fault address: " .. hex(crash_info.aux_long, 8))
            log("  Fault IR/SSW: " .. hex(crash_info.aux_word, 4))
        elseif crash_info.aux_long ~= 0 or crash_info.aux_word ~= 0 then
            log("  Crash aux: " .. hex(crash_info.aux_long, 8) .. " / " .. hex(crash_info.aux_word, 4))
        end
        log("  Raw frame words:")
        for row = 0, 1 do
            local base = 0xEE10 + row * 16
            local dline = string.format("    $FF%04X:", base)
            for col = 0, 7 do
                dline = dline .. " " .. hex(read_ram(base + col * 2, 2), 4)
            end
            log(dline)
        end
        log("  Saved registers:")
        local crash_reg_names = {"D0","D1","D2","D3","D4","D5","D6","D7","A0","A1","A2","A3","A4","A5","A6"}
        for idx, rn in ipairs(crash_reg_names) do
            local reg_val = read_ram(CRASH_REGS_ADDR + (idx - 1) * 4, 4)
            log(string.format("    %-3s = %s", rn, hex(reg_val, 8)))
        end
    end

    log_sep("FINAL CPU STATE")
    local regs = emu.getregisters()
    local reg_names = {"M68K D0","M68K D1","M68K D2","M68K D3","M68K D4","M68K D5","M68K D6","M68K D7","M68K A0","M68K A1","M68K A2","M68K A3","M68K A4","M68K A5","M68K A6","M68K A7","M68K PC","M68K SR"}
    for _, rn in ipairs(reg_names) do
        local v = regs[rn]
        if v then log(string.format("  %-10s = %s", rn, hex(v,8))) end
    end

    log_sep("RAM DUMP: $FF0000-$FF003F (core ZP)")
    for row = 0, 3 do
        local base = row * 16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FF00E0-$FF011F (PPU ctrl / input / flags)")
    for row = 0, 3 do
        local base = 0x00E0 + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FF0200-$FF021F (OAM sprite 0-7)")
    for row = 0, 1 do
        local base = 0x0200 + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FF0300-$FF033F (PPU buffer)")
    for row = 0, 3 do
        local base = 0x0300 + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FFEE00-$FFEE1F (optional crash logger area)")
    for row = 0, 1 do
        local base = 0xEE00 + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FFEE40-$FFEE8F (saved crash regs / aux)")
    for row = 0, 4 do
        local base = 0xEE40 + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FFF000-$FFF03F (trace ring)")
    for row = 0, 3 do
        local base = 0xF000 + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FFF0C0-$FFF13F (seq event ring)")
    for row = 0, 7 do
        local base = TRACE_SEQ_EVT_RING_ADDR + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FFF140-$FFF1BF (ppu event ring)")
    for row = 0, 7 do
        local base = TRACE_PPU_EVT_RING_ADDR + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FFF080-$FFF09F (dispatch/bank meta)")
    for row = 0, 1 do
        local base = TRACE_META_ADDR + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FFEF00-$FFEF1F (VDP shadow regs)")
    for row = 0, 1 do
        local base = 0xEF00 + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("SCREENSHOTS")
    for _, s in ipairs(screenshots_taken) do log("  " .. s) end
    log("")
    log("================================================================")
    log("  END OF DIAGNOSTIC REPORT")
    log("================================================================")

    local f = io.open(report_path, "w")
    if f then
        for _, line_text in ipairs(report) do f:write(line_text .. "\n") end
        f:close()
        bundle_file(report_path)
        console.log("Report written: " .. report_path)
        local function write_menu_csv(path)
            local csv_file = io.open(path, "w")
            if not csv_file then return end
            for _, row in ipairs(menu_trace_rows) do
                write_csv_row(csv_file, row)
            end
            csv_file:close()
        end
        write_menu_csv(report_paths.menu)
        bundle_file(report_paths.menu)
    else
        for _, line_text in ipairs(report) do console.log(line_text) end
    end
    return pass_count, fail_count
end

local function main()
    console.clear()
    console.log("=== ZELDA GENESIS DIAGNOSTIC " .. SCRIPT_VERSION .. " ===")
    console.log(BATCH_MODE and "Batch mode" or "Single-ROM mode")
    reset_send_me_dir()
    console.log("Send Me This folder: " .. SEND_ME_DIR)
    console.log("")

    local current_rom = detect_current_rom()
    if not current_rom then
        console.log("Could not determine the currently loaded ROM.")
        console.log("Set START_ROM_HINT to the first ROM you want in the batch and rerun.")
        return
    end

    if not BATCH_MODE then
        console.log("Detected current ROM: " .. current_rom)
        console.log("Running diagnostics (" .. NUM_FRAMES .. " frames)...")
        local pass, fail = run_diagnostics(current_rom)
        console.log(string.format("Done! %d PASS / %d FAIL", pass, fail))
        return
    end

    local queue = batch_queue_from(current_rom)
    if #queue == 0 then
        console.log("No batch queue could be built from " .. current_rom)
        return
    end

    console.log("Starting batch from: " .. current_rom)
    console.log("ROM count: " .. tostring(#queue))
    console.log("")

    local results = {}

    for idx, rom_name in ipairs(queue) do
        console.log(string.format("[%d/%d] %s", idx, #queue, rom_name))

        if idx > 1 or BATCH_REOPEN_FIRST_ROM then
            local opened = open_rom(rom_name)
            if not opened then
                console.log("Could not open ROM automatically: " .. rom_name)
                results[#results + 1] = {rom = rom_name, pass = 0, fail = 0, status = "open_failed"}
                break
            end
            for _ = 1, BATCH_SETTLE_FRAMES do
                emu.frameadvance()
            end
        end

        console.log("Running diagnostics for " .. rom_name .. " (" .. NUM_FRAMES .. " frames)...")
        local pass, fail = run_diagnostics(rom_name)
        results[#results + 1] = {rom = rom_name, pass = pass, fail = fail, status = "done"}
        console.log(string.format("Finished %s -> %d PASS / %d FAIL", rom_name, pass, fail))
        console.log("")
    end

    write_batch_summary(results)
    console.log("Batch complete.")
    console.log("Summary: " .. BATCH_SUMMARY_PATH)
end

local ok, err = xpcall(main, debug.traceback)
if not ok then
    console.log("Diagnostic script error:")
    console.log(tostring(err))
end
exit_bizhawk()
