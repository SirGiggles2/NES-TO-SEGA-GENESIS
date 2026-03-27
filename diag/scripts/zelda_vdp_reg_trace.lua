-- zelda_vdp_reg_trace.lua
-- Trace VDP register writes that happen before the title settles.

local ROM_VERSION = "zelda_v677"
local MAX_FRAMES = 240

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH  = OUT_DIR .. "vdp_reg_trace_" .. ROM_VERSION .. ".txt"

local ADDR_READY     = 0xFF0011
local ADDR_SCRIPT    = 0xFF0012
local ADDR_SUB       = 0xFF0013
local ADDR_PPU_LOAD  = 0xFF0014
local VDP_CTRL_ADDR  = 0xC00004

local function ensure_dir()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
end

ensure_dir()
local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
end

local function reg(name)
    local ok, value = pcall(emu.getregister, name)
    if ok and type(value) == "number" then
        return value
    end
    return 0
end

local function read_u8(addr)
    memory.usememorydomain("M68K BUS")
    return memory.read_u8(addr) or 0
end

local function hex(v, width)
    return string.format("%0" .. tostring(width or 2) .. "X", v or 0)
end

memory.usememorydomain("M68K BUS")
log("=== VDP REG TRACE " .. ROM_VERSION .. " ===")

if event and type(event.on_bus_write) == "function" then
    local ok = pcall(function()
        event.on_bus_write(function(_, value)
        local word = value or 0
        local reg_index = bit.band(bit.rshift(word, 8), 0x1F)
        local is_reg_write = bit.band(word, 0xE000) == 0x8000
        if is_reg_write then
            log(string.format(
                "frame=%d pc=%06X word=%s reg=%02X data=%02X ready=%d script=%d sub=%d ppu=%02X",
                emu.framecount(),
                reg("M68K PC") & 0xFFFFFF,
                hex(word, 4),
                reg_index,
                bit.band(word, 0x00FF),
                read_u8(ADDR_READY),
                read_u8(ADDR_SCRIPT),
                read_u8(ADDR_SUB),
                read_u8(ADDR_PPU_LOAD)
            ))
        end
        end, VDP_CTRL_ADDR, "vdp_ctrl_trace")
    end)
    if not ok then
        log("event.on_bus_write unavailable")
    end
else
    log("event.on_bus_write unavailable")
end

for frame = 1, MAX_FRAMES do
    emu.frameadvance()
end

log("=== VDP REG TRACE COMPLETE ===")
log_file:close()
client.exit()
