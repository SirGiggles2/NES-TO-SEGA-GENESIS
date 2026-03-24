-- zelda_pc_freeze_probe.lua
-- Samples the 68000 PC register every frame to find where the NMI handler hangs.
-- The NMI freezes after ~253 ticks (around BizHawk frame 999).
-- We wait until screen_ready=1 (handler_2 active) before monitoring for freeze.

local ROM_VERSION = "zelda_v479"
local MAX_FRAMES = 1500

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "pc_freeze_" .. ROM_VERSION .. ".txt"

memory.usememorydomain("M68K BUS")

os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
end

local function r8(addr) return memory.read_u8(addr) or 0 end

log("=== PC FREEZE PROBE: " .. ROM_VERSION .. " ===")

local prev_frm = -1
local nmi_count = 0
local freeze_start = -1
local freeze_count = 0
local pc_samples = {}
local handler2_active = false
local consecutive_frozen = 0

for frame = 0, MAX_FRAMES do
    emu.frameadvance()

    local frm = r8(0xFF0015)
    local rdy = r8(0xFF0011)

    if frm ~= prev_frm then
        nmi_count = nmi_count + 1
        consecutive_frozen = 0
    else
        consecutive_frozen = consecutive_frozen + 1
    end

    -- Only start monitoring after screen_ready=1 (handler_2 active, 1:1 NMI)
    if rdy ~= 0 and not handler2_active then
        handler2_active = true
        log(string.format("handler_2 active at f=%d frm=%d nmi=%d", frame, frm, nmi_count))
    end

    -- Detect freeze: frm_cnt stops for 5+ consecutive frames AFTER handler_2 is active
    local frozen = (handler2_active and consecutive_frozen >= 5)

    if frozen and freeze_start < 0 then
        freeze_start = frame
        log(string.format("*** FREEZE DETECTED at f=%d frm=%d nmi=%d (frozen %d frames) ***",
            frame, frm, nmi_count, consecutive_frozen))
    end

    -- Sample PC during freeze (first 100 frozen frames)
    if frozen and freeze_count < 100 then
        local pc = emu.getregister("M68K PC") or 0
        local sr = emu.getregister("M68K SR") or 0
        local sp = emu.getregister("M68K A7") or 0

        log(string.format("f=%05d PC=%06X SR=%04X SP=%06X frm=%d",
            frame, pc, sr, sp, frm))

        local key = string.format("%06X", pc)
        pc_samples[key] = (pc_samples[key] or 0) + 1
        freeze_count = freeze_count + 1
    end

    -- Log around the expected freeze point (pre-freeze)
    if handler2_active and not frozen and frame >= 950 and frame <= 1050 then
        local pc = emu.getregister("M68K PC") or 0
        log(string.format("f=%05d PC=%06X frm=%d rdy=%d nmi=%d cfr=%d",
            frame, pc, frm, rdy, nmi_count, consecutive_frozen))
    end

    prev_frm = frm

    if freeze_count >= 100 then
        break
    end
end

log("")
log("=== PC FREQUENCY TABLE ===")
local sorted = {}
for pc, count in pairs(pc_samples) do
    table.insert(sorted, {pc=pc, count=count})
end
table.sort(sorted, function(a,b) return a.count > b.count end)
for _, entry in ipairs(sorted) do
    log(string.format("PC=%s  count=%d", entry.pc, entry.count))
end

log("")
log("=== PROBE COMPLETE ===")
log_file:close()
client.exit()
