-- ============================================================
--  zelda_diag.lua  -  Automated Zelda Genesis Port Diagnostics
--  v7 - loop-release focused telemetry
--
--  Focus:
--   * preserve all v6 diagnostics
--   * stronger tracking for the late self-loop around $0007F6
--   * show the last distinct PCs before the loop stabilized
--   * highlight engine-side flags that never changed vs changed once
--   * summarize likely loop-release candidates
-- ============================================================

-- ======================== CONFIG ============================
local NUM_FRAMES     = 300
local REPORT_PATH_LEGACY = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\diag_report_v68.txt"
local REPORT_DIR     = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local ROM_DIR        = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\build\\"
local SCREENSHOT_AT  = {1, 30, 60, 120, 180, 240, 300}
local SAMPLE_VRAM    = true
local SAMPLE_CRAM    = true
local PC_DUMP_BEFORE = 16
local PC_DUMP_AFTER  = 48
local TOP_PC_DUMPS   = 8
local STATUS_Y       = 0
local STOP_ON_CRASH  = true
local START_ROM_HINT = nil -- e.g. "zelda_v05.md" if current-ROM detection ever fails

local TRACE_LAST_ADDR = 0xF000
local TRACE_SEQ_ADDR  = 0xF002
local TRACE_RING_ADDR = 0xF010
local TRACE_RING_SIZE = 32
local TRACE_META_ADDR = 0xF080
local CRASH_AUX_ADDR  = 0xEE80
local CRASH_REGS_ADDR = 0xEE40

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

local function safe_read_byte(domain, addr)
    local ok, v = pcall(memory.readbyte, addr, domain)
    if ok then return v end
    return 0
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

local function rom_version_short_tag(rom_name)
    local ver = rom_version_number(rom_name)
    if ver then return "v" .. tostring(ver) end
    return rom_version_tag(rom_name)
end

local function vector_name(id)
    return VECTOR_NAMES[id] or "(unknown vector)"
end

local function ensure_report_dir()
    os.execute('if not exist "' .. REPORT_DIR .. '" mkdir "' .. REPORT_DIR .. '"')
end

local function get_report_paths(rom_name)
    local stem = strip_ext(rom_name)
    local ver = rom_version_tag(rom_name)
    local short_ver = rom_version_short_tag(rom_name)
    ensure_report_dir()
    return {
        primary = REPORT_DIR .. "diag_report_" .. ver .. ".txt",
        short = REPORT_DIR .. "diag_report_" .. short_ver .. ".txt",
        full = REPORT_DIR .. "diag_report_" .. stem .. ".txt",
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

    local roms = scan_roms()
    table.sort(roms, function(a, b)
        local av = rom_version_number(a) or -1
        local bv = rom_version_number(b) or -1
        if av == bv then return a > b end
        return av > bv
    end)

    for _, rom in ipairs(roms) do
        if file_matches_loaded_rom(rom) then
            return rom
        end
    end

    if #roms > 0 then
        return roms[1]
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

local function push_ring(list, value, max_n)
    list[#list+1] = value
    if #list > max_n then
        table.remove(list, 1)
    end
end

local function trace_name(id)
    return TRACE_NAMES[id] or "(unknown checkpoint)"
end

local function read_trace_state()
    local seq = read_ram(TRACE_SEQ_ADDR, 2)
    local last = read_ram(TRACE_LAST_ADDR, 2)
    local ring = {}
    for i = 0, TRACE_RING_SIZE - 1 do
        ring[#ring+1] = read_ram(TRACE_RING_ADDR + i * 2, 2)
    end
    return {seq = seq, last = last, ring = ring}
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
    {addr=0x005B, sz=1, name="ram_next_script",desc="next_script [ZP $5B]"},
    {addr=0x005C, sz=1, name="ram_005C",       desc="NMI toggle flag [ZP $5C]"},
    {addr=0x006C, sz=1, name="link_dir",       desc="direction / state scratch [ZP $6C]"},
    {addr=0x0070, sz=1, name="obj_id_0",       desc="object slot 0 id [ZP $70]"},
    {addr=0x0071, sz=1, name="obj_id_1",       desc="object slot 1 id [ZP $71]"},
    {addr=0x00E0, sz=1, name="pause_flag",     desc="pause_flag [ZP $E0]"},
    {addr=0x00E1, sz=1, name="pause_script",   desc="pause_script [ZP $E1]"},
    {addr=0x00E3, sz=1, name="screen_trans",   desc="screen_transition_flag [ZP $E3]"},
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
    "scroll_Y",
    "scroll_X",
    "ram_for_2001",
    "ram_for_2000",
    "ppu_buf_status",
    "ppu_buf_index",
    "PPUCTRL_SHADOW",
    "PPUMASK_SHADOW",
    "PPUSCROLL_X_sh",
    "PPUSCROLL_Y_sh",
    "VDP_REG1",
}

local function run_diagnostics(rom_name)
    local rom_base = strip_ext(rom_name)
    local report_paths = get_report_paths(rom_name)
    local report_path = report_paths.primary
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
                    client.screenshot(fname)
                    screenshots_taken[#screenshots_taken+1] = fname
                end
                break
            end
        end

        if screenshot_set[i] then
            local fname = rom_base .. "_f" .. string.format("%03d", i) .. ".png"
            client.screenshot(fname)
            screenshots_taken[#screenshots_taken+1] = fname
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
    log("  ZELDA GENESIS PORT - DIAGNOSTIC REPORT  v7")
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
        console.log("Report written: " .. report_path)
        if report_paths.short ~= report_path then
            local short = io.open(report_paths.short, "w")
            if short then
                for _, line_text in ipairs(report) do short:write(line_text .. "\n") end
                short:close()
            end
        end
        if report_paths.full ~= report_path then
            local full = io.open(report_paths.full, "w")
            if full then
                for _, line_text in ipairs(report) do full:write(line_text .. "\n") end
                full:close()
            end
        end
        local legacy = io.open(REPORT_PATH_LEGACY, "w")
        if legacy then
            for _, line_text in ipairs(report) do legacy:write(line_text .. "\n") end
            legacy:close()
        end
    else
        for _, line_text in ipairs(report) do console.log(line_text) end
    end
    return pass_count, fail_count
end

console.clear()
console.log("=== ZELDA GENESIS DIAGNOSTIC v7 ===")
console.log("Current-ROM mode")
console.log("")

local current_rom = detect_current_rom()
if not current_rom then
    console.log("Could not determine the currently loaded ROM.")
    console.log("If needed, set START_ROM_HINT near the top of the script to something like zelda_v05.md and rerun.")
    return
end

console.log("Detected current ROM: " .. current_rom)
console.log("Running diagnostics (" .. NUM_FRAMES .. " frames)...")
local pass, fail = run_diagnostics(current_rom)
console.log(string.format("Done! %d PASS / %d FAIL", pass, fail))
