-- ============================================================
--  zelda_diag_v9.lua - Focused Bank-6 / PPU stream tracer
--
--  Goal:
--   * trace the bank-6 PPU buffer request lifecycle frame-by-frame
--   * dump the resolved buffer bytes whenever the request changes
--   * make the late $0302 sentinel behavior obvious
--
--  Notes from original NES bank 6 disassembly:
--   * $A080 loads a 16-bit pointer from table $A000 indexed by $14
--   * $A08C calls $A0F6 to write the stream
--   * $A09E stores $FF into $0302 after the write completes
-- ============================================================

local SCRIPT_VERSION = "v9-bank6-focus"
local NUM_FRAMES = 301
local REPORT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local ROM_DIR    = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\build\\"
local RAM_DOMAIN = "68K RAM"
local ROM_DOMAIN_CANDIDATES = {"MD CART", "Genesis ROM", "ROM", "CART", "CART ROM"}

local ADDR = {
    ppu_load_index = 0x0014,
    frm_cnt        = 0x0015,
    ppu_buf_0300   = 0x0300,
    ppu_buf_0301   = 0x0301,
    ppu_buf_0302   = 0x0302,
    trace_last     = 0xF000,
    trace_seq      = 0xF002,
    req_index      = 0xF0A2,
    req_ptr        = 0xF0A4,
    req_res        = 0xF0A8,
    seq_evt_count  = 0xF0AC,
    ppu_evt_count  = 0xF0AE,
}

local TRACE_NAMES = {
    [0x0201] = "VBlank handler entry",
    [0x0202] = "Calling translated NMI",
    [0x0203] = "Translated NMI returned",
    [0x0301] = "NMI frame body reached",
    [0x0302] = "NMI startup handler",
    [0x0303] = "NMI steady-state handler",
    [0x0400] = "PPU_WRITE_2006 latched",
    [0x0403] = "PPU_WRITE_2006 programmed",
    [0x0431] = "Title warmup screen_ready set",
    [0x0440] = "Bank6 translated ROM buffer selected",
    [0x0441] = "Bank6 translated ROM buffer complete",
    [0x0442] = "Bank6 legacy fallback used",
    [0x048A] = "Bank6 optional real buffer forced legacy",
    [0x0493] = "Legacy title index redirected to translated title payload",
    [0x0494] = "RAM $0302 redirected to translated stream writer",
    [0x0495] = "Legacy title alias redirected to RAM $0302 stream writer",
    [0x0496] = "Experimental empty translated buffer used",
}

local function hex(v, digits)
    digits = digits or 2
    if v == nil then v = 0 end
    if v < 0 then v = 0 end
    return string.format("$%0" .. digits .. "X", v)
end

local function ensure_dir()
    os.execute('mkdir "' .. REPORT_DIR .. '" >nul 2>nul')
end

local function try_name(fn)
    if type(fn) ~= "function" then return nil end
    local ok, value = pcall(fn)
    if ok and type(value) == "string" and value ~= "" then return value end
    return nil
end

local function basename(path)
    if not path then return nil end
    return path:match("([^\\/]+)$") or path
end

local function current_rom_name()
    local candidates = {
        try_name(gameinfo and gameinfo.getromname),
        try_name(gameinfo and gameinfo.getromfilename),
        try_name(gameinfo and gameinfo.getfilename),
        try_name(client and client.getromname),
        try_name(client and client.getfilename),
        try_name(emu and emu.getromname),
    }
    if emu and type(emu.getgameinfo) == "function" then
        local ok, info = pcall(emu.getgameinfo)
        if ok and type(info) == "table" then
            candidates[#candidates + 1] = info.romname or info.filename or info.name or info.path
        end
    end
    for _, name in ipairs(candidates) do
        local base = basename(name)
        if base and base:match("%.md$") then return base end
    end
    return nil
end

local function strip_ext(name)
    return (name or "unknown"):gsub("%.[^.]+$", "")
end

local function pick_rom_domain()
    local ok, list = pcall(memory.getmemorydomainlist)
    if not ok or type(list) ~= "table" then return nil end
    local have = {}
    for _, item in ipairs(list) do have[item] = true end
    for _, cand in ipairs(ROM_DOMAIN_CANDIDATES) do
        if have[cand] then return cand end
    end
    return nil
end

local function read_u8(addr)
    return memory.readbyte(addr, RAM_DOMAIN)
end

local function read_u16(addr)
    return memory.read_u16_be(addr, RAM_DOMAIN)
end

local function read_u32(addr)
    return memory.read_u32_be(addr, RAM_DOMAIN)
end

local function safe_rom_byte(domain, addr)
    local ok, value = pcall(memory.readbyte, addr, domain)
    if ok then return value end
    return nil
end

local function read_resolved_byte(rom_domain, addr)
    if addr >= 0x00FF0000 and addr <= 0x00FFFFFF then
        return read_u8(addr % 0x10000)
    end
    if rom_domain then
        return safe_rom_byte(rom_domain, addr)
    end
    return nil
end

local function dump_bytes(rom_domain, addr, count)
    if not addr or addr == 0 then return "(null)" end
    local t = {}
    for i = 0, count - 1 do
        local b = read_resolved_byte(rom_domain, addr + i)
        if b == nil then
            t[#t + 1] = "??"
        else
            t[#t + 1] = string.format("%02X", b)
        end
    end
    return table.concat(t, " ")
end

local function source_for_resolved(addr)
    if addr == 0 then return "null" end
    if addr >= 0x00FF0000 and addr <= 0x00FFFFFF then return "68K RAM" end
    return "ROM"
end

local function report_path(rom_name)
    return REPORT_DIR .. "diag_report_" .. strip_ext(rom_name) .. "_bank6_v9.txt"
end

local function write(line, out)
    out[#out + 1] = line
end

local rom_name = current_rom_name()
if not rom_name then
    console.log("Could not determine current ROM name.")
    return
end

ensure_dir()
local out = {}
local rom_domain = pick_rom_domain()
local rep_path = report_path(rom_name)

write("============================================================", out)
write("  ZELDA GENESIS PORT - BANK6 FOCUS REPORT  " .. SCRIPT_VERSION, out)
write("  ROM: " .. rom_name, out)
write("  Frames: " .. tostring(NUM_FRAMES), out)
write("  Report: " .. rep_path, out)
write("  ROM domain: " .. tostring(rom_domain or "(none)"), out)
write("============================================================", out)
write("", out)
write("NES reference: bank6 $A080-$A09E loads table pointer, writes stream via $A0F6, then stores $FF into $0302.", out)
write("", out)

local prev = {}
local snapshots = {}
local interesting = {0x0201,0x0202,0x0203,0x0301,0x0302,0x0303,0x0400,0x0403,0x0431,0x0440,0x0441,0x0442,0x048A,0x0493,0x0494,0x0495,0x0496}
local interesting_set = {}
for _, v in ipairs(interesting) do interesting_set[v] = true end

for frame = 1, NUM_FRAMES do
    local regs = emu.getregisters()
    local pc = regs["M68K PC"] or regs["PC"] or 0
    local state = {
        frame = frame,
        pc = pc,
        frm = read_u8(ADDR.frm_cnt),
        ppu_load_index = read_u8(ADDR.ppu_load_index),
        buf0 = read_u8(ADDR.ppu_buf_0300),
        buf1 = read_u8(ADDR.ppu_buf_0301),
        buf2 = read_u8(ADDR.ppu_buf_0302),
        trace_last = read_u16(ADDR.trace_last),
        trace_seq = read_u16(ADDR.trace_seq),
        req_index = read_u16(ADDR.req_index),
        req_ptr = read_u16(ADDR.req_ptr),
        req_res = read_u32(ADDR.req_res),
        seq_evt_count = read_u16(ADDR.seq_evt_count),
        ppu_evt_count = read_u16(ADDR.ppu_evt_count),
    }

    local changed = (frame == 1)
        or state.ppu_load_index ~= (prev.ppu_load_index or -1)
        or state.trace_last ~= (prev.trace_last or -1)
        or state.req_index ~= (prev.req_index or -1)
        or state.req_ptr ~= (prev.req_ptr or -1)
        or state.req_res ~= (prev.req_res or -1)
        or state.ppu_evt_count ~= (prev.ppu_evt_count or -1)
        or state.buf2 ~= (prev.buf2 or -1)
        or interesting_set[state.trace_last]

    if changed then
        snapshots[#snapshots + 1] = state
    end

    prev = state
    emu.frameadvance()
end

write("=== SNAPSHOTS ===============================================", out)
for _, s in ipairs(snapshots) do
    write(string.format("Frame %3d  PC=%s  frm=%s  load=%s  trace=%s  req_idx=%s  req_ptr=%s  req_res=%s  ppu_evt=%s  $0300/$0301/$0302=%s/%s/%s",
        s.frame,
        hex(s.pc, 6),
        hex(s.frm),
        hex(s.ppu_load_index),
        hex(s.trace_last, 4),
        hex(s.req_index, 4),
        hex(s.req_ptr, 4),
        hex(s.req_res, 8),
        hex(s.ppu_evt_count, 4),
        hex(s.buf0),
        hex(s.buf1),
        hex(s.buf2)), out)
    if TRACE_NAMES[s.trace_last] then
        write("  Trace name: " .. TRACE_NAMES[s.trace_last], out)
    end
    if s.req_ptr == 0xA869 then
        write("  Raw pointer note: NES table entry $10 => title screen tile mappings ($A869).", out)
    elseif s.req_ptr == 0x0302 then
        write("  Raw pointer note: table entry points at CPU RAM $0302 sentinel/stream area; NES routine clears $0302 to $FF after completion.", out)
    end
    if s.req_res ~= 0 then
        write("  Resolved source: " .. source_for_resolved(s.req_res), out)
        write("  Resolved bytes : " .. dump_bytes(rom_domain, s.req_res, 24), out)
    else
        write("  Resolved source: null", out)
    end
    write("  RAM $0300 dump : " .. dump_bytes(nil, 0x00FF0300, 24), out)
    write("", out)
end

write("=== SUMMARY =================================================", out)
local saw_title_ptr = false
local saw_ram_sentinel = false
local saw_real_resolve = false
local saw_ppu_events = false
for _, s in ipairs(snapshots) do
    if s.req_ptr == 0xA869 then saw_title_ptr = true end
    if s.req_ptr == 0x0302 then saw_ram_sentinel = true end
    if s.req_res ~= 0 and s.req_res ~= 0x00FF0302 then saw_real_resolve = true end
    if s.ppu_evt_count ~= 0 then saw_ppu_events = true end
end
write("Saw title raw pointer $A869: " .. tostring(saw_title_ptr), out)
write("Saw late $0302 sentinel state: " .. tostring(saw_ram_sentinel), out)
write("Saw resolved non-sentinel buffer address: " .. tostring(saw_real_resolve), out)
write("Saw any PPU events: " .. tostring(saw_ppu_events), out)
write("", out)
write("Tip: compare the first snapshot that shows req_ptr=$A869 against the first later snapshot that falls back to req_ptr=$0302.", out)
write("If the resolved bytes look sane at $A869, the next bug is probably not pointer selection but stream consumption/hand-off after the title payload write.", out)
write("", out)
write("============================================================", out)

local f = assert(io.open(rep_path, 'wb'))
f:write(table.concat(out, "\r\n"))
f:close()
console.log("Wrote bank6 focus report: " .. rep_path)
