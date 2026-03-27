-- zelda_title_cram_swatch.lua
-- Force the steady title to a few flat CRAM words so we can see what BizHawk
-- actually renders for known Genesis color values.

local MAX_FRAMES = 360

local function get_rom_label()
    local path = gameinfo.getromname() or "unknown"
    local label = tostring(path):gsub("^.*[\\/]", "")
    label = label:gsub("%.[Mm][Dd]$", "")
    return label
end

local ROM_VERSION = get_rom_label()

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR  = OUT_DIR .. "screens\\"
local OUT_PATH  = OUT_DIR .. "title_cram_swatch_" .. ROM_VERSION .. ".txt"

local ADDR_READY     = 0xFF0011
local ADDR_SCRIPT    = 0xFF0012
local ADDR_SUB       = 0xFF0013
local ADDR_PPU_LOAD  = 0xFF0014
local current_word   = nil

local SWATCHES = {
    { name = "red",   word = 0x000E },
    { name = "green", word = 0x00E0 },
    { name = "blue",  word = 0x0E00 },
    { name = "white", word = 0x0EEE },
    { name = "mid",   word = 0x0888 },
}

local function ensure_dirs()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
    os.execute('if not exist "' .. SHOT_DIR .. '" mkdir "' .. SHOT_DIR .. '"')
end

ensure_dirs()
local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
end

local function read_u8(addr)
    memory.usememorydomain("M68K BUS")
    return memory.read_u8(addr) or 0
end

local function write_flat_cram(word)
    memory.usememorydomain("CRAM")
    for i = 0, 63 do
        memory.write_u16_be(i * 2, word)
    end
    memory.usememorydomain("M68K BUS")
end

if event and event.onframestart then
    event.onframestart(function()
        if current_word ~= nil then
            write_flat_cram(current_word)
        end
    end, "title_cram_swatch")
end

memory.usememorydomain("M68K BUS")
log("=== TITLE CRAM SWATCH " .. ROM_VERSION .. " ===")

local ready_hold = 0

for frame = 1, MAX_FRAMES do
    emu.frameadvance()

    local ready = read_u8(ADDR_READY)
    local script = read_u8(ADDR_SCRIPT)
    local sub = read_u8(ADDR_SUB)
    local ppu = read_u8(ADDR_PPU_LOAD)

    if script == 0 and sub == 0 and ready == 1 and ppu == 0 then
        ready_hold = ready_hold + 1
    else
        ready_hold = 0
    end

    if ready_hold >= 20 then
        log(string.format("sample_frame=%d ready=%d script=%d sub=%d ppu=%02X hold=%d", frame, ready, script, sub, ppu, ready_hold))
        for _, swatch in ipairs(SWATCHES) do
            current_word = swatch.word
            emu.frameadvance()
            emu.frameadvance()
            local shot = SHOT_DIR .. ROM_VERSION .. "_title_cram_swatch_" .. swatch.name .. ".png"
            client.screenshot(shot)
            log(string.format("swatch[%s]=%04X screenshot=%s", swatch.name, swatch.word, shot))
        end
        current_word = nil
        break
    end
end

log("=== TITLE CRAM SWATCH COMPLETE ===")
log_file:close()
client.exit()
