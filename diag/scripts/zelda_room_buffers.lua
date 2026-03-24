local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local TRACE_HINT = "zelda_v394"
local SCRIPT_ADDR = 0xFF0012
local SUBSCRIPT_ADDR = 0xFF0013
local READY_ADDR = 0xFF0011
local MAP_ADDR = 0xFF00EB
local NEXT_MAP_ADDR = 0xFF00EC
local MAX_FRAMES = 12000

local BUFFERS = {
    { name = "6530", addr = 0xFF6530, size = 0x2C0, mid = 0x140 },
    { name = "687E", addr = 0xFF687E, size = 0x80 },
    { name = "68FE", addr = 0xFF68FE, size = 0x80 },
    { name = "697E", addr = 0xFF697E, size = 0x80 },
    { name = "69FE", addr = 0xFF69FE, size = 0x80 },
    { name = "6A7E", addr = 0xFF6A7E, size = 0x80 },
    { name = "6AFE", addr = 0xFF6AFE, size = 0x80 },
    { name = "6B7E", addr = 0xFF6B7E, size = 0x100 },
}

local function rom_label()
    if TRACE_HINT and TRACE_HINT ~= "" then
        return TRACE_HINT
    end
    local path = gameinfo.getromname() or "unknown"
    path = tostring(path):gsub("^.*[\\/]", "")
    return path:gsub("%.[Mm][Dd]$", "")
end

local function hex(v, width)
    return string.format("%0" .. tostring(width) .. "X", v or 0)
end

local function read_u8(addr)
    return memory.read_u8(addr) or 0
end

local function nonzero_count(addr, size)
    local count = 0
    for i = 0, size - 1 do
        if read_u8(addr + i) ~= 0 then
            count = count + 1
        end
    end
    return count
end

local function dump_slice(addr, start_off, count)
    local values = {}
    for i = 0, count - 1 do
        values[#values + 1] = hex(read_u8(addr + start_off + i), 2)
    end
    return table.concat(values, " ")
end

memory.usememorydomain("M68K BUS")

local frame = 0
while frame < MAX_FRAMES do
    emu.frameadvance()
    frame = frame + 1
    if read_u8(SCRIPT_ADDR) >= 5 then
        break
    end
end

local entry_frame = emu.framecount()
local checkpoints = {
    { offset = 0, label = "entry" },
    { offset = 30, label = "plus30" },
    { offset = 120, label = "plus120" },
}

local label = rom_label()
local out_path = OUT_DIR .. "room_buffers_" .. label .. ".txt"
local done_path = OUT_DIR .. "room_buffers_" .. label .. ".done"
local out = assert(io.open(out_path, "w"))

for _, checkpoint in ipairs(checkpoints) do
    while emu.framecount() < entry_frame + checkpoint.offset do
        emu.frameadvance()
    end

    out:write(string.format(
        "=== %s frame=%d script=%d sub=%d ready=%d map=%s next=%s ===\n",
        checkpoint.label,
        emu.framecount(),
        read_u8(SCRIPT_ADDR),
        read_u8(SUBSCRIPT_ADDR),
        read_u8(READY_ADDR),
        hex(read_u8(MAP_ADDR), 2),
        hex(read_u8(NEXT_MAP_ADDR), 2)
    ))

    for _, buf in ipairs(BUFFERS) do
        out:write(string.format(
            "%s nonzero=%d/%d first32=%s\n",
            buf.name,
            nonzero_count(buf.addr, buf.size),
            buf.size,
            dump_slice(buf.addr, 0, 32)
        ))
        out:write(string.format(
            "%s mid32=%s\n",
            buf.name,
            dump_slice(buf.addr, math.min(buf.mid or 0x40, buf.size - 32), 32)
        ))
    end

    out:write("\n")
    out:flush()
end

out:write("=== SUMMARY ===\n")
out:write(string.format("entry_frame=%d final_frame=%d\n", entry_frame, emu.framecount()))
out:close()

local done = io.open(done_path, "w")
if done then
    done:write("done\n")
    done:close()
end

client.exit()
