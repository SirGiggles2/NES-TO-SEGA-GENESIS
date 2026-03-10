-- Zelda NES/Genesis oracle trace exporter for BizHawk.
-- Runs against the currently loaded ROM and writes a per-frame CSV
-- so we can diff the original NES title boot against the Genesis port.

local NUM_FRAMES = 300
local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local TRACE_HINT = nil -- e.g. "zelda_v40" or "zelda_nes_title"
local RESET_ON_START = true
local RESET_KIND = "poweron" -- "poweron" or "softreset"
local RESET_SETTLE_FRAMES = 0

local WATCHES = {
    { key = "ram_0000_t49",    addr = 0x0000, width = 2 },
    { key = "ram_0002_t17",    addr = 0x0002, width = 2 },
    { key = "ram_0003_t18",    addr = 0x0003, width = 2 },
    { key = "ram_0004_t18",    addr = 0x0004, width = 2 },
    { key = "game_mode",       addr = 0x0010, width = 2 },
    { key = "screen_ready",    addr = 0x0011, width = 2 },
    { key = "ram_script",      addr = 0x0012, width = 2 },
    { key = "ram_subscript",   addr = 0x0013, width = 2 },
    { key = "ppu_load_index",  addr = 0x0014, width = 2 },
    { key = "ram_frm_cnt",     addr = 0x0015, width = 2 },
    { key = "rendering_flag",  addr = 0x0017, width = 2 },
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
    { key = "ram_042D",        addr = 0x042D, width = 2 },
    { key = "ram_042E",        addr = 0x042E, width = 2 },
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

local function csv_escape(value)
    local s = tostring(value or "")
    if s:find('[,",\r\n]') then
        s = '"' .. s:gsub('"', '""') .. '"'
    end
    return s
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

    if kind == "softreset" then
        if call_if_exists(emu and emu.softreset) then
            return "softreset"
        end
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

    if call_if_exists(client and client.reboot_core) then
        return "reboot_core"
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
    local system_name, ram_domain, ram_base = detect_system()
    local rom_label = current_rom_label(system_name)
    local out_path = OUT_DIR .. "oracle_trace_" .. rom_label .. ".csv"
    local summary_path = OUT_DIR .. "oracle_trace_" .. rom_label .. "_summary.txt"
    local event_path = OUT_DIR .. "oracle_events_" .. rom_label .. ".csv"
    local watches = {}
    local event_file = nil

    local out_file, err = io.open(out_path, "w")
    if not out_file then
        error("Could not open trace output file: " .. tostring(err))
    end
    if system_name == "genesis" then
        event_file = assert(io.open(event_path, "w"))
        write_row(event_file, {
            "frame", "system", "rom_label", "kind", "total_count", "ordinal",
            "event_id", "event_name", "arg0", "arg1", "arg2",
            "seq_ptr_raw", "ptr_res", "seq_index", "seq_byte", "seq_source",
            "ppu_index", "ppu_ptr_raw", "ppu_ptr_res"
        })
    end

    for _, watch in ipairs(WATCHES) do
        watches[#watches + 1] = watch
    end
    if system_name == "genesis" then
        for _, watch in ipairs(GENESIS_ONLY_WATCHES) do
            watches[#watches + 1] = watch
        end
    end

    local header = { "frame", "system", "rom_label", "pc" }
    for _, watch in ipairs(watches) do
        header[#header + 1] = watch.key
    end
    write_row(out_file, header)

    local reset_result = reset_emulation()
    for _ = 1, RESET_SETTLE_FRAMES do
        emu.frameadvance()
    end

    local first_change = {}
    local last_values = {}
    local prev_seq_evt_count = 0
    local prev_ppu_evt_count = 0

    for frame = 0, NUM_FRAMES do
        if frame > 0 then
            emu.frameadvance()
        end

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

        write_row(out_file, row)

        if system_name == "genesis" then
            local seq_count = read_be(ram_domain, (ram_base or 0) + TRACE_SEQ_EVT_COUNT_ADDR, 2)
            local ppu_count = read_be(ram_domain, (ram_base or 0) + TRACE_PPU_EVT_COUNT_ADDR, 2)
            prev_seq_evt_count = append_seq_events(event_file, frame, system_name, rom_label, seq_count, prev_seq_evt_count, ram_domain, ram_base)
            prev_ppu_evt_count = append_ppu_events(event_file, frame, system_name, rom_label, ppu_count, prev_ppu_evt_count, ram_domain, ram_base)
        end
    end

    out_file:close()
    if event_file then
        event_file:close()
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
    summary:write("Frames: 0-" .. tostring(NUM_FRAMES) .. "\r\n")
    summary:write("Trace: " .. out_path .. "\r\n\r\n")
    if event_file then
        summary:write("Event trace: " .. event_path .. "\r\n")
        summary:write("Sequence event count: " .. tostring(prev_seq_evt_count) .. "\r\n")
        summary:write("PPU event count: " .. tostring(prev_ppu_evt_count) .. "\r\n\r\n")
    end
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
    print("  " .. summary_path)
    if system_name == "genesis" then
        print("  " .. event_path)
    end
    print("System: " .. system_name)
    print("ROM label: " .. rom_label)
    print("RAM domain: " .. tostring(ram_domain))
    print("RAM base: " .. hex(ram_base or 0, system_name == "genesis" and 6 or 4))
    print("Reset result: " .. tostring(reset_result))
end

run()
