-- zelda_chr_buffer_dump.lua
-- Capture the live ram_0302 PPU buffer contents at the first destructive
-- CHR writes for selected frontend tiles.

local ROM_VERSION = "zelda_v423"
local FRAME_LIMIT = 80
local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "chr_buffer_dump_" .. ROM_VERSION .. ".txt"

local CHR_SHADOW_BASE = 0xFFC000
local RAM_PPU_BUF = 0xFF0302
local VRAM_ADDR_CURR = 0xFFEF08
local TRACE_LAST = 0xFFF000
local TRACE_SEQ = 0xFFF002
local PPU_INDEX = 0xFFF0A2
local PPU_PTR_RAW = 0xFFF0A4
local PPU_PTR_RES = 0xFFF0A8

local WATCH_TILES = {
    [0x008] = true,
    [0x00A] = true,
    [0x025] = true,
}

local TARGET_VRAM = {
    [0x0080] = true,
    [0x00A0] = true,
    [0x0250] = true,
}

memory.usememorydomain("M68K BUS")

local out = assert(io.open(OUT_PATH, "w"))

local function hex(v, w)
    return string.format("%0" .. tostring(w) .. "X", v or 0)
end

local function dump_bytes(base, count)
    local parts = {}
    for i = 0, count - 1 do
        parts[#parts + 1] = hex(memory.read_u8(base + i) or 0, 2)
    end
    return table.concat(parts, " ")
end

local seen = {}
local hit_count = 0

local function maybe_dump(addr)
    local offset = addr - CHR_SHADOW_BASE
    local tile = math.floor(offset / 16)
    if not WATCH_TILES[tile] then
        return
    end

    local pc = emu.getregister("M68K PC") or 0
    local trace_last = memory.read_u16_be(TRACE_LAST) or 0
    local trace_seq = memory.read_u16_be(TRACE_SEQ) or 0
    local vram_addr = memory.read_u16_be(VRAM_ADDR_CURR) or 0

    if pc ~= 0x000C9E or trace_last ~= 0x0403 or not TARGET_VRAM[vram_addr] then
        return
    end

    local key = string.format("%04X:%04X", trace_seq, vram_addr)
    if seen[key] then
        return
    end
    seen[key] = true
    hit_count = hit_count + 1

    out:write(string.format(
        "=== hit %d frame=%d trace_seq=%s vram=%s tile=%s pc=%s ===\n",
        hit_count,
        emu.framecount(),
        hex(trace_seq, 4),
        hex(vram_addr, 4),
        hex(tile, 3),
        hex(pc, 6)
    ))
    local a7 = emu.getregister("M68K A7") or 0
    out:write(string.format(
        "ppu_index=%s ppu_ptr_raw=%s ppu_ptr_res=%s d0=%s d1=%s d2=%s d3=%s d4=%s a0=%s a1=%s a7=%s\n",
        hex(memory.read_u16_be(PPU_INDEX) or 0, 4),
        hex(memory.read_u16_be(PPU_PTR_RAW) or 0, 4),
        hex(memory.read_u32_be(PPU_PTR_RES) or 0, 8),
        hex(emu.getregister("M68K D0") or 0, 8),
        hex(emu.getregister("M68K D1") or 0, 8),
        hex(emu.getregister("M68K D2") or 0, 8),
        hex(emu.getregister("M68K D3") or 0, 8),
        hex(emu.getregister("M68K D4") or 0, 8),
        hex(emu.getregister("M68K A0") or 0, 8),
        hex(emu.getregister("M68K A1") or 0, 8),
        hex(a7, 8)
    ))
    out:write(string.format(
        "stack[0]=%s stack[4]=%s stack[8]=%s stack[C]=%s stack[24]=%s stack[28]=%s stack[2C]=%s\n",
        hex(memory.read_u32_be(a7) or 0, 8),
        hex(memory.read_u32_be(a7 + 4) or 0, 8),
        hex(memory.read_u32_be(a7 + 8) or 0, 8),
        hex(memory.read_u32_be(a7 + 12) or 0, 8),
        hex(memory.read_u32_be(a7 + 36) or 0, 8),
        hex(memory.read_u32_be(a7 + 40) or 0, 8),
        hex(memory.read_u32_be(a7 + 44) or 0, 8)
    ))
    out:write("ram_0302[00:3F] = " .. dump_bytes(RAM_PPU_BUF, 0x40) .. "\n")
    out:write("ram_0302[40:7F] = " .. dump_bytes(RAM_PPU_BUF + 0x40, 0x40) .. "\n\n")
    out:flush()
end

for tile, _ in pairs(WATCH_TILES) do
    local base = CHR_SHADOW_BASE + (tile * 16)
    for i = 0, 15 do
        local addr = base + i
        event.onmemorywrite(function()
            maybe_dump(addr)
        end, addr)
    end
end

for _ = 1, FRAME_LIMIT do
    emu.frameadvance()
    if hit_count >= 4 then
        break
    end
end

out:write("END\n")
out:close()
