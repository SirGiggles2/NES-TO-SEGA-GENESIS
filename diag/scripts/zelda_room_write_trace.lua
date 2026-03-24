local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local TRACE_HINT = nil

local SCRIPT_ADDR = 0xFF0012
local SUBSCRIPT_ADDR = 0xFF0013
local READY_ADDR = 0xFF0011
local MAP_ADDR = 0xFF00EB
local NEXT_MAP_ADDR = 0xFF00EC

local START_FRAME = 850
local FRAME_LIMIT = 1700
local EVENT_LIMIT = 120

local REGIONS = {
    { name = "6530", start = 0xFF6530, size = 0x2C0 },
    { name = "687E", start = 0xFF687E, size = 0x80 },
    { name = "68FE", start = 0xFF68FE, size = 0x80 },
    { name = "697E", start = 0xFF697E, size = 0x80 },
    { name = "69FE", start = 0xFF69FE, size = 0x80 },
    { name = "6A7E", start = 0xFF6A7E, size = 0x80 },
    { name = "6AFE", start = 0xFF6AFE, size = 0x80 },
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

local function reg(name)
    local ok, value = pcall(emu.getregister, name)
    if ok and type(value) == "number" then
        return value
    end
    return 0
end

local function read_u8(addr)
    return memory.read_u8(addr) or 0
end

local function region_for(addr)
    for _, region in ipairs(REGIONS) do
        if addr >= region.start and addr < region.start + region.size then
            return region
        end
    end
    return nil
end

memory.usememorydomain("M68K BUS")

for _, region in ipairs(REGIONS) do
    region.total_writes = 0
    region.nonzero_writes = 0
    region.first_frame = nil
    region.last_frame = nil
    region.unique = {}
end

local events = {}

local function add_event(region, addr, value)
    local frame = emu.framecount()
    if frame < START_FRAME or frame > FRAME_LIMIT then
        return
    end

    region.total_writes = region.total_writes + 1
    if (value or 0) ~= 0 then
        region.nonzero_writes = region.nonzero_writes + 1
    end
    if region.first_frame == nil then
        region.first_frame = frame
    end
    region.last_frame = frame
    region.unique[addr] = true

    if #events < EVENT_LIMIT then
        events[#events + 1] = {
            frame = frame,
            region = region.name,
            addr = addr,
            value = value or 0,
            pc = reg("M68K PC"),
            script = read_u8(SCRIPT_ADDR),
            sub = read_u8(SUBSCRIPT_ADDR),
            ready = read_u8(READY_ADDR),
            map = read_u8(MAP_ADDR),
            next_map = read_u8(NEXT_MAP_ADDR),
        }
    end
end

for _, region in ipairs(REGIONS) do
    for addr = region.start, region.start + region.size - 1 do
        event.onmemorywrite(function(_, value)
            add_event(region, addr, value or read_u8(addr))
        end, addr)
    end
end

while emu.framecount() < FRAME_LIMIT do
    emu.frameadvance()
end

local label = rom_label()
local out_path = OUT_DIR .. "room_write_trace_" .. label .. ".txt"
local done_path = OUT_DIR .. "room_write_trace_" .. label .. ".done"
local out = assert(io.open(out_path, "w"))

out:write(string.format("=== ROOM WRITE TRACE %s ===\n", label))
out:write(string.format("Frames observed: %d..%d\n", START_FRAME, FRAME_LIMIT))
out:write(string.format("Final script=%d sub=%d ready=%d map=%s next=%s\n\n",
    read_u8(SCRIPT_ADDR),
    read_u8(SUBSCRIPT_ADDR),
    read_u8(READY_ADDR),
    hex(read_u8(MAP_ADDR), 2),
    hex(read_u8(NEXT_MAP_ADDR), 2)
))

out:write("Region summaries:\n")
for _, region in ipairs(REGIONS) do
    local unique_count = 0
    for _ in pairs(region.unique) do
        unique_count = unique_count + 1
    end
    out:write(string.format(
        "%s total=%d nonzero=%d unique=%d first_frame=%s last_frame=%s\n",
        region.name,
        region.total_writes,
        region.nonzero_writes,
        unique_count,
        region.first_frame and tostring(region.first_frame) or "-",
        region.last_frame and tostring(region.last_frame) or "-"
    ))
end

out:write("\nFirst events:\n")
out:write("frame,region,addr,value,pc,script,sub,ready,map,next\n")
for _, event_row in ipairs(events) do
    out:write(string.format(
        "%d,%s,%s,%s,%s,%d,%d,%d,%s,%s\n",
        event_row.frame,
        event_row.region,
        hex(event_row.addr, 6),
        hex(event_row.value, 2),
        hex(event_row.pc, 6),
        event_row.script,
        event_row.sub,
        event_row.ready,
        hex(event_row.map, 2),
        hex(event_row.next_map, 2)
    ))
end

out:close()

local done = io.open(done_path, "w")
if done then
    done:write("done\n")
    done:close()
end

client.exit()
