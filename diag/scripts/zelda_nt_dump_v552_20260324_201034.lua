local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local TRACE_HINT = "v552_20260324_201034"
local TARGET_FRAME = 900
local NT_BASE = 0xFF8200
local CHR_BASE = 0xFFC000
local PPUCTRL_ADDR = 0xFF00FF
local PPUMASK_ADDR = 0xFF00FE

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

local function write_line(handle, text)
    handle:write(text)
    handle:write("\n")
end

local function dump_nt_row(handle, row)
    local values = {}
    for col = 0, 31 do
        local addr = NT_BASE + (row * 32) + col
        values[#values + 1] = hex(memory.read_u8(addr) or 0, 2)
    end
    write_line(handle, string.format("NT row %02d: %s", row, table.concat(values, " ")))
end

local function dump_chr_tile(handle, tile)
    write_line(handle, string.format("CHR tile %03X", tile))
    local base = CHR_BASE + (tile * 16)
    local lo = {}
    local hi = {}
    for i = 0, 7 do
        lo[#lo + 1] = hex(memory.read_u8(base + i) or 0, 2)
        hi[#hi + 1] = hex(memory.read_u8(base + 8 + i) or 0, 2)
    end
    write_line(handle, "  lo: " .. table.concat(lo, " "))
    write_line(handle, "  hi: " .. table.concat(hi, " "))
end

memory.usememorydomain("M68K BUS")

while emu.framecount() < TARGET_FRAME do
    emu.frameadvance()
end

local rom_label = get_rom_label()
local out_path = OUT_DIR .. "nt_dump_" .. rom_label .. ".txt"
local done_path = OUT_DIR .. "nt_dump_" .. rom_label .. ".done"
local out = assert(io.open(out_path, "w"))

write_line(out, "ROM: " .. rom_label)
write_line(out, "Frame: " .. tostring(emu.framecount()))
write_line(out, "PPUCTRL: $" .. hex(memory.read_u8(PPUCTRL_ADDR) or 0, 2))
write_line(out, "PPUMASK: $" .. hex(memory.read_u8(PPUMASK_ADDR) or 0, 2))
write_line(out, "")

for row = 4, 20 do
    dump_nt_row(out, row)
end

write_line(out, "")
dump_chr_tile(out, 0x008)
dump_chr_tile(out, 0x01C)
dump_chr_tile(out, 0x108)
dump_chr_tile(out, 0x11C)

out:close()

local done = io.open(done_path, "w")
if done then
    done:write("done\n")
    done:close()
end

client.exit()

