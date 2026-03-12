local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local TRACE_HINT = nil -- auto-set by runner
local FRAME_LIMIT = 160

local function get_rom_label()
    local label = TRACE_HINT
    if label and label ~= "" then
        return label
    end

    local path = gameinfo.getromname() or "unknown"
    label = tostring(path):gsub("^.*[\\/]", "")
    label = label:gsub("%.[Mm][Dd]$", "")
    return label
end

local function hex(value, width)
    return string.format("%0" .. tostring(width) .. "X", value or 0)
end

local function write_row(handle, values)
    handle:write(table.concat(values, ","))
    handle:write("\n")
end

local function reg(name)
    return emu.getregister(name) or 0
end

local rom_label = get_rom_label()
local out_path = OUT_DIR .. "ppu_writes_" .. rom_label .. ".csv"
local out_file = assert(io.open(out_path, "w"))

write_row(out_file, {
    "frame", "kind", "addr", "value", "pc", "trace_last", "trace_seq",
    "ppu_buf_index", "ppu_buf_0", "ppu_buf_1", "ppu_buf_2", "ppu_buf_3", "ppu_buf_4", "ppu_buf_5",
    "screen_ready", "ram_script", "ram_subscript", "ppu_load_index",
    "d0", "d1", "d2", "d3", "a0", "a1", "a2", "a7", "sr"
})

memory.usememorydomain("M68K BUS")

local function log_write(kind, addr, value)
    write_row(out_file, {
        tostring(emu.framecount()),
        kind,
        hex(addr, 6),
        hex(value, kind == "vdp_ctrl" and 4 or 2),
        hex(reg("M68K PC"), 6),
        hex(memory.read_u16_be(0xFFF000), 4),
        hex(memory.read_u16_be(0xFFF002), 4),
        hex(memory.read_u8(0xFF0301), 2),
        hex(memory.read_u8(0xFF0302), 2),
        hex(memory.read_u8(0xFF0303), 2),
        hex(memory.read_u8(0xFF0304), 2),
        hex(memory.read_u8(0xFF0305), 2),
        hex(memory.read_u8(0xFF0306), 2),
        hex(memory.read_u8(0xFF0307), 2),
        hex(memory.read_u8(0xFF0011), 2),
        hex(memory.read_u8(0xFF0012), 2),
        hex(memory.read_u8(0xFF0013), 2),
        hex(memory.read_u8(0xFF0014), 2),
        hex(reg("M68K D0"), 8),
        hex(reg("M68K D1"), 8),
        hex(reg("M68K D2"), 8),
        hex(reg("M68K D3"), 8),
        hex(reg("M68K A0"), 8),
        hex(reg("M68K A1"), 8),
        hex(reg("M68K A2"), 8),
        hex(reg("M68K A7"), 8),
        hex(reg("M68K SR"), 4),
    })
end

event.onmemorywrite(function(_, value)
    log_write("ppu_buf", 0xFF0301, value or memory.read_u8(0xFF0301))
end, 0xFF0301)

event.onmemorywrite(function(_, value)
    log_write("ppu_buf", 0xFF0302, value or memory.read_u8(0xFF0302))
end, 0xFF0302)

event.onmemorywrite(function(_, value)
    log_write("ppu_buf", 0xFF0303, value or memory.read_u8(0xFF0303))
end, 0xFF0303)

event.onmemorywrite(function(_, value)
    log_write("ppu_buf", 0xFF0304, value or memory.read_u8(0xFF0304))
end, 0xFF0304)

event.onmemorywrite(function(_, value)
    log_write("vdp_data", 0xC00000, value or memory.read_u16_be(0xC00000))
end, 0xC00000)

event.onmemorywrite(function(_, value)
    log_write("vdp_ctrl", 0xC00004, value or memory.read_u16_be(0xC00004))
end, 0xC00004)

while emu.framecount() <= FRAME_LIMIT do
    emu.frameadvance()
end

out_file:close()
client.exit()
