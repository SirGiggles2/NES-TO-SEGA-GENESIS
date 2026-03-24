-- zelda_write_watch.lua
-- Uses memory write callbacks to detect WHO writes to subscript/screen_ready/frm_cnt.
-- Logs the 68K program counter at each write, identifying the exact instruction.

local ROM_VERSION = "zelda_v478"
local MAX_FRAMES = 1200
local INJECT_FRAME = 850
local INJECT_DURATION = 300

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "write_watch_" .. ROM_VERSION .. ".txt"

-- RAM addresses (M68K BUS domain)
local ADDR_READY        = 0xFF0011
local ADDR_SCRIPT       = 0xFF0012
local ADDR_SUBSCRIPT    = 0xFF0013
local ADDR_PPU_LOAD     = 0xFF0014
local ADDR_FRM_CNT      = 0xFF0015
local ADDR_BTN_PRESS    = 0xFF00F8
local ADDR_BTN_HOLD     = 0xFF00FA
local ADDR_JOY_OVERRIDE = 0xFFEE90
local ADDR_JOY_ENABLE   = 0xFFEE91
local ADDR_RAM_00F5     = 0xFF00F5
local ADDR_RAM_00F6     = 0xFF00F6

memory.usememorydomain("M68K BUS")

os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
    print(msg)
end

local function hex(v, w)
    return string.format("%0" .. tostring(w or 2) .. "X", v or 0)
end

local function r8(addr)
    return memory.read_u8(addr) or 0
end

log("=== WRITE WATCH: " .. ROM_VERSION .. " ===")
log("inject_frame=" .. INJECT_FRAME .. " inject_duration=" .. INJECT_DURATION)
log("")

-- Track BizHawk frame counter
local biz_frame = 0

-- Register write callbacks on critical addresses
-- BizHawk Genesis: event.onmemorywrite(callback, addr, name, domain)
local watch_addrs = {
    {addr = ADDR_READY,     name = "screen_ready"},
    {addr = ADDR_SUBSCRIPT, name = "subscript"},
    {addr = ADDR_FRM_CNT,   name = "frm_cnt"},
    {addr = ADDR_SCRIPT,    name = "script"},
    {addr = ADDR_PPU_LOAD,  name = "ppu_load"},
}

-- Try to get CPU registers for PC
local function get_pc()
    local regs = emu.getregisters()
    if regs and regs["M68K PC"] then
        return regs["M68K PC"]
    elseif regs and regs["PC"] then
        return regs["PC"]
    end
    -- Dump all register names for debugging
    if regs then
        local names = {}
        for k, v in pairs(regs) do
            table.insert(names, k)
        end
        return -1  -- unknown
    end
    return -2  -- no regs
end

for _, w in ipairs(watch_addrs) do
    local ok, err = pcall(function()
        event.onmemorywrite(function()
            local pc = get_pc()
            local val = r8(w.addr)
            local sub = r8(ADDR_SUBSCRIPT)
            local rdy = r8(ADDR_READY)
            local frm = r8(ADDR_FRM_CNT)
            local scr = r8(ADDR_SCRIPT)
            log(string.format("  WRITE %s=%02X at PC=%06X (biz_f=%d scr=%d sub=%d rdy=%d frm=%d)",
                w.name, val, pc, biz_frame, scr, sub, rdy, frm))
        end, w.addr, w.name, "M68K BUS")
    end)
    if ok then
        log("Registered write watch on " .. w.name .. " ($" .. hex(w.addr, 6) .. ")")
    else
        log("FAILED to register " .. w.name .. ": " .. tostring(err))
        -- Try alternate API
        local ok2, err2 = pcall(function()
            event.onmemorywrite(function()
                local pc = get_pc()
                local val = r8(w.addr)
                log(string.format("  WRITE %s=%02X at PC=%06X (biz_f=%d)",
                    w.name, val, pc, biz_frame))
            end, w.addr, w.name)
        end)
        if ok2 then
            log("  Registered with alt API for " .. w.name)
        else
            log("  Alt API also failed: " .. tostring(err2))
        end
    end
end

log("")

-- Main loop
local prev_sub = -1
local prev_rdy = -1
local prev_scr = -1
local done = false

for frame = 0, MAX_FRAMES do
    biz_frame = frame

    -- Inject Start press
    if frame >= INJECT_FRAME and frame < INJECT_FRAME + INJECT_DURATION then
        memory.write_u8(ADDR_JOY_ENABLE, 1)
        memory.write_u8(ADDR_JOY_OVERRIDE, 0x10)
        if frame == INJECT_FRAME then
            log(">>> INJECTING START at frame " .. frame)
        end
    elseif frame == INJECT_FRAME + INJECT_DURATION then
        memory.write_u8(ADDR_JOY_ENABLE, 0)
        memory.write_u8(ADDR_JOY_OVERRIDE, 0)
        log(">>> RELEASED START at frame " .. frame)
    end

    emu.frameadvance()

    local script = r8(ADDR_SCRIPT)
    local sub    = r8(ADDR_SUBSCRIPT)
    local ready  = r8(ADDR_READY)
    local frm    = r8(ADDR_FRM_CNT)
    local ppu    = r8(ADDR_PPU_LOAD)
    local press  = r8(ADDR_BTN_PRESS)
    local hold   = r8(ADDR_BTN_HOLD)
    local f5     = r8(ADDR_RAM_00F5)
    local f6     = r8(ADDR_RAM_00F6)

    local changed = (sub ~= prev_sub) or (script ~= prev_scr) or (ready ~= prev_rdy)
    local in_window = (frame >= INJECT_FRAME - 5) and (frame <= INJECT_FRAME + 100)

    if changed or in_window or (frame % 200 == 0) then
        local line = string.format(
            "f=%04d scr=%d sub=%d rdy=%d ppu=%02X frm=%d press=%02X hold=%02X F5=%02X F6=%02X",
            frame, script, sub, ready, ppu, frm, press, hold, f5, f6
        )
        if changed then line = line .. " <<< CHANGED" end
        log(line)
    end

    prev_sub = sub
    prev_scr = script
    prev_rdy = ready

    if script == 1 then
        log("=== SUCCESS: script advanced to 1 ===")
        if not done then done = true end
    end

    if done and frame > INJECT_FRAME + 100 then
        break
    end
end

log("")
log("=== WRITE WATCH COMPLETE ===")
log_file:close()
client.exit()
