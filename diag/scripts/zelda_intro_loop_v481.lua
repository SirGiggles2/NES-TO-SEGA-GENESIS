-- zelda_intro_loop_v481.lua
-- Tests v481 ROM (sound driver disabled): check if intro loop runs

local ROM_VERSION = "zelda_v481"
local MAX_FRAMES = 6000

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
local prev_042D = -1
local nmi_count = 0
local handler2_active = false
local consecutive_frozen = 0
local freeze_reported = false
local last_log_nmi = 0

for frame = 0, MAX_FRAMES do
    emu.frameadvance()
    local frm = r8(0xFF0015)
    local rdy = r8(0xFF0011)
    local ram_042D = r8(0xFF042D)
    local ram_041A = r8(0xFF041A)
    local scroll_Y = r8(0xFF00FC)
    local ram_2000 = r8(0xFF00FF)

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

    local state_changed = (rdy ~= prev_rdy) or (ram_042D ~= prev_042D)
    local periodic = (handler2_active and (nmi_count - last_log_nmi) >= 100)

    if state_changed or periodic then
        log(string.format("f=%05d frm=%3d rdy=%d phase=%d timer=%3d sy=$%02X 2000=$%02X nmi=%d cfr=%d",
            frame, frm, rdy, ram_042D, ram_041A, scroll_Y, ram_2000, nmi_count, consecutive_frozen))
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
    prev_042D = ram_042D
end

log("")
log(string.format("=== FINAL: f=%d nmi=%d frm=%d frozen=%s ===",
    MAX_FRAMES, nmi_count, r8(0xFF0015), tostring(freeze_reported)))
log("=== PROBE COMPLETE ===")
log_file:close()
client.exit()
