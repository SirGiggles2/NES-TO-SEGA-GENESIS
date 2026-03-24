-- Quick Start Button Injection Test for v67
-- Tests whether direct RAM injection of Start button advances game past title screen

local INJECT_FRAME = 900
local MAX_FRAMES = 1500
local TEST_ROM = "v67"

local frame_num = 0
local log_file = io.open("diag/reports/start_injection_" .. TEST_ROM .. ".txt", "w")

local function log(msg)
    if log_file then
        log_file:write(msg .. "\n")
        log_file:flush()
    end
    print(msg)
end

local function read_u8(addr)
    return memory.read_u8(addr)
end

local function write_u8(addr, val)
    memory.write_u8(addr, val)
end

log("=== START BUTTON INJECTION TEST v67 ===")
log("Target: Inject Start bit at frame " .. INJECT_FRAME)
log("Expected: Script 0 (title) -> Script 1 (slot select)")
log("")
log("Frame | Script | Sub | PPUCTRL | Notes")
log(string.rep("-", 70))

local start_injected = false
local script_changed_frame = nil

while frame_num < MAX_FRAMES do
    emu.frameadvance()
    frame_num = frame_num + 1

    local script = read_u8(0xFF0012)
    local subscript = read_u8(0xFF0013)
    local ppuctrl = read_u8(0xFFEF00)
    local btn_press = read_u8(0xFF00F8)

    -- Inject Start button at target frame
    if frame_num == INJECT_FRAME and not start_injected then
        write_u8(0xFF00F8, 0x10)
        start_injected = true
        log(string.format("%5d | %6d | %3d | 0x%02X | *** INJECTED START", frame_num, script, subscript, ppuctrl))
    end

    -- Log key frames
    if frame_num < INJECT_FRAME + 5 then
        log(string.format("%5d | %6d | %3d | 0x%02X | pre-inject", frame_num, script, subscript, ppuctrl))
    elseif frame_num >= INJECT_FRAME and frame_num <= INJECT_FRAME + 150 then
        if frame_num % 5 == 0 or script ~= 0 then
            log(string.format("%5d | %6d | %3d | 0x%02X", frame_num, script, subscript, ppuctrl))
        end
    else
        if frame_num % 50 == 0 then
            log(string.format("%5d | %6d | %3d | 0x%02X", frame_num, script, subscript, ppuctrl))
        end
    end

    -- Detect script change
    if start_injected and script ~= 0 and script_changed_frame == nil then
        script_changed_frame = frame_num
        log("")
        log(string.format("*** SCRIPT CHANGED AT FRAME %d: 0 -> %d", script_changed_frame, script))
        log("")
    end

    -- Exit if we've seen significant progress
    if script ~= 0 and frame_num > INJECT_FRAME + 200 then
        log("Test complete - game has progressed past title")
        break
    end
end

log("")
log("=== TEST SUMMARY ===")
if script_changed_frame then
    log("SUCCESS: Script changed at frame " .. script_changed_frame)
    log("Delay after injection: " .. (script_changed_frame - INJECT_FRAME) .. " frames")
else
    log("FAILURE: Script did not change")
    log("Final script: " .. read_u8(0xFF0012))
end
log("Total frames: " .. frame_num)

if log_file then
    log_file:close()
end
