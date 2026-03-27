-- zelda_title_palette_probe.lua
-- Capture steady title palette state: PPU shadow, Genesis CRAM, and plane usage.
-- ROM_VERSION is patched by run_title_palette_probe.ps1.

local ROM_VERSION = "zelda_v659"
local MAX_FRAMES = 360

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH  = OUT_DIR .. "title_palette_probe_" .. ROM_VERSION .. ".txt"
local SHOT_PATH = OUT_DIR .. "screens\\title_palette_probe_" .. ROM_VERSION .. ".png"

local ADDR_READY     = 0xFF0011
local ADDR_SCRIPT    = 0xFF0012
local ADDR_SUB       = 0xFF0013
local ADDR_PPU_LOAD  = 0xFF0014
local ADDR_PHASE_GRP = 0xFF042C
local ADDR_PHASE_SUB = 0xFF042D
local PPU_PAL_SHADOW = 0xFF9200
local PLANE_A_MAP    = 0xC000

local TITLE_NES_TO_MD = {
    0x0CCC, 0x0E00, 0x0E00, 0x0E68, 0x0C0C, 0x060E, 0x006E, 0x00AE,
    0x0CCE, 0x00C0, 0x00A0, 0x00A0, 0x0CCE, 0x0000, 0x0000, 0x0444,
    0x0EEE, 0x0EC0, 0x0EEE, 0x0E8A, 0x0E0E, 0x0A0E, 0x0CCE, 0x08CE,
    0x00CE, 0x00E0, 0x0CE0, 0x08E0, 0x0EEE, 0x0000, 0x0000, 0x0000,
    0x0EEE, 0x0EE8, 0x0EEE, 0x0ECE, 0x0ECE, 0x0EAE, 0x0ACE, 0x0AEE,
    0x00EE, 0x08EE, 0x0AEA, 0x0EEA, 0x0EEE, 0x0CCC, 0x0000, 0x0000,
    0x0EEE, 0x0EEE, 0x0EEE, 0x0EEE, 0x0EEE, 0x0EEE, 0x0EEE, 0x0EEE,
    0x0CEE, 0x0CEE, 0x0EEE, 0x0EEE, 0x0EE0, 0x0EEE, 0x0000, 0x0000,
}

local function frontend_word(nes_index)
    return TITLE_NES_TO_MD[(nes_index or 0) + 1] or 0
end

memory.usememorydomain("M68K BUS")
os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
os.execute('if not exist "' .. OUT_DIR .. 'screens\\" mkdir "' .. OUT_DIR .. 'screens\\"')

local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
end

local function hex(v, width)
    return string.format("%0" .. tostring(width or 2) .. "X", v or 0)
end

local function read_u8(addr)
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

local function read_shadow_palette()
    local values = {}
    for i = 0, 31 do
        values[#values + 1] = read_u8(PPU_PAL_SHADOW + i)
    end
    return values
end

local function expected_frontend_words(shadow)
    local cram = {}
    for i = 0, 63 do
        cram[i] = nil
    end

    for line = 0, 3 do
        local base = line * 16
        cram[base + 0] = frontend_word(shadow[1] or 0)
        cram[base + 1] = frontend_word(shadow[(line * 4) + 2] or 0)
        cram[base + 2] = frontend_word(shadow[(line * 4) + 3] or 0)
        cram[base + 3] = frontend_word(shadow[(line * 4) + 4] or 0)

        cram[base + 4] = frontend_word(shadow[1] or 0)
        cram[base + 5] = frontend_word(shadow[16 + (line * 4) + 2] or 0)
        cram[base + 6] = frontend_word(shadow[16 + (line * 4) + 3] or 0)
        cram[base + 7] = frontend_word(shadow[16 + (line * 4) + 4] or 0)
    end

    local backdrop = frontend_word(shadow[1] or 0)
    cram[0x0F] = backdrop
    return cram
end

local function dump_shadow_palette()
    local shadow = read_shadow_palette()
    log("shadow[00-0F]=" .. table.concat((function()
        local parts = {}
        for i = 1, 16 do
            parts[#parts + 1] = hex(shadow[i], 2)
        end
        return parts
    end)(), " "))
    log("shadow[10-1F]=" .. table.concat((function()
        local parts = {}
        for i = 17, 32 do
            parts[#parts + 1] = hex(shadow[i], 2)
        end
        return parts
    end)(), " "))
    return shadow
end

local function dump_cram()
    with_domain("CRAM", function()
        for first = 0, 63, 16 do
            local parts = {}
            for i = 0, 15 do
                parts[#parts + 1] = hex(memory.read_u16_be((first + i) * 2) or 0, 4)
            end
            log(string.format("cram[%02X-%02X]=%s", first, first + 15, table.concat(parts, " ")))
        end
    end)
end

local function dump_expected(shadow)
    local expected = expected_frontend_words(shadow)
    for first = 0, 63, 16 do
        local parts = {}
        for i = 0, 15 do
            local word = expected[first + i]
            parts[#parts + 1] = word and hex(word, 4) or "----"
        end
        log(string.format("expect[%02X-%02X]=%s", first, first + 15, table.concat(parts, " ")))
    end
end

local function dump_plane_usage(first_row, last_row)
    with_domain("VRAM", function()
        for row = first_row, last_row do
            local counts = {0, 0, 0, 0}
            local samples = {}
            local parts = {}
            local base = PLANE_A_MAP + (row * 64 * 2)
            for col = 0, 31 do
                local cell = memory.read_u16_be(base + (col * 2)) or 0
                local pal = (cell >> 13) & 0x3
                counts[pal + 1] = counts[pal + 1] + 1
                if col < 16 then
                    parts[#parts + 1] = hex(cell, 4)
                end
                if samples[pal + 1] == nil then
                    samples[pal + 1] = cell
                end
            end
            log(string.format(
                "plane_row=%02d pal_counts=[%d,%d,%d,%d] sample=[%s,%s,%s,%s]",
                row,
                counts[1], counts[2], counts[3], counts[4],
                samples[1] and hex(samples[1], 4) or "----",
                samples[2] and hex(samples[2], 4) or "----",
                samples[3] and hex(samples[3], 4) or "----",
                samples[4] and hex(samples[4], 4) or "----"
            ))
            log(string.format("plane_cells[%02d]=%s", row, table.concat(parts, " ")))
        end
    end)
end

log("=== TITLE PALETTE PROBE " .. ROM_VERSION .. " ===")

local ready_hold = 0
local dumped = false

for frame = 1, MAX_FRAMES do
    emu.frameadvance()

    local ready = read_u8(ADDR_READY)
    local script = read_u8(ADDR_SCRIPT)
    local sub = read_u8(ADDR_SUB)
    local ppu = read_u8(ADDR_PPU_LOAD)
    local phase_group = read_u8(ADDR_PHASE_GRP)
    local phase_sub = read_u8(ADDR_PHASE_SUB)

    if script == 0 and sub == 0 and ready == 1 and ppu == 0 then
        ready_hold = ready_hold + 1
    else
        ready_hold = 0
    end

    if not dumped and ready_hold >= 20 then
        dumped = true
        log(string.format(
            "sample_frame=%d ready=%d script=%d sub=%d ppu=%02X phase_group=%02X phase_sub=%02X hold=%d",
            frame, ready, script, sub, ppu, phase_group, phase_sub, ready_hold
        ))
        pcall(function() client.screenshot(SHOT_PATH) end)
        log("screenshot=" .. SHOT_PATH)
        local shadow = dump_shadow_palette()
        dump_expected(shadow)
        dump_cram()
        dump_plane_usage(4, 15)
        break
    end
end

log("=== TITLE PALETTE PROBE COMPLETE ===")
log_file:close()
client.exit()
