-- genesis_pixel_probe.lua
-- Sample Plane A / CRAM usage for a few on-screen Genesis pixels.

local OUT_PATH  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\genesis_pixel_probe.txt"
local SHOT_PATH = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\screens\\genesis_pixel_probe.png"
local SAMPLE_FRAME = 300
local PLANE_A_MAP = 0xC000
local PLANE_B_MAP = 0xE000

local SAMPLES = {
    { name = "sky_bg",       x = 16,  y = 16  },
    { name = "title_orange", x = 54,  y = 44  },
    { name = "title_white",  x = 84,  y = 74  },
    { name = "menu_text",    x = 126, y = 154 },
    { name = "hill_green",   x = 29,  y = 191 },
    { name = "bush_green",   x = 198, y = 186 },
}

local function log(handle, text)
    handle:write(text)
    handle:write("\n")
    handle:flush()
end

local function hex(v, width)
    return string.format("%0" .. tostring(width or 2) .. "X", v or 0)
end

local function with_domain(domain, fn)
    local ok = pcall(memory.usememorydomain, domain)
    if not ok then
        return false
    end
    fn()
    memory.usememorydomain("M68K BUS")
    return true
end

local function read_plane_sample(map_base, sample)
    local result = nil
    with_domain("VRAM", function()
        local cell_row = math.floor(sample.y / 8)
        local cell_col = math.floor(sample.x / 8)
        local cell_addr = map_base + (cell_row * 64 * 2) + (cell_col * 2)
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

local function sample_pixel(handle, sample)
    local plane_a = read_plane_sample(PLANE_A_MAP, sample)
    local plane_b = read_plane_sample(PLANE_B_MAP, sample)

    local visible = "backdrop"
    if plane_a and plane_a.color_index ~= 0 then
        visible = "plane_a"
    elseif plane_b and plane_b.color_index ~= 0 then
        visible = "plane_b"
    end

    log(handle, string.format("%s xy=(%d,%d) visible=%s", sample.name, sample.x, sample.y, visible))

    if plane_a then
        log(handle, string.format(
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
        log(handle, string.format(
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
end

memory.usememorydomain("M68K BUS")

local out = assert(io.open(OUT_PATH, "w"))
log(out, "=== GENESIS PIXEL PROBE ===")
log(out, "rom=" .. tostring(gameinfo.getromname() or "unknown"))
log(out, "sample_frame=" .. tostring(SAMPLE_FRAME))

for frame = 1, SAMPLE_FRAME do
    emu.frameadvance()
end

pcall(function() client.screenshot(SHOT_PATH) end)
log(out, "screenshot=" .. SHOT_PATH)

for _, sample in ipairs(SAMPLES) do
    sample_pixel(out, sample)
end

log(out, "=== GENESIS PIXEL PROBE COMPLETE ===")
out:close()
client.exit()
