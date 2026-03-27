-- zelda_title_sprite_histogram.lua
-- Scan the steady title region and count visible sprite CRAM usage.

local MAX_FRAMES = 360

local function get_rom_label()
    local path = gameinfo.getromname() or "unknown"
    local label = tostring(path):gsub("^.*[\\/]", "")
    label = label:gsub("%.[Mm][Dd]$", "")
    return label
end

local ROM_VERSION = get_rom_label()

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH  = OUT_DIR .. "title_sprite_histogram_" .. ROM_VERSION .. ".txt"
local SHOT_PATH = OUT_DIR .. "screens\\title_sprite_histogram_" .. ROM_VERSION .. ".png"

local ADDR_READY      = 0xFF0011
local ADDR_SCRIPT     = 0xFF0012
local ADDR_SUB        = 0xFF0013
local ADDR_PPU_LOAD   = 0xFF0014
local PPU_PAL_SHADOW  = 0xFF9200
local SAT_BASE        = 0xBE00

local X0, Y0 = 24, 8
local X1, Y1 = 231, 183

local function ensure_dirs()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
    os.execute('if not exist "' .. OUT_DIR .. 'screens\\" mkdir "' .. OUT_DIR .. 'screens\\"')
end

ensure_dirs()
local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
end

local function hex(v, width)
    return string.format("%0" .. tostring(width or 2) .. "X", v or 0)
end

local function read_bus_u8(addr)
    memory.usememorydomain("M68K BUS")
    return memory.read_u8(addr) or 0
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

local function sat_entries()
    local entries = {}
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

            entries[#entries + 1] = {
                index = i,
                x = x_pos,
                y = y_pos,
                width_tiles = width_tiles,
                height_tiles = height_tiles,
                attr = attr,
                tile = bit.band(attr, 0x07FF),
                palette = bit.band(bit.rshift(attr, 13), 0x3),
                priority = bit.band(bit.rshift(attr, 15), 0x1),
                hflip = bit.band(bit.rshift(attr, 11), 0x1),
                vflip = bit.band(bit.rshift(attr, 12), 0x1),
            }
        end
    end)
    return entries
end

local function sprite_pixel(entries, x, y)
    local hit = nil
    with_domain("VRAM", function()
        for _, sprite in ipairs(entries) do
            local width_px = sprite.width_tiles * 8
            local height_px = sprite.height_tiles * 8
            if x >= sprite.x and x < (sprite.x + width_px) and y >= sprite.y and y < (sprite.y + height_px) then
                local local_x = x - sprite.x
                local local_y = y - sprite.y

                if sprite.hflip ~= 0 then
                    local_x = width_px - 1 - local_x
                end
                if sprite.vflip ~= 0 then
                    local_y = height_px - 1 - local_y
                end

                local tile_x = math.floor(local_x / 8)
                local tile_y = math.floor(local_y / 8)
                local tile_offset = (tile_y * sprite.width_tiles) + tile_x
                local tile_addr = ((sprite.tile + tile_offset) * 32) + ((local_y % 8) * 4)
                local packed = memory.read_u8(tile_addr + math.floor((local_x % 8) / 2)) or 0
                local color_index
                if (local_x % 2) == 0 then
                    color_index = bit.band(bit.rshift(packed, 4), 0x0F)
                else
                    color_index = bit.band(packed, 0x0F)
                end

                if color_index ~= 0 then
                    local cram_slot = (sprite.palette * 16) + color_index
                    local cram_word = 0
                    with_domain("CRAM", function()
                        cram_word = memory.read_u16_be(cram_slot * 2) or 0
                    end)

                    local shadow_index = nil
                    if color_index >= 4 and color_index <= 7 then
                        shadow_index = 0x10 + (sprite.palette * 4) + (color_index - 4)
                    end
                    local nes_index = nil
                    if shadow_index ~= nil and shadow_index >= 0x10 and shadow_index <= 0x1F then
                        nes_index = read_bus_u8(PPU_PAL_SHADOW + shadow_index)
                    end

                    hit = {
                        sprite_index = sprite.index,
                        palette = sprite.palette,
                        color_index = color_index,
                        cram_slot = cram_slot,
                        cram_word = cram_word,
                        shadow_index = shadow_index,
                        nes_index = nes_index,
                    }
                    return
                end
            end
        end
    end)
    return hit
end

local function bump(map, key)
    map[key] = (map[key] or 0) + 1
end

local function dump_top(label, map, formatter)
    local items = {}
    for key, count in pairs(map) do
        items[#items + 1] = { key = key, count = count }
    end
    table.sort(items, function(a, b)
        if a.count ~= b.count then
            return a.count > b.count
        end
        return tostring(a.key) < tostring(b.key)
    end)
    log(label .. ":")
    for i = 1, math.min(12, #items) do
        log(string.format("  %2d. %s count=%d", i, formatter(items[i].key), items[i].count))
    end
end

memory.usememorydomain("M68K BUS")
log("=== TITLE SPRITE HISTOGRAM " .. ROM_VERSION .. " ===")

local ready_hold = 0

for frame = 1, MAX_FRAMES do
    emu.frameadvance()

    local ready = read_bus_u8(ADDR_READY)
    local script = read_bus_u8(ADDR_SCRIPT)
    local sub = read_bus_u8(ADDR_SUB)
    local ppu = read_bus_u8(ADDR_PPU_LOAD)

    if script == 0 and sub == 0 and ready == 1 and ppu == 0 then
        ready_hold = ready_hold + 1
    else
        ready_hold = 0
    end

    if ready_hold >= 20 then
        local entries = sat_entries()
        local sprite_hits = 0
        local palette_counts = {}
        local color_counts = {}
        local cram_slot_counts = {}
        local cram_word_counts = {}
        local shadow_counts = {}
        local nes_counts = {}

        pcall(function() client.screenshot(SHOT_PATH) end)
        log(string.format("sample_frame=%d rect=(%d,%d)-(%d,%d)", frame, X0, Y0, X1, Y1))
        log("screenshot=" .. SHOT_PATH)

        for y = Y0, Y1 do
            for x = X0, X1 do
                local hit = sprite_pixel(entries, x, y)
                if hit ~= nil then
                    sprite_hits = sprite_hits + 1
                    bump(palette_counts, hit.palette)
                    bump(color_counts, hit.color_index)
                    bump(cram_slot_counts, hit.cram_slot)
                    bump(cram_word_counts, hit.cram_word)
                    if hit.shadow_index ~= nil then
                        bump(shadow_counts, hit.shadow_index)
                    end
                    if hit.nes_index ~= nil then
                        bump(nes_counts, hit.nes_index)
                    end
                end
            end
        end

        log("sprite_pixels=" .. tostring(sprite_hits))
        dump_top("top_sprite_palette_lines", palette_counts, function(key)
            return tostring(key)
        end)
        dump_top("top_sprite_color_indices", color_counts, function(key)
            return hex(key, 1)
        end)
        dump_top("top_sprite_cram_slots", cram_slot_counts, function(key)
            return hex(key, 2)
        end)
        dump_top("top_sprite_cram_words", cram_word_counts, function(key)
            return hex(key, 4)
        end)
        dump_top("top_sprite_shadow_indices", shadow_counts, function(key)
            return hex(key, 2)
        end)
        dump_top("top_sprite_nes_indices", nes_counts, function(key)
            return hex(key, 2)
        end)
        break
    end
end

log("=== TITLE SPRITE HISTOGRAM COMPLETE ===")
log_file:close()
client.exit()
