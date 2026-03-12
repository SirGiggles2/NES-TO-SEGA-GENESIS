local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local TRACE_HINT = nil -- auto-set by runner
local FRAME_LIMIT = 140

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
local out_path = OUT_DIR .. "music_writes_" .. rom_label .. ".csv"
local out_file = assert(io.open(out_path, "w"))

write_row(out_file, {
    "frame", "addr", "value", "pc", "trace_last", "trace_seq",
    "ram_music", "ram_music_busy", "screen_ready", "ram_script", "ram_subscript",
    "ppu_load_index", "se_ptr_lo", "se_ptr_hi",
    "d0", "d1", "d2", "d3", "a0", "a1", "a2", "a7", "sr"
})

memory.usememorydomain("M68K BUS")

local function log_write(addr)
    local value = memory.read_u8(addr)
    write_row(out_file, {
        tostring(emu.framecount()),
        hex(addr, 6),
        hex(value, 2),
        hex(reg("M68K PC"), 6),
        hex(memory.read_u16_be(0xFFF000), 4),
        hex(memory.read_u16_be(0xFFF002), 4),
        hex(memory.read_u8(0xFF0600), 2),
        hex(memory.read_u8(0xFF0609), 2),
        hex(memory.read_u8(0xFF0011), 2),
        hex(memory.read_u8(0xFF0012), 2),
        hex(memory.read_u8(0xFF0013), 2),
        hex(memory.read_u8(0xFF0014), 2),
        hex(memory.read_u8(0xFF0066), 2),
        hex(memory.read_u8(0xFF0067), 2),
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

event.onmemorywrite(function()
    log_write(0xFF0600)
end, 0xFF0600)

event.onmemorywrite(function()
    log_write(0xFF0609)
end, 0xFF0609)

while emu.framecount() <= FRAME_LIMIT do
    emu.frameadvance()
end

out_file:close()
client.exit()
