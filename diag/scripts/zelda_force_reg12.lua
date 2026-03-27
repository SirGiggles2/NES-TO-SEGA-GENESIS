-- zelda_force_reg12.lua
-- Force Reg 12 to H32/no-shadow each frame and capture the settled title.
local ROM_VERSION = "zelda_v677"
local MAX_FRAMES = 360

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR  = OUT_DIR .. "screens\\"
local OUT_PATH  = OUT_DIR .. "force_reg12_" .. ROM_VERSION .. ".txt"

local ADDR_READY     = 0xFF0011
local ADDR_SCRIPT    = 0xFF0012
local ADDR_SUB       = 0xFF0013
local ADDR_PPU_LOAD  = 0xFF0014
local VDP_CTRL_ADDR  = 0xC00004

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

local function write_reg12()
    memory.usememorydomain("M68K BUS")
    memory.write_u16_be(VDP_CTRL_ADDR, 0x8C00)
end

if event and type(event.onframestart) == "function" then
    event.onframestart(function()
        write_reg12()
    end, "force_reg12")
end

memory.usememorydomain("M68K BUS")
log("=== FORCE REG12 " .. ROM_VERSION .. " ===")

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
        local shot = SHOT_DIR .. ROM_VERSION .. "_force_reg12.png"
        client.screenshot(shot)
        log(string.format("sample_frame=%d ready=%d script=%d sub=%d ppu=%02X hold=%d", frame, ready, script, sub, ppu, ready_hold))
        log("screenshot=" .. shot)
        break
    end
end

log("=== FORCE REG12 COMPLETE ===")
log_file:close()
client.exit()
