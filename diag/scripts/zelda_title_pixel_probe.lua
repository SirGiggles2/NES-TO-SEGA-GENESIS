-- zelda_title_pixel_probe.lua
-- Sample a few title-screen pixels and report which VRAM/CRAM entries they use.

local MAX_FRAMES = 360

local function get_rom_label()
    local path = gameinfo.getromname() or "unknown"
    local label = tostring(path):gsub("^.*[\\/]", "")
    label = label:gsub("%.[Mm][Dd]$", "")
    return label
end

local ROM_VERSION = get_rom_label()

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH  = OUT_DIR .. "title_pixel_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY     = 0xFF0011
local ADDR_SCRIPT    = 0xFF0012
local ADDR_SUB       = 0xFF0013
local ADDR_PPU_LOAD  = 0xFF0014
local PLANE_A_MAP    = 0xC000
local PLANE_B_MAP    = 0xE000
local WINDOW_MAP     = 0xB000
local SAT_BASE       = 0xBE00

local SAMPLES = {
    { name = "plaque_bg",  x = 120, y = 20 },
    { name = "logo_dark",  x = 110, y = 60 },
    { name = "logo_fill",  x = 128, y = 78 },
    { name = "sword",      x = 182, y = 82 },
    { name = "vine",       x = 56,  y = 31 },
    { name = "rock",       x = 20,  y = 170 },
}

os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')

local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
end

local function hex(v, width)
    return string.format("%0" .. tostring(width or 2) .. "X", v or 0)
end

local function with_domain(domain, fn)
    local ok = pcall(memory.usememorydomain, domain)
    if not ok then
        log("missing_domain=" .. domain)
        return
    end
    fn()
    memory.usememorydomain("M68K BUS")
end

local function read_plane_sample(map_base, sample, row_cells)
    row_cells = row_cells or 64
    local result = nil
    with_domain("VRAM", function()
        local cell_row = math.floor(sample.y / 8)
        local cell_col = math.floor(sample.x / 8)
        local cell_addr = map_base + (cell_row * row_cells * 2) + (cell_col * 2)
        local cell = memory.read_u16_be(cell_addr) or 0
        local tile_index = bit.band(cell, 0x07FF)
        local hflip = bit.band(bit.rshift(cell, 11), 1)
        local vflip = bit.band(bit.rshift(cell, 12), 1)
        local palette = bit.band(bit.rshift(cell, 13), 0x3)

        local px = sample.x % 8
        local py = sample.y % 8
        if hflip ~= 0 then
            px = 7 - px
        end
        if vflip ~= 0 then
            py = 7 - py
        end

        local tile_addr = (tile_index * 32) + (py * 4)
        local packed = memory.read_u8(tile_addr + math.floor(px / 2)) or 0
        local color_index
        if (px % 2) == 0 then
            color_index = bit.band(bit.rshift(packed, 4), 0x0F)
        else
            color_index = bit.band(packed, 0x0F)
        end

        local cram_slot = (palette * 16) + color_index
        local cram_word = 0
        with_domain("CRAM", function()
            cram_word = memory.read_u16_be(cram_slot * 2) or 0
        end)
        result = {
            cell_row = cell_row,
            cell_col = cell_col,
            cell = cell,
            tile_index = tile_index,
            palette = palette,
            hflip = hflip,
            vflip = vflip,
            px = px,
            py = py,
            packed = packed,
            color_index = color_index,
            cram_slot = cram_slot,
            cram_word = cram_word,
        }
    end)
    return result
end

local function read_sprite_sample(sample)
    local result = nil
    with_domain("VRAM", function()
        for i = 0, 63 do
            local base = SAT_BASE + (i * 8)
            local y_word = memory.read_u16_be(base + 0) or 0
            local size_link = memory.read_u16_be(base + 2) or 0
            local attr = memory.read_u16_be(base + 4) or 0
            local x_word = memory.read_u16_be(base + 6) or 0

            local y_pos = bit.band(y_word, 0x01FF) - 128
            local x_pos = bit.band(x_word, 0x01FF) - 128
            local width_tiles = bit.band(bit.rshift(size_link, 2), 0x3) + 1
            local height_tiles = bit.band(size_link, 0x3) + 1
            local width_px = width_tiles * 8
            local height_px = height_tiles * 8

            if sample.x >= x_pos and sample.x < (x_pos + width_px) and sample.y >= y_pos and sample.y < (y_pos + height_px) then
                local tile_index = bit.band(attr, 0x07FF)
                local hflip = bit.band(bit.rshift(attr, 11), 1)
                local vflip = bit.band(bit.rshift(attr, 12), 1)
                local palette = bit.band(bit.rshift(attr, 13), 0x3)
                local priority = bit.band(bit.rshift(attr, 15), 1)

                local local_x = sample.x - x_pos
                local local_y = sample.y - y_pos

                if hflip ~= 0 then
                    local_x = width_px - 1 - local_x
                end
                if vflip ~= 0 then
                    local_y = height_px - 1 - local_y
                end

                local tile_x = math.floor(local_x / 8)
                local tile_y = math.floor(local_y / 8)
                local tile_offset = (tile_y * width_tiles) + tile_x
                local tile_addr = ((tile_index + tile_offset) * 32) + ((local_y % 8) * 4)
                local packed = memory.read_u8(tile_addr + math.floor((local_x % 8) / 2)) or 0
                local color_index
                if (local_x % 2) == 0 then
                    color_index = bit.band(bit.rshift(packed, 4), 0x0F)
                else
                    color_index = bit.band(packed, 0x0F)
                end

                if color_index ~= 0 then
                    local cram_slot = (palette * 16) + color_index
                    local cram_word = 0
                    with_domain("CRAM", function()
                        cram_word = memory.read_u16_be(cram_slot * 2) or 0
                    end)
                    result = {
                        index = i,
                        y_pos = y_pos,
                        x_pos = x_pos,
                        size = size_link,
                        attr = attr,
                        tile_index = tile_index,
                        palette = palette,
                        priority = priority,
                        hflip = hflip,
                        vflip = vflip,
                        local_x = local_x,
                        local_y = local_y,
                        packed = packed,
                        color_index = color_index,
                        cram_slot = cram_slot,
                        cram_word = cram_word,
                    }
                    return
                end
            end
        end
    end)
    return result
end

local function sample_pixel(sample)
    local plane_a = read_plane_sample(PLANE_A_MAP, sample, 64)
    local plane_b = read_plane_sample(PLANE_B_MAP, sample, 64)
    local window = read_plane_sample(WINDOW_MAP, sample, 32)
    local sprite = read_sprite_sample(sample)

    local visible = "backdrop"
    if sprite and sprite.priority ~= 0 then
        visible = "sprite"
    elseif window and window.color_index ~= 0 then
        visible = "window"
    elseif plane_a and plane_a.color_index ~= 0 then
        visible = "plane_a"
    elseif sprite then
        visible = "sprite"
    elseif plane_b and plane_b.color_index ~= 0 then
        visible = "plane_b"
    end

    log(string.format("%s xy=(%d,%d) visible=%s", sample.name, sample.x, sample.y, visible))

    if plane_a then
        log(string.format(
            "  plane_a cell_rc=(%d,%d) cell=%s tile=%03X pal=%d hflip=%d vflip=%d px=%d py=%d packed=%s color=%X cram_slot=%02X cram=%s",
            plane_a.cell_row,
            plane_a.cell_col,
            hex(plane_a.cell, 4),
            plane_a.tile_index,
            plane_a.palette,
            plane_a.hflip,
            plane_a.vflip,
            plane_a.px,
            plane_a.py,
            hex(plane_a.packed, 2),
            plane_a.color_index,
            plane_a.cram_slot,
            hex(plane_a.cram_word, 4)
        ))
    end

    if plane_b then
        log(string.format(
            "  plane_b cell_rc=(%d,%d) cell=%s tile=%03X pal=%d hflip=%d vflip=%d px=%d py=%d packed=%s color=%X cram_slot=%02X cram=%s",
            plane_b.cell_row,
            plane_b.cell_col,
            hex(plane_b.cell, 4),
            plane_b.tile_index,
            plane_b.palette,
            plane_b.hflip,
            plane_b.vflip,
            plane_b.px,
            plane_b.py,
            hex(plane_b.packed, 2),
            plane_b.color_index,
            plane_b.cram_slot,
            hex(plane_b.cram_word, 4)
        ))
    end

    if window then
        log(string.format(
            "  window  cell_rc=(%d,%d) cell=%s tile=%03X pal=%d hflip=%d vflip=%d px=%d py=%d packed=%s color=%X cram_slot=%02X cram=%s",
            window.cell_row,
            window.cell_col,
            hex(window.cell, 4),
            window.tile_index,
            window.palette,
            window.hflip,
            window.vflip,
            window.px,
            window.py,
            hex(window.packed, 2),
            window.color_index,
            window.cram_slot,
            hex(window.cram_word, 4)
        ))
    end

    if sprite then
        log(string.format(
            "  sprite idx=%02d xy=(%d,%d) size=%s attr=%s tile=%03X pal=%d pri=%d hflip=%d vflip=%d lx=%d ly=%d packed=%s color=%X cram_slot=%02X cram=%s",
            sprite.index,
            sprite.x_pos,
            sprite.y_pos,
            hex(sprite.size, 4),
            hex(sprite.attr, 4),
            sprite.tile_index,
            sprite.palette,
            sprite.priority,
            sprite.hflip,
            sprite.vflip,
            sprite.local_x,
            sprite.local_y,
            hex(sprite.packed, 2),
            sprite.color_index,
            sprite.cram_slot,
            hex(sprite.cram_word, 4)
        ))
    end
end

memory.usememorydomain("M68K BUS")
log("=== TITLE PIXEL PROBE " .. ROM_VERSION .. " ===")

local ready_hold = 0

for frame = 1, MAX_FRAMES do
    emu.frameadvance()

    local ready = memory.read_u8(ADDR_READY) or 0
    local script = memory.read_u8(ADDR_SCRIPT) or 0
    local sub = memory.read_u8(ADDR_SUB) or 0
    local ppu = memory.read_u8(ADDR_PPU_LOAD) or 0

    if script == 0 and sub == 0 and ready == 1 and ppu == 0 then
        ready_hold = ready_hold + 1
    else
        ready_hold = 0
    end

    if ready_hold >= 20 then
        log(string.format("sample_frame=%d ready=%d script=%d sub=%d ppu=%02X hold=%d", frame, ready, script, sub, ppu, ready_hold))
        for _, sample in ipairs(SAMPLES) do
            sample_pixel(sample)
        end
        break
    end
end

log("=== TITLE PIXEL PROBE COMPLETE ===")
log_file:close()
client.exit()
