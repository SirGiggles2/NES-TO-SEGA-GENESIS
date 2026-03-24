-- zelda_nes_intro_loop.lua
-- Observes the NES original intro loop: title → fade → intro scroll → title
-- No button presses — just captures the state machine as oracle reference.
-- Runs in BizHawk with the NES core.

local ROM_VERSION = "nes_original"
local MAX_FRAMES = 12000

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "nes_intro_loop_" .. ROM_VERSION .. ".txt"

-- NES RAM addresses (6502 address space, via "RAM" domain or "System Bus")
local ADDR_READY     = 0x0011
local ADDR_SCRIPT    = 0x0012
local ADDR_SUBSCRIPT = 0x0013
local ADDR_PPU_LOAD  = 0x0014
local ADDR_FRM_CNT   = 0x0015
local ADDR_BTN_PRESS = 0x00F8
local ADDR_BTN_HOLD  = 0x00FA
local ADDR_FOR_2000  = 0x00FF
local ADDR_FOR_2001  = 0x00FE
local ADDR_RAM_00F5  = 0x00F5
local ADDR_RAM_00F6  = 0x00F6
local ADDR_RAM_00E3  = 0x00E3
local ADDR_SCROLL_X  = 0x00FD
local ADDR_SCROLL_Y  = 0x00FC
local ADDR_RAM_0528  = 0x0528
local ADDR_RAM_004D  = 0x004D
local ADDR_RAM_005B  = 0x005B

-- Detect memory domain
local domain = nil
local domains = memory.getmemorydomainlist()
for _, d in ipairs(domains) do
    if d == "RAM" then domain = "RAM"; break end
end
if not domain then
    for _, d in ipairs(domains) do
        if d == "System Bus" then domain = "System Bus"; break end
    end
end
if not domain then
    for _, d in ipairs(domains) do
        if d == "Main RAM" then domain = "Main RAM"; break end
    end
end

if not domain then
    print("ERROR: Could not find NES RAM domain!")
    print("Available domains:")
    for _, d in ipairs(domains) do print("  " .. d) end
    client.exit()
    return
end

memory.usememorydomain(domain)
print("Using memory domain: " .. domain)

-- If using "System Bus", NES RAM is at 0x0000-0x07FF directly
-- If using "RAM", addresses are 0x0000-0x07FF (mirrored)
-- Addresses above 0x0800 need System Bus
local use_sysbus = (domain == "System Bus")

os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
    print(msg)
end

local function r8(addr)
    -- For RAM domain, addresses > 0x07FF won't work; use sysbus if available
    if not use_sysbus and addr > 0x07FF then
        -- Try switching temporarily
        local ok, val = pcall(function()
            memory.usememorydomain("System Bus")
            local v = memory.read_u8(addr)
            memory.usememorydomain(domain)
            return v
        end)
        if ok then return val or 0 end
        return 0
    end
    return memory.read_u8(addr) or 0
end

log("=== NES INTRO LOOP ORACLE: " .. ROM_VERSION .. " ===")
log("domain=" .. domain .. " max_frames=" .. MAX_FRAMES)
log("")

local prev_sub = -1
local prev_script = -1
local prev_ready = -1
local prev_frm = -1
local cycle_count = 0
local nmi_count = 0

for frame = 0, MAX_FRAMES do
    emu.frameadvance()

    local script  = r8(ADDR_SCRIPT)
    local sub     = r8(ADDR_SUBSCRIPT)
    local ready   = r8(ADDR_READY)
    local ppu     = r8(ADDR_PPU_LOAD)
    local frm     = r8(ADDR_FRM_CNT)
    local f5      = r8(ADDR_RAM_00F5)
    local f6      = r8(ADDR_RAM_00F6)
    local e3      = r8(ADDR_RAM_00E3)
    local for2001 = r8(ADDR_FOR_2001)
    local for2000 = r8(ADDR_FOR_2000)
    local scrollx = r8(ADDR_SCROLL_X)
    local scrolly = r8(ADDR_SCROLL_Y)
    local r0528   = r8(ADDR_RAM_0528)
    local r004D   = r8(ADDR_RAM_004D)
    local r005B   = r8(ADDR_RAM_005B)

    -- Track NMI ticks (frm_cnt changes)
    if frm ~= prev_frm and prev_frm >= 0 then
        nmi_count = nmi_count + 1
    end

    local changed = (sub ~= prev_sub) or (script ~= prev_script) or (ready ~= prev_ready)

    if changed or (frame % 200 == 0) then
        local line = string.format(
            "f=%05d nmi=%3d scr=%d sub=%02d rdy=%d ppu=%02X frm=%3d F5=%02X F6=%02X e3=%02X 2000=%02X 2001=%02X sx=%02X sy=%02X 0528=%02X 4D=%02X 5B=%02X",
            frame, nmi_count, script, sub, ready, ppu, frm, f5, f6, e3, for2000, for2001, scrollx, scrolly, r0528, r004D, r005B
        )
        if changed then
            line = line .. " <<< CHANGED"
            if script ~= prev_script and prev_script >= 0 then
                line = line .. string.format(" (script %d->%d)", prev_script, script)
            end
            if sub ~= prev_sub and prev_sub >= 0 then
                line = line .. string.format(" (sub %d->%d)", prev_sub, sub)
            end
            if ready ~= prev_ready and prev_ready >= 0 then
                line = line .. string.format(" (rdy %d->%d)", prev_ready, ready)
            end
        end
        log(line)

        -- Track intro cycles (script goes back to 0 from something else)
        if script == 0 and prev_script ~= 0 and prev_script > 0 then
            cycle_count = cycle_count + 1
            log("=== INTRO CYCLE " .. cycle_count .. " COMPLETE (back to title) ===")
        end
    end

    prev_sub = sub
    prev_script = script
    prev_ready = ready
    prev_frm = frm

    if cycle_count >= 2 then
        log("Two full intro cycles observed. Stopping.")
        break
    end
end

log("")
log("=== NES INTRO LOOP ORACLE COMPLETE ===")
log("Total NMI ticks: " .. nmi_count)
log("Total cycles: " .. cycle_count)
log_file:close()
client.exit()
