-- zelda_title_vsram_probe.lua
-- Probe title-time scroll/mask state and capture title screenshots.
-- ROM_VERSION is patched by run_title_vsram_probe.ps1.

local ROM_VERSION = "zelda_v650"
local MAX_FRAMES = 320

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR = OUT_DIR .. "screens\\"
local OUT_PATH = OUT_DIR .. "title_vsram_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY      = 0xFF0011
local ADDR_SCRIPT     = 0xFF0012
local ADDR_SUBSCRIPT  = 0xFF0013
local ADDR_SCROLL_Y   = 0xFF00FC
local ADDR_PPUSCROLLY = 0xFFEF06
local NT_SHADOW_BASE  = 0xFF8200
local CHR_SHADOW_BASE = 0xFFC000

memory.usememorydomain("M68K BUS")
os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
os.execute('if not exist "' .. SHOT_DIR .. '" mkdir "' .. SHOT_DIR .. '"')

local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
end

local function read_vsram0()
    local ok, value = pcall(function()
        return memory.read_u16_be(0, "VSRAM")
    end)
    if ok then return value end
    return -1
end

local function sample(frame)
    local script = memory.read_u8(ADDR_SCRIPT)
    local sub = memory.read_u8(ADDR_SUBSCRIPT)
    local ready = memory.read_u8(ADDR_READY)
    local ram_scroll_y = memory.read_u8(ADDR_SCROLL_Y)
    local ppu_scroll_y = memory.read_u8(ADDR_PPUSCROLLY)
    local vsram0 = read_vsram0()
    log(string.format(
        "frame=%d script=%d sub=%d ready=%d ram_scroll_Y=%d ppuscroll_y=%d vsram0=%d",
        frame, script, sub, ready, ram_scroll_y, ppu_scroll_y, vsram0
    ))
end

local function log_nt_rows(frame, row_start, row_end)
    for row = row_start, row_end do
        local non_backdrop = 0
        local first_col = -1
        for col = 0, 31 do
            local idx = row * 32 + col
            local tile = memory.read_u8(NT_SHADOW_BASE + idx)
            if tile ~= 0x24 then
                non_backdrop = non_backdrop + 1
                if first_col < 0 then first_col = col end
            end
        end
        log(string.format("nt frame=%d row=%d non24=%d first_col=%d", frame, row, non_backdrop, first_col))
    end
end

local function dump_row_tiles(frame, row)
    local parts = {}
    for col = 0, 31 do
        local idx = row * 32 + col
        local tile = memory.read_u8(NT_SHADOW_BASE + idx)
        parts[#parts + 1] = string.format("%02X", tile)
    end
    log(string.format("tiles frame=%d row=%d %s", frame, row, table.concat(parts, " ")))
end

local function log_chr_tile_health(frame, tile_start, tile_end)
    for tile = tile_start, tile_end do
        local base = CHR_SHADOW_BASE + tile * 16
        local non_zero = 0
        for i = 0, 15 do
            local b = memory.read_u8(base + i)
            if b ~= 0 then non_zero = non_zero + 1 end
        end
        log(string.format("chr frame=%d tile=%02X nonzero=%d", frame, tile, non_zero))
    end
end

local function dump_chr_tile_bytes(frame, tile)
    local base = CHR_SHADOW_BASE + tile * 16
    local parts = {}
    for i = 0, 15 do
        parts[#parts + 1] = string.format("%02X", memory.read_u8(base + i))
    end
    log(string.format("chrbytes frame=%d tile=%02X %s", frame, tile, table.concat(parts, " ")))
end

local function dump_attr_table(frame)
    for i = 0, 63 do
        local v = memory.read_u8(NT_SHADOW_BASE + 0x03C0 + i)
        log(string.format("attr frame=%d idx=%02X val=%02X", frame, i, v))
    end
end

local function shot(tag, frame)
    local path = SHOT_DIR .. ROM_VERSION .. "_title_vsram_" .. tag .. "_f" .. tostring(frame) .. ".png"
    client.screenshot(path)
    log("screenshot=" .. path)
end

log("=== TITLE VSRAM PROBE " .. ROM_VERSION .. " ===")

for frame = 1, MAX_FRAMES do
    emu.frameadvance()

    if frame == 84 or frame == 120 or frame == 160 or frame == 180 or frame == 200 or frame == 240 or frame == 280 then
        sample(frame)
    end

    if frame == 200 then
        log_nt_rows(frame, 0, 15)
        dump_row_tiles(frame, 5)
        dump_row_tiles(frame, 6)
        dump_row_tiles(frame, 7)
        dump_row_tiles(frame, 8)
        dump_row_tiles(frame, 9)
        dump_row_tiles(frame, 10)
        log_chr_tile_health(frame, 0x70, 0x78)
        log_chr_tile_health(frame, 0x9D, 0xA5)
        dump_chr_tile_bytes(frame, 0x71)
        dump_chr_tile_bytes(frame, 0x72)
        dump_chr_tile_bytes(frame, 0x7C)
        dump_chr_tile_bytes(frame, 0x7D)
        dump_chr_tile_bytes(frame, 0x9D)
        dump_chr_tile_bytes(frame, 0x9E)
        dump_attr_table(frame)
    end

    if frame == 160 then shot("early", frame) end
    if frame == 180 then shot("mid", frame) end
    if frame == 200 then shot("late", frame) end
end

log("=== TITLE VSRAM PROBE COMPLETE ===")
log_file:close()
client.exit()