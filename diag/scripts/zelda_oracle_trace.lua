-- Zelda NES/Genesis oracle trace exporter for BizHawk.
-- Runs against the currently loaded ROM and writes a per-frame CSV
-- so we can diff the original NES title boot against the Genesis port.

local MAX_WAIT_FOR_START_FRAMES = 600
local POST_START_CAPTURE_FRAMES = 180
local MAX_TOTAL_FRAMES = 900
local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local TRACE_HINT = "zelda_v340" -- auto-set by run_oracle_trace.ps1
local RESET_ON_START = false
local RESET_KIND = "rebootcore" -- "rebootcore", "poweron", or "softreset"
local RESET_SETTLE_FRAMES = 0
local AUTO_START_ENABLED = false
local AUTO_START_SYSTEMS = {
    nes = true,
    genesis = false,
}
local AUTO_START_READY_DELAY = 20
local AUTO_START_HOLD_FRAMES = 2
local AUTO_START_RETRY_INTERVAL = 45
local AUTO_START_MAX_ATTEMPTS = 4
local MENU_PPU_BUF_START = 0x0300
local MENU_PPU_BUF_COUNT = 0x20
local MENU_OAM_START = 0x0200
local MENU_OAM_COUNT = 0x10
local OVERLAY_ENABLED = true
local OVERLAY_X = 6
local OVERLAY_Y = 18
local OVERLAY_LINE_HEIGHT = 12

local WATCHES = {
    { key = "ram_0000_t49",    addr = 0x0000, width = 2 },
    { key = "ram_0000_t41",    addr = 0x0000, width = 2 },
    { key = "ram_0000_t42",    addr = 0x0001, width = 2 },
    { key = "ram_0002_t17",    addr = 0x0002, width = 2 },
    { key = "ram_0003_t18",    addr = 0x0003, width = 2 },
    { key = "ram_0004_t18",    addr = 0x0004, width = 2 },
    { key = "game_mode",       addr = 0x0010, width = 2 },
    { key = "screen_ready",    addr = 0x0011, width = 2 },
    { key = "ram_script",      addr = 0x0012, width = 2 },
    { key = "ram_subscript",   addr = 0x0013, width = 2 },
    { key = "ppu_load_index",  addr = 0x0014, width = 2 },
    { key = "ram_frm_cnt",     addr = 0x0015, width = 2 },
    { key = "cur_save_slot",   addr = 0x0016, width = 2 },
    { key = "rendering_flag",  addr = 0x0017, width = 2 },
    { key = "ram_004D",        addr = 0x004D, width = 2 },
    { key = "ram_next_script", addr = 0x005B, width = 2 },
    { key = "ram_005C",        addr = 0x005C, width = 2 },
    { key = "se_ptr_lo",       addr = 0x0066, width = 2 },
    { key = "se_ptr_hi",       addr = 0x0067, width = 2 },
    { key = "ram_006C_se",     addr = 0x006C, width = 2 },
    { key = "ram_00F6",        addr = 0x00F6, width = 2 },
    { key = "btn_press",       addr = 0x00F8, width = 2 },
    { key = "btn_hold",        addr = 0x00FA, width = 2 },
    { key = "scroll_y",        addr = 0x00FC, width = 2 },
    { key = "scroll_x",        addr = 0x00FD, width = 2 },
    { key = "ram_for_2001",    addr = 0x00FE, width = 2 },
    { key = "ram_for_2000",    addr = 0x00FF, width = 2 },
    { key = "ram_0415",        addr = 0x0415, width = 2 },
    { key = "ram_041A",        addr = 0x041A, width = 2 },
    { key = "ram_041F",        addr = 0x041F, width = 2 },
    { key = "ram_0421",        addr = 0x0421, width = 2 },
    { key = "ram_0423",        addr = 0x0423, width = 2 },
    { key = "spr_index_1",     addr = 0x0343, width = 2 },
    { key = "spr_index_2",     addr = 0x0344, width = 2 },
    { key = "ram_042D",        addr = 0x042D, width = 2 },
    { key = "ram_042E",        addr = 0x042E, width = 2 },
    { key = "ram_00E7",        addr = 0x00E7, width = 2 },
    { key = "ram_map_location", addr = 0x00EB, width = 2 },
    { key = "ram_next_map_location", addr = 0x00EC, width = 2 },
    { key = "ram_0528",        addr = 0x0528, width = 2 },
    { key = "ram_05F1",        addr = 0x05F1, width = 2 },
    { key = "ram_05F4",        addr = 0x05F4, width = 2 },
    { key = "ram_05F5",        addr = 0x05F5, width = 2 },
    { key = "ram_music",       addr = 0x0600, width = 2 },
    { key = "ram_music_busy",  addr = 0x0609, width = 2 },
    { key = "ram_060A",        addr = 0x060A, width = 2 },
    { key = "ram_060B",        addr = 0x060B, width = 2 },
    { key = "ram_060C",        addr = 0x060C, width = 2 },
    { key = "ram_060D",        addr = 0x060D, width = 2 },
    { key = "ram_0611",        addr = 0x0611, width = 2 },
    { key = "ram_0612",        addr = 0x0612, width = 2 },
    { key = "ram_0613",        addr = 0x0613, width = 2 },
    { key = "ram_0616",        addr = 0x0616, width = 2 },
    { key = "ram_0617",        addr = 0x0617, width = 2 },
    { key = "ram_0619",        addr = 0x0619, width = 2 },
    { key = "ram_061B",        addr = 0x061B, width = 2 },
    { key = "ppu_buf_status",  addr = 0x0300, width = 2 },
    { key = "ppu_buf_index",   addr = 0x0301, width = 2 },
    { key = "ppu_buf_0",       addr = 0x0302, width = 2 },
    { key = "ppu_buf_1",       addr = 0x0303, width = 2 },
    { key = "ppu_buf_2",       addr = 0x0304, width = 2 },
    { key = "ppu_buf_3",       addr = 0x0305, width = 2 },
    { key = "ppu_buf_4",       addr = 0x0306, width = 2 },
    { key = "ppu_buf_5",       addr = 0x0307, width = 2 },
    { key = "ppu_buf_6",       addr = 0x0308, width = 2 },
    { key = "ppu_buf_7",       addr = 0x0309, width = 2 },
    { key = "pal_sh_00",       addr = 0x9200, width = 2 },
    { key = "pal_sh_01",       addr = 0x9201, width = 2 },
    { key = "pal_sh_02",       addr = 0x9202, width = 2 },
    { key = "pal_sh_03",       addr = 0x9203, width = 2 },
    { key = "pal_sh_04",       addr = 0x9204, width = 2 },
    { key = "pal_sh_05",       addr = 0x9205, width = 2 },
    { key = "pal_sh_06",       addr = 0x9206, width = 2 },
    { key = "pal_sh_07",       addr = 0x9207, width = 2 },
}

local GENESIS_ONLY_WATCHES = {
    { key = "trace_last",      addr = 0xF000, width = 4, bytes = 2 },
    { key = "trace_seq",       addr = 0xF002, width = 4, bytes = 2 },
    { key = "PPU_REQ_INDEX",   addr = 0xF0A2, width = 4, bytes = 2 },
    { key = "PPU_REQ_PTR",     addr = 0xF0A4, width = 4, bytes = 2 },
    { key = "PPU_REQ_RES",     addr = 0xF0A8, width = 8, bytes = 4 },
    { key = "SEQ_EVT_COUNT",   addr = 0xF0AC, width = 4, bytes = 2 },
    { key = "PPU_EVT_COUNT",   addr = 0xF0AE, width = 4, bytes = 2 },
}

local GENESIS_REG_EXPORTS = {
    { key = "reg_d0", candidates = { "M68K D0", "68K D0", "D0" }, width = 8 },
    { key = "reg_d1", candidates = { "M68K D1", "68K D1", "D1" }, width = 8 },
    { key = "reg_d2", candidates = { "M68K D2", "68K D2", "D2" }, width = 8 },
    { key = "reg_d3", candidates = { "M68K D3", "68K D3", "D3" }, width = 8 },
    { key = "reg_d4", candidates = { "M68K D4", "68K D4", "D4" }, width = 8 },
    { key = "reg_d5", candidates = { "M68K D5", "68K D5", "D5" }, width = 8 },
    { key = "reg_d6", candidates = { "M68K D6", "68K D6", "D6" }, width = 8 },
    { key = "reg_d7", candidates = { "M68K D7", "68K D7", "D7" }, width = 8 },
    { key = "reg_a0", candidates = { "M68K A0", "68K A0", "A0" }, width = 8 },
    { key = "reg_a1", candidates = { "M68K A1", "68K A1", "A1" }, width = 8 },
    { key = "reg_a2", candidates = { "M68K A2", "68K A2", "A2" }, width = 8 },
    { key = "reg_a3", candidates = { "M68K A3", "68K A3", "A3" }, width = 8 },
    { key = "reg_a4", candidates = { "M68K A4", "68K A4", "A4" }, width = 8 },
    { key = "reg_a5", candidates = { "M68K A5", "68K A5", "A5" }, width = 8 },
    { key = "reg_a6", candidates = { "M68K A6", "68K A6", "A6" }, width = 8 },
    { key = "reg_a7", candidates = { "M68K A7", "68K A7", "A7" }, width = 8 },
    { key = "reg_sr", candidates = { "M68K SR", "68K SR", "SR" }, width = 4 },
}

local TRACE_SEQ_EVT_COUNT_ADDR = 0xF0AC
local TRACE_PPU_EVT_COUNT_ADDR = 0xF0AE
local TRACE_SEQ_EVT_RING_ADDR = 0xF0C0
local TRACE_PPU_EVT_RING_ADDR = 0xF140
local TRACE_EVT_RING_SIZE = 8
local TRACE_EVT_SLOT_SIZE = 16

local EVENT_NAMES = {
    [0x04A0] = "BANK6_PPU_LEGACY raw header",
    [0x04A1] = "BANK6_PPU_LEGACY literal decode",
    [0x04A2] = "BANK6_PPU_LEGACY repeat decode",
    [0x04A3] = "BANK6_PPU_LEGACY palette fixup",
    [0x04A4] = "BANK6_PPU_LEGACY pointer advance",
    [0x04A8] = "BANK6_PPU fallback request",
    [0x04A9] = "BANK6_PPU request",
    [0x04AA] = "BANK2_TITLE logo palette header",
    [0x04AB] = "BANK2_TITLE title template header",
    [0x04AC] = "BANK2_TITLE title block header",
    [0x04B1] = "BANK0_SEQ 9D37 primary fetch",
    [0x04B2] = "BANK0_SEQ 9D63 follow fetch",
    [0x04B3] = "BANK0_SEQ 9DBE pulse fetch",
    [0x04B4] = "BANK0_SEQ 9DCE pulse follow",
    [0x04B5] = "BANK0_SEQ 9E2C control fetch",
    [0x04B6] = "BANK0_SEQ 9E66 triangle follow",
    [0x04B7] = "BANK0_SEQ 9EA7 noise fetch",
}

local function get_domain_list()
    local ok, list = pcall(memory.getmemorydomainlist)
    if ok and type(list) == "table" then
        return list
    end
    return {}
end

local function has_domain(name)
    for _, domain in ipairs(get_domain_list()) do
        if domain == name then
            return true
        end
    end
    return false
end

local function pick_domain(candidates)
    for _, name in ipairs(candidates) do
        if has_domain(name) then
            return name
        end
    end
    return nil
end

local try_name

local function current_rom_name()
    local candidates = {
        try_name(gameinfo and gameinfo.getromname),
        try_name(gameinfo and gameinfo.getromfilename),
        try_name(gameinfo and gameinfo.getfilename),
        try_name(client and client.getromname),
        try_name(client and client.getfilename),
        try_name(emu and emu.getromname),
    }

    for _, candidate in ipairs(candidates) do
        if candidate then
            return candidate
        end
    end

    return nil
end

local function detect_system_from_metadata()
    local candidates = {
        try_name(gameinfo and gameinfo.getsystem),
        try_name(gameinfo and gameinfo.getsystemid),
        try_name(client and client.getsystem),
        try_name(client and client.gettargetsystem),
        try_name(emu and emu.getsystemid),
    }

    for _, candidate in ipairs(candidates) do
        if candidate then
            local lower = string.lower(candidate)
            if lower:find("nes", 1, true) then
                return "nes"
            end
            if lower:find("genesis", 1, true)
                or lower:find("mega drive", 1, true)
                or lower:find("megadrive", 1, true)
                or lower == "md" then
                return "genesis"
            end
        end
    end

    local rom_name = current_rom_name()
    if rom_name then
        local lower = string.lower(rom_name)
        if lower:match("%.nes$") then
            return "nes"
        end
        if lower:match("%.md$") or lower:match("%.bin$") or lower:match("%.gen$") then
            return "genesis"
        end
    end

    return nil
end

local function find_genesis_ram_domain()
    local direct = pick_domain({
        "68K RAM",
        "Main RAM",
        "MainRAM",
        "Work RAM",
        "WorkRAM",
        "68k RAM",
    })
    if direct then
        return direct, 0x000000
    end

    local bus = pick_domain({
        "68K BUS",
        "M68K BUS",
        "MD BUS",
        "Genesis System Bus",
    })
    if bus then
        return bus, 0xFF0000
    end

    for _, domain in ipairs(get_domain_list()) do
        local upper = string.upper(domain)
        if upper:find("RAM", 1, true)
            and not upper:find("VRAM", 1, true)
            and not upper:find("CRAM", 1, true)
            and not upper:find("SRAM", 1, true)
            and not upper:find("Z80", 1, true) then
            return domain, 0x000000
        end
    end

    for _, domain in ipairs(get_domain_list()) do
        local upper = string.upper(domain)
        if upper:find("BUS", 1, true)
            and not upper:find("Z80", 1, true)
            and not upper:find("ROM", 1, true)
            and not upper:find("CART", 1, true) then
            return domain, 0xFF0000
        end
    end

    return nil, nil
end

local function find_nes_ram_domain()
    local direct = pick_domain({
        "System Bus",
        "RAM",
        "Main RAM",
    })
    if direct then
        return direct, 0x0000
    end

    if has_domain("WRAM")
        and not has_domain("68K RAM")
        and not has_domain("68K BUS")
        and not has_domain("M68K BUS")
        and not has_domain("Genesis ROM")
        and not has_domain("MD CART") then
        return "WRAM", 0x0000
    end

    for _, domain in ipairs(get_domain_list()) do
        local upper = string.upper(domain)
        if upper:find("RAM", 1, true)
            and not upper:find("VRAM", 1, true)
            and not upper:find("CHR", 1, true)
            and not upper:find("PRG", 1, true) then
            return domain, 0x0000
        end
    end

    return nil, nil
end

local function detect_system()
    local system_hint = detect_system_from_metadata()
    if system_hint == "nes" then
        local nes_domain, nes_base = find_nes_ram_domain()
        if nes_domain then
            return "nes", nes_domain, nes_base
        end
    elseif system_hint == "genesis" then
        local genesis_domain, genesis_base = find_genesis_ram_domain()
        if genesis_domain then
            return "genesis", genesis_domain, genesis_base
        end
    end

    local explicit_genesis = has_domain("68K RAM")
        or has_domain("68K BUS")
        or has_domain("M68K BUS")
        or has_domain("Genesis ROM")
        or has_domain("MD CART")
        or has_domain("Genesis System Bus")
    if explicit_genesis then
        local genesis_domain, genesis_base = find_genesis_ram_domain()
        if genesis_domain then
            return "genesis", genesis_domain, genesis_base
        end
    end

    local nes_domain, nes_base = find_nes_ram_domain()
    if nes_domain then
        return "nes", nes_domain, nes_base
    end

    local genesis_domain, genesis_base = find_genesis_ram_domain()
    if genesis_domain then
        return "genesis", genesis_domain, genesis_base
    end

    local domains = table.concat(get_domain_list(), ", ")
    error("Could not find a supported memory domain. Domains seen: " .. domains)
end

function try_name(getter)
    if type(getter) ~= "function" then
        return nil
    end
    local ok, value = pcall(getter)
    if ok and type(value) == "string" and value ~= "" then
        return value
    end
    return nil
end

local function current_rom_label(system_name)
    if TRACE_HINT and TRACE_HINT ~= "" then
        return TRACE_HINT
    end

    local candidates = { current_rom_name() }

    for _, candidate in ipairs(candidates) do
        if candidate then
            local base = candidate:match("([^\\\\/]+)$") or candidate
            base = base:gsub("%.[^.]+$", "")
            base = base:gsub("[^%w_%-]+", "_")
            base = base:gsub("_+", "_")
            base = base:gsub("^_", "")
            base = base:gsub("_$", "")
            if base ~= "" then
                return base
            end
        end
    end

    return "current_" .. system_name
end

local function read_watch(watch, domain, base)
    local actual_addr = (base or 0) + watch.addr
    local bytes = watch.bytes or 1
    local reader = memory.readbyte

    if bytes == 2 then
        reader = memory.read_u16_be
    elseif bytes == 4 then
        reader = memory.read_u32_be
    end

    local ok, value = pcall(reader, actual_addr, domain)
    if ok and type(value) == "number" then
        return value
    end
    return 0
end

local function read_be(domain, addr, bytes)
    local reader = memory.readbyte
    if bytes == 2 then
        reader = memory.read_u16_be
    elseif bytes == 4 then
        reader = memory.read_u32_be
    end
    local ok, value = pcall(reader, addr, domain)
    if ok and type(value) == "number" then
        return value
    end
    return 0
end

local function hex(value, width)
    return string.format("%0" .. tostring(width) .. "X", value or 0)
end

local function get_pc(system_name)
    local ok, regs = pcall(emu.getregisters)
    if not ok or type(regs) ~= "table" then
        return ""
    end

    for _, key in ipairs({ "M68K PC", "68K PC", "PC", "pc", "PPC" }) do
        if type(regs[key]) == "number" then
            return hex(regs[key], system_name == "genesis" and 6 or 4)
        end
    end

    for key, value in pairs(regs) do
        if type(key) == "string" and type(value) == "number" and key:lower() == "pc" then
            return hex(value, system_name == "genesis" and 6 or 4)
        end
    end

    return ""
end

local function get_register_table()
    local ok, regs = pcall(emu.getregisters)
    if ok and type(regs) == "table" then
        return regs
    end
    return nil
end

local function get_register_hex(regs, candidates, width)
    if type(regs) ~= "table" then
        return ""
    end

    for _, key in ipairs(candidates or {}) do
        local value = regs[key]
        if type(value) == "number" then
            return hex(value, width)
        end
    end

    return ""
end

local function csv_escape(value)
    local s = tostring(value or "")
    if s:find('[,",\r\n]') then
        s = '"' .. s:gsub('"', '""') .. '"'
    end
    return s
end

local function make_ppu_header_write_logger(write_file, system_name)
    if not write_file or system_name ~= "genesis" then
        return false
    end
    if not (event and type(event.onmemorywrite) == "function") then
        return false
    end

    local function reg(name)
        local ok, value = pcall(emu.getregister, name)
        if ok and type(value) == "number" then
            return value
        end
        return 0
    end

    local function log_write(addr)
        write_row(write_file, {
            tostring(emu.framecount()),
            hex(addr, 6),
            hex(memory.read_u8(addr), 2),
            hex(reg("M68K PC"), 6),
            hex(memory.read_u16_be(0xFFF000), 4),
            hex(memory.read_u16_be(0xFFF002), 4),
            hex(memory.read_u8(0xFF0301), 2),
            hex(memory.read_u8(0xFF0302), 2),
            hex(memory.read_u8(0xFF0303), 2),
            hex(memory.read_u8(0xFF0304), 2),
            hex(reg("M68K D0"), 8),
            hex(reg("M68K D1"), 8),
            hex(reg("M68K D2"), 8),
            hex(reg("M68K D3"), 8),
            hex(reg("M68K A0"), 8),
            hex(reg("M68K A1"), 8),
            hex(reg("M68K A7"), 8),
            hex(reg("M68K SR"), 4),
        })
    end

    local ok0 = pcall(event.onmemorywrite, function() log_write(0xFF0301) end, 0xFF0301)
    local ok1 = pcall(event.onmemorywrite, function() log_write(0xFF0302) end, 0xFF0302)
    local ok2 = pcall(event.onmemorywrite, function() log_write(0xFF0303) end, 0xFF0303)
    local ok3 = pcall(event.onmemorywrite, function() log_write(0xFF0304) end, 0xFF0304)
    return ok0 or ok1 or ok2 or ok3
end

local function read_abs(domain, base_offset, addr, bytes)
    return read_be(domain, (base_offset or 0) + addr, bytes or 1)
end

local function append_range_header(header, prefix, count)
    for i = 0, count - 1 do
        header[#header + 1] = string.format("%s_%02X", prefix, i)
    end
end

local function append_range_values(row, domain, base_offset, start_addr, count)
    for i = 0, count - 1 do
        row[#row + 1] = hex(read_abs(domain, base_offset, start_addr + i, 1), 2)
    end
end

local function auto_start_enabled_for(system_name)
    if not AUTO_START_ENABLED then
        return false
    end
    return AUTO_START_SYSTEMS[system_name] == true
end

local function manual_start_overlay_enabled_for(system_name)
    return system_name == "nes"
end

local function joypad_targets(system_name, pressed)
    if system_name == "nes" then
        return {
            { payload = { Start = pressed }, device = 1, verify = { "Start", "P1 Start" } },
            { payload = { ["P1 Start"] = pressed }, device = nil, verify = { "P1 Start", "Start" } },
            { payload = { ["P1 Start"] = pressed }, device = 1, verify = { "P1 Start", "Start" } },
        }
    end
    if system_name == "genesis" then
        return {
            { payload = { Start = pressed, Mode = false }, device = 1, verify = { "Start", "P1 Start" } },
            { payload = { ["P1 Start"] = pressed, Mode = false }, device = nil, verify = { "P1 Start", "Start" } },
            { payload = { Start = pressed }, device = 1, verify = { "Start", "P1 Start" } },
            { payload = { ["P1 Start"] = pressed }, device = nil, verify = { "P1 Start", "Start" } },
        }
    end
    return {
        { payload = { Start = pressed }, device = 1, verify = { "Start", "P1 Start" } },
        { payload = { ["P1 Start"] = pressed }, device = nil, verify = { "P1 Start", "Start" } },
    }
end

local function joypad_get_state()
    local jp = rawget(_G, "joypad")
    if type(jp) ~= "table" or type(jp.get) ~= "function" then
        return nil
    end
    local ok, state = pcall(jp.get)
    if ok and type(state) == "table" then
        return state
    end
    return nil
end

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

local function read_manual_start_state(system_name)
    if not manual_start_overlay_enabled_for(system_name) then
        return nil, false, nil
    end

    local states = joypad_get_states()
    if #states == 0 then
        return nil, false, nil
    end

    local keys = { "Start", "P1 Start", "P1 RetroPad Start", "1 Start" }
    for _, state in ipairs(states) do
        for _, key in ipairs(keys) do
            local value = state[key]
            if value ~= nil then
                return value == true, true, key
            end
        end
    end

    return nil, true, nil
end

local function draw_overlay_lines(lines)
    if not OVERLAY_ENABLED then
        return
    end

    local g = rawget(_G, "gui")
    if type(g) ~= "table" then
        return
    end

    for i, line in ipairs(lines) do
        local y = OVERLAY_Y + (i - 1) * OVERLAY_LINE_HEIGHT
        if type(g.drawText) == "function" then
            pcall(g.drawText, OVERLAY_X, y, line)
        elseif type(g.text) == "function" then
            pcall(g.text, OVERLAY_X, y, line)
        end
    end
end

local function verify_start_state(expected_pressed, verify_keys)
    local state = joypad_get_state()
    if not state then
        return nil
    end
    for _, key in ipairs(verify_keys or {}) do
        if state[key] ~= nil then
            return state[key] == expected_pressed
        end
    end
    return nil
end

local function apply_start_input(system_name, pressed)
    local jp = rawget(_G, "joypad")
    if type(jp) ~= "table" or type(jp.set) ~= "function" then
        return false
    end

    for _, target in ipairs(joypad_targets(system_name, pressed)) do
        local ok
        if target.device == nil then
            ok = pcall(jp.set, target.payload)
        else
            ok = pcall(jp.set, target.payload, target.device)
        end
        if ok then
            local verified = verify_start_state(pressed, target.verify)
            if verified == nil or verified then
                return true
            end
        end
    end

    return false
end

local function menu_trace_header()
    local header = {
        "frame", "system", "rom_label", "pc",
        "screen_ready", "ram_script", "ram_subscript", "ppu_load_index",
        "cur_save_slot", "ram_004D", "ram_next_script",
        "ram_041F", "ram_0421", "ram_0423",
        "ram_0000", "ram_0001", "ram_0002", "ram_0003", "ram_0004", "ram_0005",
        "spr_index_1", "spr_index_2",
        "trace_last", "PPU_REQ_INDEX", "PPU_REQ_PTR", "PPU_REQ_RES",
        "SEQ_EVT_COUNT", "PPU_EVT_COUNT"
    }
    append_range_header(header, "ppu_buf", MENU_PPU_BUF_COUNT)
    append_range_header(header, "oam", MENU_OAM_COUNT)
    return header
end

local function menu_trace_row(frame, system_name, rom_label, domain, base_offset)
    local row = {
        frame,
        system_name,
        rom_label,
        get_pc(system_name),
        hex(read_abs(domain, base_offset, 0x0011, 1), 2),
        hex(read_abs(domain, base_offset, 0x0012, 1), 2),
        hex(read_abs(domain, base_offset, 0x0013, 1), 2),
        hex(read_abs(domain, base_offset, 0x0014, 1), 2),
        hex(read_abs(domain, base_offset, 0x0016, 1), 2),
        hex(read_abs(domain, base_offset, 0x004D, 1), 2),
        hex(read_abs(domain, base_offset, 0x005B, 1), 2),
        hex(read_abs(domain, base_offset, 0x041F, 1), 2),
        hex(read_abs(domain, base_offset, 0x0421, 1), 2),
        hex(read_abs(domain, base_offset, 0x0423, 1), 2),
        hex(read_abs(domain, base_offset, 0x0000, 1), 2),
        hex(read_abs(domain, base_offset, 0x0001, 1), 2),
        hex(read_abs(domain, base_offset, 0x0002, 1), 2),
        hex(read_abs(domain, base_offset, 0x0003, 1), 2),
        hex(read_abs(domain, base_offset, 0x0004, 1), 2),
        hex(read_abs(domain, base_offset, 0x0005, 1), 2),
        hex(read_abs(domain, base_offset, 0x0343, 1), 2),
        hex(read_abs(domain, base_offset, 0x0344, 1), 2),
    }

    if system_name == "genesis" then
        row[#row + 1] = hex(read_abs(domain, base_offset, 0xF000, 2), 4)
        row[#row + 1] = hex(read_abs(domain, base_offset, 0xF0A2, 2), 4)
        row[#row + 1] = hex(read_abs(domain, base_offset, 0xF0A4, 2), 4)
        row[#row + 1] = hex(read_abs(domain, base_offset, 0xF0A8, 4), 8)
        row[#row + 1] = hex(read_abs(domain, base_offset, 0xF0AC, 2), 4)
        row[#row + 1] = hex(read_abs(domain, base_offset, 0xF0AE, 2), 4)
    else
        row[#row + 1] = ""
        row[#row + 1] = ""
        row[#row + 1] = ""
        row[#row + 1] = ""
        row[#row + 1] = ""
        row[#row + 1] = ""
    end

    append_range_values(row, domain, base_offset, MENU_PPU_BUF_START, MENU_PPU_BUF_COUNT)
    append_range_values(row, domain, base_offset, MENU_OAM_START, MENU_OAM_COUNT)
    return row
end

local write_row

local function call_if_exists(fn)
    if type(fn) == "function" then
        local ok = pcall(fn)
        if ok then
            return true
        end
    end
    return false
end

local function reset_emulation()
    if not RESET_ON_START then
        return "none"
    end

    local kind = string.lower(RESET_KIND or "poweron")

    if kind == "rebootcore" or kind == "reboot_core" then
        if call_if_exists(client and client.reboot_core) then
            return "reboot_core"
        end
    end

    if kind == "softreset" then
        if call_if_exists(emu and emu.softreset) then
            return "softreset"
        end
    end

    if call_if_exists(client and client.reboot_core) then
        return "reboot_core"
    end

    if call_if_exists(emu and emu.reset) then
        return "reset"
    end

    if call_if_exists(emu and emu.poweron) then
        return "poweron"
    end

    if call_if_exists(emu and emu.softreset) then
        return "softreset"
    end

    if client and type(client.openrom) == "function" then
        local rom_candidates = {
            try_name(gameinfo and gameinfo.getromfilename),
            try_name(gameinfo and gameinfo.getfilename),
            try_name(client and client.getfilename),
            current_rom_name(),
        }
        for _, rom_name in ipairs(rom_candidates) do
            if rom_name then
                local ok = pcall(client.openrom, rom_name)
                if ok then
                    return "openrom"
                end
            end
        end
    end

    return "unsupported"
end

local function event_name(event_id)
    return EVENT_NAMES[event_id] or ""
end

local function count_delta(current, previous)
    if previous == nil then
        return current
    end
    if current >= previous then
        return current - previous
    end
    return (0x10000 - previous) + current
end

local function append_seq_events(file, frame, system_name, rom_label, total_count, previous_count, domain, base_offset)
    if not file then
        return total_count
    end
    local delta = math.min(count_delta(total_count, previous_count), TRACE_EVT_RING_SIZE)
    if delta <= 0 then
        return total_count
    end
    for i = delta, 1, -1 do
        local ordinal = total_count - i + 1
        local slot = (ordinal - 1) % TRACE_EVT_RING_SIZE
        local base = (base_offset or 0) + TRACE_SEQ_EVT_RING_ADDR + slot * TRACE_EVT_SLOT_SIZE
        local event_id = read_be(domain, base, 2)
        write_row(file, {
            frame,
            system_name,
            rom_label,
            "seq",
            total_count,
            ordinal,
            hex(event_id, 4),
            event_name(event_id),
            hex(read_be(domain, base + 2, 2), 4),
            "",
            "",
            hex(read_be(domain, base + 4, 2), 4),
            hex(read_be(domain, base + 12, 4), 8),
            hex(read_be(domain, base + 6, 2), 4),
            hex(read_be(domain, base + 8, 2), 4),
            hex(read_be(domain, base + 10, 2), 4),
            "",
            "",
            "",
        })
    end
    return total_count
end

local function append_ppu_events(file, frame, system_name, rom_label, total_count, previous_count, domain, base_offset)
    if not file then
        return total_count
    end
    local delta = math.min(count_delta(total_count, previous_count), TRACE_EVT_RING_SIZE)
    if delta <= 0 then
        return total_count
    end
    for i = delta, 1, -1 do
        local ordinal = total_count - i + 1
        local slot = (ordinal - 1) % TRACE_EVT_RING_SIZE
        local base = (base_offset or 0) + TRACE_PPU_EVT_RING_ADDR + slot * TRACE_EVT_SLOT_SIZE
        local event_id = read_be(domain, base, 2)
        write_row(file, {
            frame,
            system_name,
            rom_label,
            "ppu",
            total_count,
            ordinal,
            hex(event_id, 4),
            event_name(event_id),
            hex(read_be(domain, base + 2, 2), 4),
            hex(read_be(domain, base + 4, 2), 4),
            hex(read_be(domain, base + 6, 2), 4),
            "",
            hex(read_be(domain, base + 12, 4), 8),
            "",
            "",
            "",
            hex(read_be(domain, base + 8, 2), 4),
            hex(read_be(domain, base + 10, 2), 4),
            hex(read_be(domain, base + 12, 4), 8),
        })
    end
    return total_count
end

write_row = function(file, values)
    for i, value in ipairs(values) do
        if i > 1 then
            file:write(",")
        end
        file:write(csv_escape(value))
    end
    file:write("\r\n")
end

local function run()
    local reset_result = reset_emulation()
    for _ = 1, RESET_SETTLE_FRAMES do
        emu.frameadvance()
    end

    local system_name, ram_domain, ram_base = detect_system()
    local rom_label = current_rom_label(system_name)
    local out_path = OUT_DIR .. "oracle_trace_" .. rom_label .. ".csv"
    local menu_path = OUT_DIR .. "oracle_menu_" .. rom_label .. ".csv"
    local summary_path = OUT_DIR .. "oracle_trace_" .. rom_label .. "_summary.txt"
    local event_path = OUT_DIR .. "oracle_events_" .. rom_label .. ".csv"
    local write_path = OUT_DIR .. "oracle_writes_" .. rom_label .. ".csv"
    local watches = {}
    local event_file = nil
    local menu_file = nil
    local write_file = nil
    local write_watch_enabled = false

    local out_file, err = io.open(out_path, "w")
    if not out_file then
        error("Could not open trace output file: " .. tostring(err))
    end
    menu_file = assert(io.open(menu_path, "w"))
    if system_name == "genesis" then
        event_file = assert(io.open(event_path, "w"))
        write_file = assert(io.open(write_path, "w"))
        write_row(event_file, {
            "frame", "system", "rom_label", "kind", "total_count", "ordinal",
            "event_id", "event_name", "arg0", "arg1", "arg2",
            "seq_ptr_raw", "ptr_res", "seq_index", "seq_byte", "seq_source",
            "ppu_index", "ppu_ptr_raw", "ppu_ptr_res"
        })
        write_row(write_file, {
            "frame", "addr", "value", "pc", "trace_last", "trace_seq",
            "ppu_buf_index", "ppu_buf_0", "ppu_buf_1", "ppu_buf_2",
            "d0", "d1", "d2", "d3", "a0", "a1", "a7", "sr"
        })
    end

    for _, watch in ipairs(WATCHES) do
        watches[#watches + 1] = watch
    end
    if system_name == "genesis" then
        for _, watch in ipairs(GENESIS_ONLY_WATCHES) do
            watches[#watches + 1] = watch
        end
        memory.usememorydomain(ram_domain)
        write_watch_enabled = make_ppu_header_write_logger(write_file, system_name)
    end

    local header = { "frame", "system", "rom_label", "pc" }
    for _, watch in ipairs(watches) do
        header[#header + 1] = watch.key
    end
    for _, reg in ipairs(GENESIS_REG_EXPORTS) do
        header[#header + 1] = reg.key
    end
    write_row(out_file, header)
    write_row(menu_file, menu_trace_header())

    local first_change = {}
    local last_values = {}
    local prev_seq_evt_count = 0
    local prev_ppu_evt_count = 0
    local menu_milestones = {
        script1 = nil,
        subscript = nil,
        load14 = nil,
        slot = nil,
        row041F = nil,
        row0421 = nil,
        row0423 = nil,
        spr_index = nil,
    }
    local auto_start = {
        enabled = auto_start_enabled_for(system_name),
        input_supported = nil,
        ready_frame = nil,
        attempts = 0,
        attempt_frames = {},
        next_attempt_frame = nil,
        hold_until_frame = nil,
        stop_frame = nil,
        start_held = false,
    }
    local auto_start_frame_guid = nil
    local auto_start_clear_guid = nil
    local manual_start = {
        enabled = manual_start_overlay_enabled_for(system_name),
        input_supported = false,
        key_name = nil,
        current_pressed = false,
        first_press_frame = nil,
        press_frames = {},
        prev_pressed = false,
    }
    local start_capture = {
        enabled = system_name == "nes",
        detected_frame = nil,
        detected_source = nil,
        post_end_frame = nil,
    }
    local frame = 0
    local frame_limit = start_capture.enabled and MAX_WAIT_FOR_START_FRAMES or 300
    local last_frame = 0

    if auto_start.enabled and event then
        if type(event.onframestart) == "function" then
            local ok, guid = pcall(event.onframestart, function()
                apply_start_input(system_name, auto_start.start_held)
            end)
            if ok then
                auto_start_frame_guid = guid
                auto_start.input_supported = true
            end
        end
        if type(event.onframeend) == "function" then
            local ok, guid = pcall(event.onframeend, function()
                if auto_start.start_held then
                    apply_start_input(system_name, false)
                end
            end)
            if ok then
                auto_start_clear_guid = guid
                if auto_start.input_supported == nil then
                    auto_start.input_supported = true
                end
            end
        end
    end

    while frame <= frame_limit do
        if frame > 0 then
            if auto_start.enabled and auto_start_frame_guid == nil then
                local ok = apply_start_input(system_name, auto_start.start_held)
                if ok then
                    auto_start.input_supported = true
                elseif auto_start.input_supported == nil and auto_start.start_held then
                    auto_start.input_supported = false
                end
            end
            emu.frameadvance()
        end

        local regs = get_register_table()
        local row = { frame, system_name, rom_label, get_pc(system_name) }

        for _, watch in ipairs(watches) do
            local value = read_watch(watch, ram_domain, ram_base)
            local hex_value = hex(value, watch.width)
            row[#row + 1] = hex_value

            if last_values[watch.key] == nil then
                last_values[watch.key] = hex_value
            elseif first_change[watch.key] == nil and last_values[watch.key] ~= hex_value then
                first_change[watch.key] = frame
                last_values[watch.key] = hex_value
            else
                last_values[watch.key] = hex_value
            end
        end

        for _, reg in ipairs(GENESIS_REG_EXPORTS) do
            if system_name == "genesis" then
                row[#row + 1] = get_register_hex(regs, reg.candidates, reg.width)
            else
                row[#row + 1] = ""
            end
        end

        write_row(out_file, row)
        write_row(menu_file, menu_trace_row(frame, system_name, rom_label, ram_domain, ram_base))

        local menu_screen_ready = read_abs(ram_domain, ram_base, 0x0011, 1)
        local menu_script = read_abs(ram_domain, ram_base, 0x0012, 1)
        local menu_subscript = read_abs(ram_domain, ram_base, 0x0013, 1)
        local menu_load = read_abs(ram_domain, ram_base, 0x0014, 1)
        local menu_slot = read_abs(ram_domain, ram_base, 0x0016, 1)
        local menu_041F = read_abs(ram_domain, ram_base, 0x041F, 1)
        local menu_0421 = read_abs(ram_domain, ram_base, 0x0421, 1)
        local menu_0423 = read_abs(ram_domain, ram_base, 0x0423, 1)
        local menu_spr_1 = read_abs(ram_domain, ram_base, 0x0343, 1)
        local menu_spr_2 = read_abs(ram_domain, ram_base, 0x0344, 1)
        local btn_press = read_abs(ram_domain, ram_base, 0x00F8, 1)
        local btn_hold = read_abs(ram_domain, ram_base, 0x00FA, 1)

        if manual_start.enabled then
            local pressed, supported, key_name = read_manual_start_state(system_name)
            manual_start.input_supported = supported
            if key_name ~= nil then
                manual_start.key_name = key_name
            end
            manual_start.current_pressed = pressed == true
            if manual_start.current_pressed and not manual_start.prev_pressed then
                if manual_start.first_press_frame == nil then
                    manual_start.first_press_frame = frame
                end
                manual_start.press_frames[#manual_start.press_frames + 1] = frame
            end
            manual_start.prev_pressed = manual_start.current_pressed
        end

        if menu_milestones.script1 == nil and menu_script == 0x01 then
            menu_milestones.script1 = frame
        end
        if menu_milestones.subscript == nil and menu_subscript ~= 0x00 then
            menu_milestones.subscript = frame
        end
        if menu_milestones.load14 == nil and menu_load == 0x14 then
            menu_milestones.load14 = frame
        end
        if menu_milestones.slot == nil and menu_slot ~= 0x00 then
            menu_milestones.slot = frame
        end
        if menu_milestones.row041F == nil and menu_041F ~= 0x00 then
            menu_milestones.row041F = frame
        end
        if menu_milestones.row0421 == nil and menu_0421 ~= 0x00 then
            menu_milestones.row0421 = frame
        end
        if menu_milestones.row0423 == nil and menu_0423 ~= 0x00 then
            menu_milestones.row0423 = frame
        end
        if menu_milestones.spr_index == nil and (menu_spr_1 ~= 0x00 or menu_spr_2 ~= 0x00) then
            menu_milestones.spr_index = frame
        end

        if start_capture.enabled and start_capture.detected_frame == nil then
            if manual_start.first_press_frame ~= nil then
                start_capture.detected_frame = manual_start.first_press_frame
                start_capture.detected_source = "manual_start_overlay"
            elseif btn_press ~= 0x00 or btn_hold ~= 0x00 then
                start_capture.detected_frame = frame
                start_capture.detected_source = "nes_btn_press_hold"
            end

            if start_capture.detected_frame ~= nil then
                start_capture.post_end_frame = math.min(start_capture.detected_frame + POST_START_CAPTURE_FRAMES, MAX_TOTAL_FRAMES)
                frame_limit = start_capture.post_end_frame
            end
        end

        if auto_start.enabled then
            local menu_active =
                menu_script ~= 0x00 or
                menu_subscript ~= 0x00 or
                menu_load == 0x12 or
                menu_load == 0x14 or
                menu_spr_1 ~= 0x00 or
                menu_spr_2 ~= 0x00

            if auto_start.ready_frame == nil and menu_screen_ready == 0x01 and menu_load == 0x00 then
                auto_start.ready_frame = frame
                auto_start.next_attempt_frame = frame + AUTO_START_READY_DELAY
            end

            if menu_active and auto_start.stop_frame == nil then
                auto_start.stop_frame = frame
            end

            local next_frame = frame + 1
            local hold_active =
                auto_start.hold_until_frame ~= nil and
                next_frame <= auto_start.hold_until_frame

            if auto_start.stop_frame ~= nil or next_frame > frame_limit then
                auto_start.start_held = false
            elseif hold_active then
                auto_start.start_held = true
            elseif auto_start.next_attempt_frame ~= nil
                and next_frame >= auto_start.next_attempt_frame
                and auto_start.attempts < AUTO_START_MAX_ATTEMPTS then
                auto_start.attempts = auto_start.attempts + 1
                auto_start.attempt_frames[#auto_start.attempt_frames + 1] = next_frame
                auto_start.hold_until_frame = next_frame + AUTO_START_HOLD_FRAMES - 1
                auto_start.next_attempt_frame = next_frame + AUTO_START_RETRY_INTERVAL
                auto_start.start_held = true
            else
                auto_start.start_held = false
            end
        end

        if system_name == "genesis" then
            local seq_count = read_be(ram_domain, (ram_base or 0) + TRACE_SEQ_EVT_COUNT_ADDR, 2)
            local ppu_count = read_be(ram_domain, (ram_base or 0) + TRACE_PPU_EVT_COUNT_ADDR, 2)
            prev_seq_evt_count = append_seq_events(event_file, frame, system_name, rom_label, seq_count, prev_seq_evt_count, ram_domain, ram_base)
            prev_ppu_evt_count = append_ppu_events(event_file, frame, system_name, rom_label, ppu_count, prev_ppu_evt_count, ram_domain, ram_base)
        end

        if manual_start.enabled then
            draw_overlay_lines({
                "Oracle Trace NES Manual Mode",
                "Reboot core yourself before running if needed.",
                "Press Start manually when the title is ready.",
                "Start visible to Lua: " .. (manual_start.current_pressed and "YES" or "NO"),
                "Start key: " .. tostring(manual_start.key_name or "not seen"),
                "First Start frame: " .. tostring(manual_start.first_press_frame or "not yet"),
                "Internal Start frame: " .. tostring(start_capture.detected_frame or "not yet"),
                string.format("ready=%s script=%s sub=%s load=%s slot=%s",
                    hex(menu_screen_ready, 2),
                    hex(menu_script, 2),
                    hex(menu_subscript, 2),
                    hex(menu_load, 2),
                    hex(menu_slot, 2))
            })
        end
        last_frame = frame
        frame = frame + 1
    end

    out_file:close()
    menu_file:close()
    if auto_start.enabled then
        apply_start_input(system_name, false)
    end
    if event and type(event.unregisterbyid) == "function" then
        if auto_start_frame_guid ~= nil then
            pcall(event.unregisterbyid, auto_start_frame_guid)
        end
        if auto_start_clear_guid ~= nil then
            pcall(event.unregisterbyid, auto_start_clear_guid)
        end
    end
    if event_file then
        event_file:close()
    end
    if write_file then
        write_file:close()
    end

    local summary = assert(io.open(summary_path, "w"))
    summary:write("Oracle trace summary\r\n")
    summary:write("ROM: " .. rom_label .. "\r\n")
    summary:write("System: " .. system_name .. "\r\n")
    summary:write("RAM domain: " .. tostring(ram_domain) .. "\r\n")
    summary:write("RAM base: " .. hex(ram_base or 0, system_name == "genesis" and 6 or 4) .. "\r\n")
    summary:write("Reset on start: " .. tostring(RESET_ON_START) .. "\r\n")
    summary:write("Reset kind: " .. tostring(RESET_KIND) .. "\r\n")
    summary:write("Reset result: " .. tostring(reset_result) .. "\r\n")
    summary:write("Reset settle frames: " .. tostring(RESET_SETTLE_FRAMES) .. "\r\n")
    summary:write("Frames: 0-" .. tostring(last_frame) .. "\r\n")
    summary:write("Max wait before Start: " .. tostring(MAX_WAIT_FOR_START_FRAMES) .. "\r\n")
    summary:write("Post-Start capture frames: " .. tostring(POST_START_CAPTURE_FRAMES) .. "\r\n")
    summary:write("Max total frames: " .. tostring(MAX_TOTAL_FRAMES) .. "\r\n")
    summary:write("Trace: " .. out_path .. "\r\n")
    summary:write("Menu trace: " .. menu_path .. "\r\n\r\n")
    if event_file then
        summary:write("Event trace: " .. event_path .. "\r\n")
        if write_file then
            summary:write("Write trace: " .. write_path .. "\r\n")
            summary:write("Write watch enabled: " .. tostring(write_watch_enabled) .. "\r\n")
        end
        summary:write("Sequence event count: " .. tostring(prev_seq_evt_count) .. "\r\n")
        summary:write("PPU event count: " .. tostring(prev_ppu_evt_count) .. "\r\n\r\n")
    end
    summary:write("Menu milestones:\r\n")
    summary:write("  script1 first frame: " .. tostring(menu_milestones.script1 or "never") .. "\r\n")
    summary:write("  nonzero subscript first frame: " .. tostring(menu_milestones.subscript or "never") .. "\r\n")
    summary:write("  ppu_load_index=$14 first frame: " .. tostring(menu_milestones.load14 or "never") .. "\r\n")
    summary:write("  cur_save_slot nonzero first frame: " .. tostring(menu_milestones.slot or "never") .. "\r\n")
    summary:write("  ram_041F nonzero first frame: " .. tostring(menu_milestones.row041F or "never") .. "\r\n")
    summary:write("  ram_0421 nonzero first frame: " .. tostring(menu_milestones.row0421 or "never") .. "\r\n")
    summary:write("  ram_0423 nonzero first frame: " .. tostring(menu_milestones.row0423 or "never") .. "\r\n")
    summary:write("  sprite index active first frame: " .. tostring(menu_milestones.spr_index or "never") .. "\r\n\r\n")
    summary:write("Manual Start Detection:\r\n")
    summary:write("  enabled: " .. tostring(manual_start.enabled) .. "\r\n")
    summary:write("  input supported: " .. tostring(manual_start.input_supported) .. "\r\n")
    summary:write("  key name: " .. tostring(manual_start.key_name or "never seen") .. "\r\n")
    summary:write("  first press frame: " .. tostring(manual_start.first_press_frame or "never") .. "\r\n")
    summary:write("  press frames: " .. table.concat(manual_start.press_frames, ", ") .. "\r\n\r\n")
    summary:write("Internal Start Capture:\r\n")
    summary:write("  enabled: " .. tostring(start_capture.enabled) .. "\r\n")
    summary:write("  detected frame: " .. tostring(start_capture.detected_frame or "never") .. "\r\n")
    summary:write("  detected source: " .. tostring(start_capture.detected_source or "never") .. "\r\n")
    summary:write("  post-end frame: " .. tostring(start_capture.post_end_frame or "never") .. "\r\n\r\n")
    summary:write("Auto-Start:\r\n")
    summary:write("  enabled: " .. tostring(auto_start.enabled) .. "\r\n")
    summary:write("  input supported: " .. tostring(auto_start.input_supported) .. "\r\n")
    summary:write("  ready frame: " .. tostring(auto_start.ready_frame or "never") .. "\r\n")
    summary:write("  attempts: " .. tostring(auto_start.attempts) .. "\r\n")
    summary:write("  attempt frames: " .. table.concat(auto_start.attempt_frames, ", ") .. "\r\n")
    summary:write("  stop frame: " .. tostring(auto_start.stop_frame or "never") .. "\r\n\r\n")
    summary:write("First changes:\r\n")

    for _, watch in ipairs(watches) do
        local change_frame = first_change[watch.key]
        if change_frame then
            summary:write(string.format("  %-16s frame %d\r\n", watch.key, change_frame))
        else
            summary:write(string.format("  %-16s never changed\r\n", watch.key))
        end
    end

    summary:close()

    print("Oracle trace written to:")
    print("  " .. out_path)
    print("  " .. menu_path)
    print("  " .. summary_path)
    if system_name == "genesis" then
        print("  " .. event_path)
    end
    print("System: " .. system_name)
    print("ROM label: " .. rom_label)
    print("RAM domain: " .. tostring(ram_domain))
    print("RAM base: " .. hex(ram_base or 0, system_name == "genesis" and 6 or 4))
    print("Reset result: " .. tostring(reset_result))
    if client and type(client.exit) == "function" then
        client.exit()
    end
end

run()
