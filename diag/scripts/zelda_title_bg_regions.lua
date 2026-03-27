-- zelda_title_bg_regions.lua
-- Map hot title background NES palette indices to on-screen regions.

local MAX_FRAMES = 360

local function get_rom_label()
    local path = gameinfo.getromname() or "unknown"
    local label = tostring(path):gsub("^.*[\\/]", "")
    label = label:gsub("%.[Mm][Dd]$", "")
    return label
end

local ROM_VERSION = get_rom_label()

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH  = OUT_DIR .. "title_bg_regions_" .. ROM_VERSION .. ".txt"
local SHOT_PATH = OUT_DIR .. "screens\\title_bg_regions_" .. ROM_VERSION .. ".png"

local ADDR_READY      = 0xFF0011
local ADDR_SCRIPT     = 0xFF0012
local ADDR_SUB        = 0xFF0013
local ADDR_PPU_LOAD   = 0xFF0014
local PPU_PAL_SHADOW  = 0xFF9200
local PLANE_A_MAP     = 0xC000

local X0, Y0 = 24, 8
local X1, Y1 = 231, 183
local HOT = {
    [0x08] = true,
    [0x1A] = true,
    [0x22] = true,
    [0x28] = true,
    [0x30] = true,
    [0x36] = true,
    [0x37] = true,
    [0x3B] = true,
}

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

local function bg_pixel_nes_index(x, y)
    local result = nil
    with_domain("VRAM", function()
        local cell_row = math.floor(y / 8)
        local cell_col = math.floor(x / 8)
        local cell_addr = PLANE_A_MAP + (cell_row * 64 * 2) + (cell_col * 2)
        local cell = memory.read_u16_be(cell_addr) or 0
        local tile_index = bit.band(cell, 0x07FF)
        local palette = bit.band(bit.rshift(cell, 13), 0x3)
        local hflip = bit.band(bit.rshift(cell, 11), 0x1)
        local vflip = bit.band(bit.rshift(cell, 12), 0x1)

        local px = x % 8
        local py = y % 8
        if hflip ~= 0 then px = 7 - px end
        if vflip ~= 0 then py = 7 - py end

        local tile_addr = (tile_index * 32) + (py * 4)
        local packed = memory.read_u8(tile_addr + math.floor(px / 2)) or 0
        local color_index
        if (px % 2) == 0 then
            color_index = bit.band(bit.rshift(packed, 4), 0x0F)
        else
            color_index = bit.band(packed, 0x0F)
        end

        local shadow_index = nil
        if color_index == 0x0F then
            shadow_index = 0
        elseif color_index >= 1 and color_index <= 3 then
            shadow_index = (palette * 4) + color_index
        end

        if shadow_index ~= nil then
            result = read_bus_u8(PPU_PAL_SHADOW + shadow_index)
        end
    end)
    return result
end

memory.usememorydomain("M68K BUS")
log("=== TITLE BG REGIONS " .. ROM_VERSION .. " ===")

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
        local regions = {}
        pcall(function() client.screenshot(SHOT_PATH) end)
        log("sample_frame=" .. tostring(frame))
        log("screenshot=" .. SHOT_PATH)

        for y = Y0, Y1 do
            for x = X0, X1 do
                local nes_index = bg_pixel_nes_index(x, y)
                if nes_index ~= nil and HOT[nes_index] then
                    local box = regions[nes_index]
                    if box == nil then
                        box = {
                            count = 0,
                            min_x = x, max_x = x,
                            min_y = y, max_y = y,
                            coords = {},
                        }
                        regions[nes_index] = box
                    end
                    box.count = box.count + 1
                    if x < box.min_x then box.min_x = x end
                    if x > box.max_x then box.max_x = x end
                    if y < box.min_y then box.min_y = y end
                    if y > box.max_y then box.max_y = y end
                    if #box.coords < 8 then
                        box.coords[#box.coords + 1] = string.format("(%d,%d)", x, y)
                    end
                end
            end
        end

        local keys = {}
        for key in pairs(regions) do
            keys[#keys + 1] = key
        end
        table.sort(keys)
        for _, key in ipairs(keys) do
            local box = regions[key]
            log(string.format(
                "nes[%02X] count=%d box=(%d,%d)-(%d,%d) samples=%s",
                key, box.count, box.min_x, box.min_y, box.max_x, box.max_y, table.concat(box.coords, " ")
            ))
        end
        break
    end
end

log("=== TITLE BG REGIONS COMPLETE ===")
log_file:close()
client.exit()
