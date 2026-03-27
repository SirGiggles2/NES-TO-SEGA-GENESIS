-- zelda_chr_watch.lua
-- Track a few frontend CHR tiles from boot through register/name-entry.

local ROM_VERSION = "zelda_v627"
local MAX_FRAMES = 600
local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "chr_watch_" .. ROM_VERSION .. ".txt"

local ADDR_SCRIPT = 0xFF0012
local ADDR_SUBSCRIPT = 0xFF0013
local ADDR_READY = 0xFF0011
local ADDR_TRACE_LAST = 0xFFF000
local ADDR_TRACE_SEQ = 0xFFF002
local ADDR_CHR_SHADOW = 0xFFC000

local WATCH_TILES = { 0x008, 0x00A, 0x025, 0x125, 0x10A, 0x10E, 0x110, 0x11B, 0x11C }

memory.usememorydomain("M68K BUS")

local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
    print(msg)
end

local function dump_tile(tile)
    local parts = {}
    local base = ADDR_CHR_SHADOW + (tile * 16)
    for i = 0, 15 do
        parts[#parts + 1] = string.format("%02X", memory.read_u8(base + i))
    end
    return table.concat(parts, "")
end

local previous = {}
for _, tile in ipairs(WATCH_TILES) do
    previous[tile] = dump_tile(tile)
end

log("=== CHR WATCH " .. ROM_VERSION .. " ===")
for _, tile in ipairs(WATCH_TILES) do
    log(string.format("boot chr[%03X]=%s", tile, previous[tile]))
end

for frame = 1, MAX_FRAMES do
    emu.frameadvance()

    local changed = false
    local lines = {}
    for _, tile in ipairs(WATCH_TILES) do
        local current = dump_tile(tile)
        if current ~= previous[tile] then
            changed = true
            lines[#lines + 1] = string.format("chr[%03X] %s -> %s", tile, previous[tile], current)
            previous[tile] = current
        end
    end

    if changed or frame == 1 or frame % 30 == 0 then
        log(string.format(
            "frame=%d script=%02X sub=%02X ready=%02X trace=%04X/%04X",
            frame,
            memory.read_u8(ADDR_SCRIPT),
            memory.read_u8(ADDR_SUBSCRIPT),
            memory.read_u8(ADDR_READY),
            memory.read_u16_be(ADDR_TRACE_LAST),
            memory.read_u16_be(ADDR_TRACE_SEQ)
        ))
        for _, line in ipairs(lines) do
            log("  " .. line)
        end
    end
end

log("=== SUMMARY ===")
for _, tile in ipairs(WATCH_TILES) do
    log(string.format("final chr[%03X]=%s", tile, previous[tile]))
end
log_file:close()
