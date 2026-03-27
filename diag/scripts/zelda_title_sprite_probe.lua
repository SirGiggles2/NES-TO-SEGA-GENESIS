-- zelda_title_sprite_probe.lua
-- Dump steady title OAM/SAT state to catch stray sprites affecting the title.

local ROM_VERSION = "zelda_v676"
local MAX_FRAMES = 360

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH  = OUT_DIR .. "title_sprite_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY     = 0xFF0011
local ADDR_SCRIPT    = 0xFF0012
local ADDR_SUB       = 0xFF0013
local ADDR_PPU_LOAD  = 0xFF0014
local NES_OAM_BASE   = 0xFF0200
local SAT_BASE       = 0xD800

local function log_open(path)
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
    return assert(io.open(path, "w"))
end

local log_file = log_open(OUT_PATH)

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

local function dump_nes_oam()
    log("nes_oam_visible:")
    local visible = 0
    for i = 0, 63 do
        local base = NES_OAM_BASE + (i * 4)
        local y = read_bus_u8(base + 0)
        local tile = read_bus_u8(base + 1)
        local attr = read_bus_u8(base + 2)
        local x = read_bus_u8(base + 3)
        if y < 0xEF then
            visible = visible + 1
            log(string.format(
                "  [%02d] y=%02X tile=%02X attr=%02X x=%02X",
                i, y, tile, attr, x
            ))
        end
    end
    log(string.format("nes_oam_visible_count=%d", visible))
end

local function dump_sat()
    log("genesis_sat_visible:")
    with_domain("VRAM", function()
        local visible = 0
        for i = 0, 63 do
            local base = SAT_BASE + (i * 8)
            local y = memory.read_u16_be(base + 0) or 0
            local size_link = memory.read_u16_be(base + 2) or 0
            local attr = memory.read_u16_be(base + 4) or 0
            local x = memory.read_u16_be(base + 6) or 0

            local y_pos = bit.band(y, 0x01FF)
            local x_pos = bit.band(x, 0x01FF)
            local link = bit.band(size_link, 0x007F)
            local size = bit.band(bit.rshift(size_link, 8), 0x0F)
            local tile = bit.band(attr, 0x07FF)
            local pal = bit.band(bit.rshift(attr, 13), 0x03)
            local pri = bit.band(bit.rshift(attr, 15), 0x01)

            if x_pos ~= 0 or y_pos ~= 0 or tile ~= 0 then
                visible = visible + 1
                log(string.format(
                    "  [%02d] y=%03X x=%03X link=%02X size=%X attr=%s tile=%03X pal=%d pri=%d",
                    i, y_pos, x_pos, link, size, hex(attr, 4), tile, pal, pri
                ))
            end
        end
        log(string.format("genesis_sat_nonzero_count=%d", visible))
    end)
end

memory.usememorydomain("M68K BUS")
log("=== TITLE SPRITE PROBE " .. ROM_VERSION .. " ===")

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
        log(string.format("sample_frame=%d ready=%d script=%d sub=%d ppu=%02X hold=%d", frame, ready, script, sub, ppu, ready_hold))
        dump_nes_oam()
        dump_sat()
        break
    end
end

log("=== TITLE SPRITE PROBE COMPLETE ===")
log_file:close()
client.exit()
