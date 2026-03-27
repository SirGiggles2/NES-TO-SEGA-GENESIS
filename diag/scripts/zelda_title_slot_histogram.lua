-- zelda_title_slot_histogram.lua
-- Count live Plane A title pixel usage by Genesis CRAM slot and source NES index.

local MAX_FRAMES = 360

local function get_rom_label()
    local path = gameinfo.getromname() or "unknown"
    local label = tostring(path):gsub("^.*[\\/]", "")
    label = label:gsub("%.[Mm][Dd]$", "")
    return label
end

local ROM_VERSION = get_rom_label()

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH  = OUT_DIR .. "title_slot_histogram_" .. ROM_VERSION .. ".txt"
local SHOT_PATH = OUT_DIR .. "screens\\title_slot_histogram_" .. ROM_VERSION .. ".png"

local ADDR_READY     = 0xFF0011
local ADDR_SCRIPT    = 0xFF0012
local ADDR_SUB       = 0xFF0013
local ADDR_PPU_LOAD  = 0xFF0014
local PPU_PAL_SHADOW = 0xFF9200
local PLANE_A_MAP    = 0xC000

local SCAN_X0 = 24
local SCAN_Y0 = 8
local SCAN_X1 = 231
local SCAN_Y1 = 183

os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
os.execute('if not exist "' .. OUT_DIR .. 'screens\\" mkdir "' .. OUT_DIR .. 'screens\\"')

memory.usememorydomain("M68K BUS")

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
        return nil
    end
    local result = fn()
    memory.usememorydomain("M68K BUS")
    return result
end

local function read_shadow_palette()
    local values = {}
    for i = 0, 31 do
        values[i] = memory.read_u8(PPU_PAL_SHADOW + i) or 0
    end
    return values
end

local function read_cram_word(slot)
    return with_domain("CRAM", function()
        return memory.read_u16_be(slot * 2) or 0
    end) or 0
end

local function sample_plane_a(x, y)
    return with_domain("VRAM", function()
        local cell_row = math.floor(y / 8)
        local cell_col = math.floor(x / 8)
        local cell_addr = PLANE_A_MAP + (cell_row * 64 * 2) + (cell_col * 2)
        local cell = memory.read_u16_be(cell_addr) or 0
        local tile_index = bit.band(cell, 0x07FF)
        local hflip = bit.band(bit.rshift(cell, 11), 1)
        local vflip = bit.band(bit.rshift(cell, 12), 1)
        local palette = bit.band(bit.rshift(cell, 13), 0x3)

        local px = x % 8
        local py = y % 8
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

        return {
            cell = cell,
            tile_index = tile_index,
            palette = palette,
            color_index = color_index,
        }
    end)
end

local function nes_index_from_bg(shadow, palette, color_index)
    if color_index == 0x0F then
        return shadow[0] or 0
    end
    if color_index >= 1 and color_index <= 3 then
        return shadow[(palette * 4) + color_index] or 0
    end
    return nil
end

local function bump(map, key)
    map[key] = (map[key] or 0) + 1
end

local function sorted_pairs(map)
    local items = {}
    for key, count in pairs(map) do
        items[#items + 1] = { key = key, count = count }
    end
    table.sort(items, function(a, b)
        if a.count ~= b.count then
            return a.count > b.count
        end
        return a.key < b.key
    end)
    return items
end

local function dump_top(label, map, formatter, limit)
    limit = limit or 16
    local items = sorted_pairs(map)
    log(label .. ":")
    for i = 1, math.min(limit, #items) do
        local item = items[i]
        log(string.format("  %2d. %s count=%d", i, formatter(item.key), item.count))
    end
end

log("=== TITLE SLOT HISTOGRAM " .. ROM_VERSION .. " ===")

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
        local shadow = read_shadow_palette()
        local slot_counts = {}
        local word_counts = {}
        local nes_counts = {}
        local palette_counts = {}
        local color_counts = {}
        local total = 0

        for y = SCAN_Y0, SCAN_Y1 do
            for x = SCAN_X0, SCAN_X1 do
                local sample = sample_plane_a(x, y)
                if sample then
                    total = total + 1
                    bump(palette_counts, sample.palette)
                    bump(color_counts, sample.color_index)

                    local slot = (sample.palette * 16) + sample.color_index
                    bump(slot_counts, slot)
                    bump(word_counts, read_cram_word(slot))

                    local nes_index = nes_index_from_bg(shadow, sample.palette, sample.color_index)
                    if nes_index ~= nil then
                        bump(nes_counts, nes_index)
                    end
                end
            end
        end

        pcall(function() client.screenshot(SHOT_PATH) end)
        log(string.format(
            "sample_frame=%d rect=(%d,%d)-(%d,%d) pixels=%d",
            frame, SCAN_X0, SCAN_Y0, SCAN_X1, SCAN_Y1, total
        ))
        log("screenshot=" .. SHOT_PATH)

        dump_top("top_palette_lines", palette_counts, function(k) return tostring(k) end, 4)
        dump_top("top_color_indices", color_counts, function(k) return hex(k, 1) end, 8)
        dump_top("top_cram_slots", slot_counts, function(k) return hex(k, 2) .. " word=" .. hex(read_cram_word(k), 4) end, 12)
        dump_top("top_cram_words", word_counts, function(k) return hex(k, 4) end, 12)
        dump_top("top_nes_indices", nes_counts, function(k) return hex(k, 2) end, 12)
        break
    end
end

log("=== TITLE SLOT HISTOGRAM COMPLETE ===")
log_file:close()
client.exit()
