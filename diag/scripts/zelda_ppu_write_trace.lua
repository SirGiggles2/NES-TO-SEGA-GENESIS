local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local TRACE_HINT = nil -- auto-set by runner
local FRAME_LIMIT = 240
local PPUCTRL_ADDR = 0xFF00FF
local NT_SHADOW_BASE = 0xFF8200
local CHR_SHADOW_BASE = 0xFFC000
local CHR_SHADOW_SIZE = 0x2000
local PAL_SHADOW_BASE = 0xFF9200
local PAL_SHADOW_SIZE = 0x20
local VRAM_ADDR_CURR = 0xFFEF08
local TRACE_PPU_PTR_RAW = 0xFFF0A4
local TRACE_PPU_PTR_RES = 0xFFF0A8
local TRACE_PPU_EVT_ARG0 = 0xFFF0B0
local TRACE_PPU_EVT_ARG1 = 0xFFF0B2
local TRACE_PPU_EVT_ARG2 = 0xFFF0B4
local TRACE_PPU_ROM_REC_HI = 0xFFF0B6
local TRACE_PPU_ROM_REC_LO = 0xFFF0B7
local TRACE_PPU_ROM_REC_CTRL = 0xFFF0B8
local TRACE_PPU_ROM_REC_DATA = 0xFFF0BA
local PLANE_A_MAP_BASE = 0xC000
local PLANE_A_MAP_END = 0xDFFF
local CHR_FOCUS_TILE_START = 0x00E1
local CHR_FOCUS_TILE_END = 0x00E3

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
local render_path = OUT_DIR .. "render_cells_" .. rom_label .. ".csv"
local render_file = assert(io.open(render_path, "w"))
local chr_dirty_path = OUT_DIR .. "chr_dirty_" .. rom_label .. ".csv"
local chr_dirty_file = assert(io.open(chr_dirty_path, "w"))
local chr_focus_path = OUT_DIR .. "chr_focus_" .. rom_label .. ".csv"
local chr_focus_file = assert(io.open(chr_focus_path, "w"))
local done_path = OUT_DIR .. "ppu_writes_" .. rom_label .. ".done"

write_row(out_file, {
    "frame", "kind", "addr", "value", "pc", "trace_last", "trace_seq",
    "ppu_buf_index", "ppu_buf_0", "ppu_buf_1", "ppu_buf_2", "ppu_buf_3", "ppu_buf_4", "ppu_buf_5",
    "screen_ready", "ram_script", "ram_subscript", "ppu_load_index",
    "d0", "d1", "d2", "d3", "d4", "d5", "d6", "d7", "a0", "a1", "a2", "a3", "a7", "sr"
})

write_row(render_file, {
    "frame", "pc", "value", "d0_plane_addr", "d4_nt_addr", "nt_page", "nt_row", "nt_col",
    "ppuctrl", "shadow_tile", "tile_base", "attr_addr", "attr_byte", "attr_shift",
    "palette_bits", "expected_plane_addr", "expected_tileword", "matches_renderer"
})

write_row(chr_dirty_file, {
    "frame", "tile_index", "changed_bytes", "first_byte", "last_byte"
})

write_row(chr_focus_file, {
    "frame", "pc", "trace_last", "trace_seq", "addr", "tile_index", "byte_in_tile",
    "value", "vram_addr_curr", "ppu_buf_index", "ppu_buf_0", "ppu_buf_1", "ppu_buf_2",
    "ppu_buf_3", "ppu_buf_4", "ppu_buf_5", "trace_ppu_ptr_raw", "trace_ppu_ptr_res",
    "trace_ppu_evt_arg0", "trace_ppu_evt_arg1", "trace_ppu_evt_arg2", "trace_ppu_rom_hi",
    "trace_ppu_rom_lo", "trace_ppu_rom_ctrl", "trace_ppu_rom_data", "legacy_ppu_ptr",
    "d0", "d1", "d2", "d3", "d4", "a0", "a1"
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
        hex(reg("M68K D4"), 8),
        hex(reg("M68K D5"), 8),
        hex(reg("M68K D6"), 8),
        hex(reg("M68K D7"), 8),
        hex(reg("M68K A0"), 8),
        hex(reg("M68K A1"), 8),
        hex(reg("M68K A2"), 8),
        hex(reg("M68K A3"), 8),
        hex(reg("M68K A7"), 8),
        hex(reg("M68K SR"), 4),
    })
end

local function log_render_cell(value)
    local pc = reg("M68K PC") or 0
    local d0 = reg("M68K D0") or 0
    local d4 = reg("M68K D4") or 0
    local d6 = reg("M68K D6") or 0
    local a0 = reg("M68K A0") or 0
    local plane_addr = d0 & 0xFFFF
    local nt_addr_full = d4 & 0xFFFF

    -- Match the nametable-cell renderer by register shape so the trace
    -- survives local code motion in vdp_layer.asm.
    if a0 ~= NT_SHADOW_BASE then
        return
    end
    if plane_addr < PLANE_A_MAP_BASE or plane_addr > PLANE_A_MAP_END then
        return
    end
    if nt_addr_full >= 0x1000 then
        return
    end

    local nt_addr = nt_addr_full & 0x0FFF
    local nt_page = (nt_addr >> 10) & 0x03
    local nt_local = nt_addr & 0x03FF
    local nt_col = nt_local & 0x001F
    local nt_row = (nt_local >> 5) & 0x001F
    local ppuctrl = memory.read_u8(PPUCTRL_ADDR) or 0
    local shadow_tile = memory.read_u8(NT_SHADOW_BASE + nt_addr) or 0
    local tile_base = shadow_tile
    if (ppuctrl & 0x10) ~= 0 then
        tile_base = tile_base + 0x0100
    end

    local attr_addr = (nt_page << 10) + 0x03C0 + ((nt_row >> 2) << 3) + (nt_col >> 2)
    local attr_byte = memory.read_u8(NT_SHADOW_BASE + attr_addr) or 0
    local attr_shift = ((nt_row & 0x0002) << 1) | (nt_col & 0x0002)
    local palette_bits = (attr_byte >> attr_shift) & 0x03
    local expected_tileword = tile_base | (palette_bits << 13)
    local expected_plane_addr = (PLANE_A_MAP_BASE + (((nt_row << 6) + nt_col + ((nt_page & 0x01) << 5)) << 1)) & 0xFFFF
    local match = ((d6 & 0xFFFF) == expected_tileword) and ((d0 & 0xFFFF) == expected_plane_addr)

    write_row(render_file, {
        tostring(emu.framecount()),
        hex(pc, 6),
        hex(value or (d6 & 0xFFFF), 4),
        hex(d0, 8),
        hex(d4, 8),
        hex(nt_page, 2),
        hex(nt_row, 2),
        hex(nt_col, 2),
        hex(ppuctrl, 2),
        hex(shadow_tile, 2),
        hex(tile_base, 4),
        hex(attr_addr, 4),
        hex(attr_byte, 2),
        tostring(attr_shift),
        hex(palette_bits, 2),
        hex(expected_plane_addr, 4),
        hex(expected_tileword, 4),
        match and "1" or "0",
    })
end

local function log_chr_focus_write(addr, value)
    local offset = addr - CHR_SHADOW_BASE
    if offset < 0 or offset >= CHR_SHADOW_SIZE then
        return
    end

    local tile = math.floor(offset / 16)
    if tile < CHR_FOCUS_TILE_START or tile > CHR_FOCUS_TILE_END then
        return
    end

    local legacy_ptr_lo = memory.read_u8(0xFF0000) or 0
    local legacy_ptr_hi = memory.read_u8(0xFF0001) or 0
    local legacy_ptr = ((legacy_ptr_hi << 8) | legacy_ptr_lo) & 0xFFFF

    write_row(chr_focus_file, {
        tostring(emu.framecount()),
        hex(reg("M68K PC"), 6),
        hex(memory.read_u16_be(0xFFF000), 4),
        hex(memory.read_u16_be(0xFFF002), 4),
        hex(addr, 6),
        hex(tile, 4),
        tostring(offset % 16),
        hex(value or memory.read_u8(addr), 2),
        hex(memory.read_u16_be(VRAM_ADDR_CURR), 4),
        hex(memory.read_u8(0xFF0301), 2),
        hex(memory.read_u8(0xFF0302), 2),
        hex(memory.read_u8(0xFF0303), 2),
        hex(memory.read_u8(0xFF0304), 2),
        hex(memory.read_u8(0xFF0305), 2),
        hex(memory.read_u8(0xFF0306), 2),
        hex(memory.read_u8(0xFF0307), 2),
        hex(memory.read_u16_be(TRACE_PPU_PTR_RAW), 4),
        hex(memory.read_u32_be(TRACE_PPU_PTR_RES), 8),
        hex(memory.read_u16_be(TRACE_PPU_EVT_ARG0), 4),
        hex(memory.read_u16_be(TRACE_PPU_EVT_ARG1), 4),
        hex(memory.read_u16_be(TRACE_PPU_EVT_ARG2), 4),
        hex(memory.read_u8(TRACE_PPU_ROM_REC_HI), 2),
        hex(memory.read_u8(TRACE_PPU_ROM_REC_LO), 2),
        hex(memory.read_u8(TRACE_PPU_ROM_REC_CTRL), 2),
        hex(memory.read_u32_be(TRACE_PPU_ROM_REC_DATA), 8),
        hex(legacy_ptr, 4),
        hex(reg("M68K D0"), 8),
        hex(reg("M68K D1"), 8),
        hex(reg("M68K D2"), 8),
        hex(reg("M68K D3"), 8),
        hex(reg("M68K D4"), 8),
        hex(reg("M68K A0"), 8),
        hex(reg("M68K A1"), 8),
    })
end

local function log_pal_shadow_write(addr, value)
    local offset = addr - PAL_SHADOW_BASE
    if offset < 0 or offset >= PAL_SHADOW_SIZE then
        return
    end

    log_write("pal_shadow", addr, value or memory.read_u8(addr))
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
    local word = value or memory.read_u16_be(0xC00000)
    log_write("vdp_data", 0xC00000, word)
    log_render_cell(word)
end, 0xC00000)

event.onmemorywrite(function(_, value)
    log_write("vdp_ctrl", 0xC00004, value or memory.read_u16_be(0xC00004))
end, 0xC00004)

for pal_addr = PAL_SHADOW_BASE, PAL_SHADOW_BASE + PAL_SHADOW_SIZE - 1 do
    event.onmemorywrite(function(_, value)
        log_pal_shadow_write(pal_addr, value)
    end, pal_addr)
end

for tile = CHR_FOCUS_TILE_START, CHR_FOCUS_TILE_END do
    local tile_base = CHR_SHADOW_BASE + (tile * 16)
    for byte_in_tile = 0, 15 do
        local addr = tile_base + byte_in_tile
        event.onmemorywrite(function(_, value)
            log_chr_focus_write(addr, value)
        end, addr)
    end
end

local prev_chr = {}

local function capture_chr_dirty(frame)
    local dirty = {}
    for offset = 0, CHR_SHADOW_SIZE - 1 do
        local value = memory.read_u8(CHR_SHADOW_BASE + offset) or 0
        if prev_chr[offset] == nil then
            prev_chr[offset] = value
        elseif prev_chr[offset] ~= value then
            local tile = math.floor(offset / 16)
            local byte_in_tile = offset % 16
            local entry = dirty[tile]
            if entry == nil then
                entry = {
                    count = 0,
                    first = byte_in_tile,
                    last = byte_in_tile,
                }
                dirty[tile] = entry
            end
            entry.count = entry.count + 1
            if byte_in_tile < entry.first then
                entry.first = byte_in_tile
            end
            if byte_in_tile > entry.last then
                entry.last = byte_in_tile
            end
            prev_chr[offset] = value
        end
    end

    for tile, entry in pairs(dirty) do
        write_row(chr_dirty_file, {
            tostring(frame),
            hex(tile, 4),
            tostring(entry.count),
            tostring(entry.first),
            tostring(entry.last),
        })
    end
end

while emu.framecount() <= FRAME_LIMIT do
    emu.frameadvance()
    capture_chr_dirty(emu.framecount())
end

out_file:close()
render_file:close()
chr_dirty_file:close()
chr_focus_file:close()
local done_file = io.open(done_path, "w")
if done_file then
    done_file:write("done\n")
    done_file:close()
end
client.exit()
