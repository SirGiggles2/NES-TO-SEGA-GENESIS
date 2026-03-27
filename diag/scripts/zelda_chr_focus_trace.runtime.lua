-- zelda_chr_focus_trace.lua
-- Trace the exact writes that clobber selected CHR tiles.

local ROM_VERSION = "zelda_v627"
local FRAME_LIMIT = 180
local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "chr_focus_trace_" .. ROM_VERSION .. ".csv"

local CHR_SHADOW_BASE = 0xFFC000
local VRAM_ADDR_CURR = 0xFFEF08
local TRACE_LAST = 0xFFF000
local TRACE_SEQ = 0xFFF002
local PPU_INDEX = 0xFFF0A2
local PPU_PTR_RAW = 0xFFF0A4
local PPU_PTR_RES = 0xFFF0A8

local WATCH_TILES = {
    [0x008] = true, [0x00A] = true, [0x025] = true, [0x125] = true,
}

memory.usememorydomain("M68K BUS")

local out = assert(io.open(OUT_PATH, "w"))

local function hex(v, w)
    return string.format("%0" .. tostring(w) .. "X", v or 0)
end

local function row(values)
    out:write(table.concat(values, ","))
    out:write("\n")
    out:flush()
end

row({
    "frame","pc","trace_last","trace_seq","addr","tile","byte_in_tile","value",
    "vram_addr","ppu_index","ppu_ptr_raw","ppu_ptr_res","d0","d1","d2","d3","d4","a0","a1"
})

local function on_chr_write(addr, value)
    local offset = addr - CHR_SHADOW_BASE
    local tile = math.floor(offset / 16)
    if not WATCH_TILES[tile] then
        return
    end
    row({
        tostring(emu.framecount()),
        hex(emu.getregister("M68K PC"), 6),
        hex(memory.read_u16_be(TRACE_LAST), 4),
        hex(memory.read_u16_be(TRACE_SEQ), 4),
        hex(addr, 6),
        hex(tile, 3),
        tostring(offset % 16),
        hex(value or memory.read_u8(addr), 2),
        hex(memory.read_u16_be(VRAM_ADDR_CURR), 4),
        hex(memory.read_u16_be(PPU_INDEX), 4),
        hex(memory.read_u16_be(PPU_PTR_RAW), 4),
        hex(memory.read_u32_be(PPU_PTR_RES), 8),
        hex(emu.getregister("M68K D0"), 8),
        hex(emu.getregister("M68K D1"), 8),
        hex(emu.getregister("M68K D2"), 8),
        hex(emu.getregister("M68K D3"), 8),
        hex(emu.getregister("M68K D4"), 8),
        hex(emu.getregister("M68K A0"), 8),
        hex(emu.getregister("M68K A1"), 8),
    })
end

for tile, _ in pairs(WATCH_TILES) do
    local base = CHR_SHADOW_BASE + (tile * 16)
    for i = 0, 15 do
        local addr = base + i
        event.onmemorywrite(function(_, value)
            on_chr_write(addr, value)
        end, addr)
    end
end

for _ = 1, FRAME_LIMIT do
    emu.frameadvance()
end

out:write("END\n")
out:close()
