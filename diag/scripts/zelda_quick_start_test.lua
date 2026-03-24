-- zelda_quick_start_test.lua
-- Autostart + slot-select autoadvance test
-- v360: title_autostart_cfg=$01, slot_autostart_cfg=$01
-- Monitors: script 0 (title) -> 1 (slot select) -> 5+ (gameplay)
-- ROM_VERSION is patched by run_start_injection_test.ps1 before launch

local ROM_VERSION  = "v360"   -- patched by PS launcher
local MAX_FRAMES   = 3600     -- 60 seconds of emulated time at 60fps

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "start_injection_" .. ROM_VERSION .. ".txt"

local frame_num    = 0
local prev_script  = 0
local prev_sub     = 0

local log_file = io.open(OUT_PATH, "w")

local function log(msg)
    if log_file then
        log_file:write(msg .. "\n")
        log_file:flush()
    end
    print(msg)
end

log("=== AUTOSTART FULL PATH TEST " .. ROM_VERSION .. " ===")
log("Max frames: " .. MAX_FRAMES .. " (~60s)")
log("Output: " .. OUT_PATH)
log("Goal: script 0 (title) -> 1 (slot select) -> 5+ (gameplay)")
log("")
log("Frame | Script | Sub | BtnPress | Notes")
log(string.rep("-", 65))

local script_log = {}   -- track all unique (script, sub) pairs seen

while frame_num < MAX_FRAMES do
    emu.frameadvance()
    frame_num = frame_num + 1

    local script    = memory.read_u8(0xFF0012)
    local subscript = memory.read_u8(0xFF0013)
    local btn_press = memory.read_u8(0xFF00F8)

    local should_log = false
    local note = ""

    -- Log every script or subscript change
    if script ~= prev_script then
        should_log = true
        note = string.format("SCRIPT CHANGE %d->%d", prev_script, script)
    elseif subscript ~= prev_sub then
        should_log = true
        note = string.format("SUBSCRIPT %d->%d", prev_sub, subscript)
    end

    -- Periodic heartbeat every 300 frames
    if frame_num % 300 == 0 then
        should_log = true
        if note == "" then note = "heartbeat" end
    end

    if should_log then
        log(string.format("%5d | %6d | %3d | 0x%02X     | %s",
            frame_num, script, subscript, btn_press, note))
    end

    prev_script = script
    prev_sub    = subscript

    -- Stop when gameplay is reached (script >= 5 means overworld/dungeon)
    if script >= 5 and frame_num > 200 then
        log("")
        log("*** GAMEPLAY REACHED at frame " .. frame_num .. " script=" .. script)
        break
    end

    -- Also stop if we're past slot select and clearly not advancing (hang detection)
    if script == 1 and frame_num > 2000 then
        log("")
        log("Slot select still at frame " .. frame_num .. " - possible hang")
        break
    end
end

log("")
log("=== SUMMARY ===")
log("Final: script=" .. memory.read_u8(0xFF0012) ..
    " subscript=" .. memory.read_u8(0xFF0013))
log("Total frames: " .. frame_num)

if log_file then log_file:close() end
