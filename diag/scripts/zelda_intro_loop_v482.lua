-- zelda_intro_loop_v482.lua
-- Tests v482 ROM (scroll fix): check intro loop cycles

local ROM_VERSION = "zelda_v482"
local MAX_FRAMES = 12000

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "intro_loop_" .. ROM_VERSION .. ".txt"

memory.usememorydomain("M68K BUS")
os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
local log_file = assert(io.open(OUT_PATH, "w"))
local function log(msg) log_file:write(msg .. "\n"); log_file:flush() end
local function r8(addr) return memory.read_u8(addr) or 0 end

log("=== INTRO LOOP PROBE: " .. ROM_VERSION .. " ===")

local prev_frm = -1
local prev_rdy = -1
local prev_phase = -1
local prev_ad = -1
local nmi_count = 0
local handler2_active = false
local consecutive_frozen = 0
local freeze_reported = false
local last_log_nmi = 0

for frame = 0, MAX_FRAMES do
    emu.frameadvance()
    local frm = r8(0xFF0015)
    local rdy = r8(0xFF0011)
    local phase = r8(0xFF042D)
    local auto_demo = r8(0xFF042C)
    local timer = r8(0xFF041A)
    local scroll_Y = r8(0xFF00FC)
    local r2000 = r8(0xFF00FF)
    local ram_005C = r8(0xFF005C)
    local ram_0415 = r8(0xFF0415)

    if frm ~= prev_frm then
        nmi_count = nmi_count + 1
        consecutive_frozen = 0
    else
        consecutive_frozen = consecutive_frozen + 1
    end

    if rdy ~= 0 and not handler2_active then
        handler2_active = true
        log(string.format("handler_2 active at f=%d frm=%d nmi=%d", frame, frm, nmi_count))
    end

    local state_changed = (rdy ~= prev_rdy) or (phase ~= prev_phase) or (auto_demo ~= prev_ad)
    local periodic = (handler2_active and (nmi_count - last_log_nmi) >= 100)

    if state_changed or periodic then
        log(string.format("f=%05d frm=%3d rdy=%d ad=%d ph=%d timer=%3d sy=$%02X 2000=$%02X 5C=%d 0415=%d nmi=%d cfr=%d",
            frame, frm, rdy, auto_demo, phase, timer, scroll_Y, r2000, ram_005C, ram_0415, nmi_count, consecutive_frozen))
        last_log_nmi = nmi_count
    end

    if handler2_active and consecutive_frozen >= 10 and not freeze_reported then
        freeze_reported = true
        local pc = emu.getregister("M68K PC") or 0
        log(string.format("*** FREEZE at f=%d frm=%d nmi=%d PC=%06X ***",
            frame, frm, nmi_count, pc))
    end

    prev_frm = frm
    prev_rdy = rdy
    prev_phase = phase
    prev_ad = auto_demo
end

log("")
log(string.format("=== FINAL: f=%d nmi=%d frm=%d frozen=%s ===",
    MAX_FRAMES, nmi_count, r8(0xFF0015), tostring(freeze_reported)))
log("=== PROBE COMPLETE ===")
log_file:close()
client.exit()
