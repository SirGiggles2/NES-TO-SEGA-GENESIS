-- zelda_title_cram_override.lua
-- Force the title CRAM to a flat bright value to separate palette bugs from
-- final display-state bugs.

local ROM_VERSION = "zelda_v676"
local MAX_FRAMES = 360

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR  = OUT_DIR .. "screens\\"
local OUT_PATH  = OUT_DIR .. "title_cram_override_" .. ROM_VERSION .. ".txt"

local ADDR_READY     = 0xFF0011
local ADDR_SCRIPT    = 0xFF0012
local ADDR_SUB       = 0xFF0013
local ADDR_PPU_LOAD  = 0xFF0014
local FORCE_WORD     = 0x0EEE
local override_enabled = false

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

local function dump_cram(first, last)
    memory.usememorydomain("CRAM")
    local parts = {}
    for i = first, last do
        parts[#parts + 1] = string.format("%04X", memory.read_u16_be(i * 2) or 0)
    end
    memory.usememorydomain("M68K BUS")
    log(string.format("cram[%02X-%02X]=%s", first, last, table.concat(parts, " ")))
end

if event and event.onframestart then
    event.onframestart(function()
        if override_enabled then
            write_flat_cram(FORCE_WORD)
        end
    end, "title_cram_override")
end

memory.usememorydomain("M68K BUS")
log("=== TITLE CRAM OVERRIDE " .. ROM_VERSION .. " ===")

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
        override_enabled = true
        emu.frameadvance()
        emu.frameadvance()
        dump_cram(0, 15)
        local shot = SHOT_DIR .. ROM_VERSION .. "_title_cram_override.png"
        client.screenshot(shot)
        log("screenshot=" .. shot)
        break
    end
end

log("=== TITLE CRAM OVERRIDE COMPLETE ===")
log_file:close()
client.exit()
