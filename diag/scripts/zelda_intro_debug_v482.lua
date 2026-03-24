-- zelda_intro_debug_v482.lua
-- Enhanced intro loop probe: tracks auto/demo flag, every-frame logging around transition

local ROM_VERSION = "zelda_v481"
local MAX_FRAMES = 2000

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "intro_debug_" .. ROM_VERSION .. ".txt"

memory.usememorydomain("M68K BUS")
os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
local log_file = assert(io.open(OUT_PATH, "w"))
local function log(msg) log_file:write(msg .. "\n"); log_file:flush() end
local function r8(addr) return memory.read_u8(addr) or 0 end

log("=== INTRO DEBUG PROBE: " .. ROM_VERSION .. " ===")

local prev_frm = -1
local nmi_count = 0
local handler2_active = false
local consecutive_frozen = 0
local last_log_nmi = 0
local transition_detected = false
local every_frame_start = -1
local every_frame_count = 0

for frame = 0, MAX_FRAMES do
    emu.frameadvance()
    local frm = r8(0xFF0015)       -- frm_cnt
    local rdy = r8(0xFF0011)       -- screen_ready
    local phase = r8(0xFF042D)     -- phase (ram_042D)
    local auto_demo = r8(0xFF042C) -- auto/demo flag (ram_042B_enemy)
    local timer = r8(0xFF041A)     -- timer
    local scroll_Y = r8(0xFF00FC)  -- scroll_Y
    local r2000 = r8(0xFF00FF)     -- ram_for_2000
    local ram_005C = r8(0xFF005C)  -- nametable swap counter
    local ram_0415 = r8(0xFF0415)  -- scroll wrap counter
    local subscript = r8(0xFF0013) -- ram_subscript
    local script = r8(0xFF0012)    -- ram_script
    local ppu_idx = r8(0xFF0014)   -- ppu_load_index
    local ram_0528 = r8(0xFF0528)  -- ram_0528

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

    -- Detect the transition (rdy goes from 1 to 0, meaning palette handler finished)
    if handler2_active and rdy == 0 and not transition_detected then
        transition_detected = true
        every_frame_start = frame
        log(string.format("*** TRANSITION DETECTED at f=%d nmi=%d ***", frame, nmi_count))
    end

    -- Log every frame for 200 frames around and after transition
    local in_detail_zone = transition_detected and every_frame_count < 200
    if in_detail_zone then
        every_frame_count = every_frame_count + 1
        log(string.format("f=%05d frm=%3d rdy=%d ad=%d ph=%d sub=%d scr=%d timer=%3d sy=$%02X 2000=$%02X 5C=%d 0415=%d ppu=%d 0528=%d cfr=%d",
            frame, frm, rdy, auto_demo, phase, subscript, script, timer, scroll_Y, r2000, ram_005C, ram_0415, ppu_idx, ram_0528, consecutive_frozen))
    else
        -- Periodic logging outside detail zone
        local state_changed = (rdy == 0 and handler2_active) or (phase ~= r8(0xFF042D))
        local periodic = handler2_active and (nmi_count - last_log_nmi) >= 200
        if state_changed or periodic or frame <= 160 then
            if nmi_count ~= last_log_nmi or frame <= 160 then
                log(string.format("f=%05d frm=%3d rdy=%d ad=%d ph=%d sub=%d scr=%d timer=%3d sy=$%02X 2000=$%02X 5C=%d 0415=%d ppu=%d cfr=%d",
                    frame, frm, rdy, auto_demo, phase, subscript, script, timer, scroll_Y, r2000, ram_005C, ram_0415, ppu_idx, consecutive_frozen))
                last_log_nmi = nmi_count
            end
        end
    end

    prev_frm = frm
end

log("")
log(string.format("=== FINAL: f=%d nmi=%d frm=%d frozen=%d ===",
    MAX_FRAMES, nmi_count, r8(0xFF0015), consecutive_frozen))
log("=== PROBE COMPLETE ===")
log_file:close()
client.exit()
