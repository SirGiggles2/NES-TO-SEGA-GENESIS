-- zelda_smoke_test.lua
-- Quick 900-frame smoke test: verifies boot, title render, game running.
-- Outputs machine-readable result to diag/reports/smoke_test_<rom>.json
--
-- PASS criteria:
--   1. VRAM has non-zero data (something rendered)
--   2. Ready flag set at least once (VBlank init completed, Phase 2 entered)
--
-- NES architecture note: The main loop is an intentional infinite JMP
-- (loc_E45B). All real work happens in the VBlank interrupt. During
-- Phase 1 (loading), the frame counter does NOT advance - this is
-- normal and can last hundreds of VBlanks during title setup.
-- We do NOT use PC freeze or frame counter freeze for crash detection.
-- Instead, we run all frames and check if the game initialized properly.
--
-- Usage: Load ROM in BizHawk, then run this Lua script.
-- ROM_VERSION is patched by runner script before launch.

local ROM_VERSION = "zelda_v599"
local MAX_FRAMES  = 900

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "smoke_test_" .. ROM_VERSION .. ".json"

-- Genesis memory addresses
local ADDR_READY   = 0xFF0011
local ADDR_SCRIPT  = 0xFF0012
local ADDR_FRM_CNT = 0xFF0015

memory.usememorydomain("M68K BUS")

local frame_num = 0
local max_script_seen = 0
local vram_nonzero = false
local ready_seen = false
local ready_count = 0
local script_changes = 0
local prev_script = -1
local final_frm_cnt = 0

local function ensure_dir()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
end

local function check_vram()
    -- Sample VRAM Plane A region for non-zero content
    local sum = 0
    for addr = 0xC000, 0xC100, 4 do
        sum = sum + memory.read_u16_be(addr)
    end
    return sum > 0
end

while true do
    emu.frameadvance()
    frame_num = frame_num + 1

    if frame_num > MAX_FRAMES then break end

    -- Read state
    local script = memory.read_u8(ADDR_SCRIPT)
    local ready  = memory.read_u8(ADDR_READY)
    local frm_cnt = memory.read_u8(ADDR_FRM_CNT)
    final_frm_cnt = frm_cnt

    -- Track ready flag (Phase 2 entry = VBlank driving game logic)
    if ready ~= 0 then
        ready_seen = true
        ready_count = ready_count + 1
    end

    -- Track max script
    if script > max_script_seen then
        max_script_seen = script
    end

    -- Track script changes
    if script ~= prev_script and prev_script >= 0 then
        script_changes = script_changes + 1
    end
    prev_script = script

    -- Check VRAM at multiple points
    if (frame_num == 60 or frame_num == 200 or frame_num == 500)
       and not vram_nonzero then
        vram_nonzero = check_vram()
    end

    -- Log progress at key frames
    if frame_num % 100 == 0 then
        print(string.format("[smoke] f=%d script=%d ready=%d frm_cnt=%d max_script=%d ready_count=%d",
                            frame_num, script, ready, frm_cnt, max_script_seen, ready_count))
    end
end

-- Determine pass/fail
local pass_vram = vram_nonzero
local pass_ready = ready_seen
local all_pass = pass_vram and pass_ready

-- Write JSON report
ensure_dir()
local f = io.open(OUT_PATH, "w")
if f then
    f:write("{\n")
    f:write(string.format('  "rom": "%s",\n', ROM_VERSION))
    f:write(string.format('  "frames": %d,\n', frame_num))
    f:write(string.format('  "pass": %s,\n', tostring(all_pass)))
    f:write(string.format('  "pass_vram": %s,\n', tostring(pass_vram)))
    f:write(string.format('  "pass_ready": %s,\n', tostring(pass_ready)))
    f:write(string.format('  "ready_count": %d,\n', ready_count))
    f:write(string.format('  "max_script": %d,\n', max_script_seen))
    f:write(string.format('  "script_changes": %d,\n', script_changes))
    f:write(string.format('  "final_frm_cnt": %d\n', final_frm_cnt))
    f:write("}\n")
    f:close()
    print("[smoke] Report written to " .. OUT_PATH)
end

-- Print summary
print("==============================")
print("  SMOKE TEST: " .. ROM_VERSION)
print("==============================")
print("  VRAM:   " .. (pass_vram and "PASS" or "FAIL (no VRAM data)"))
print("  Ready:  " .. (pass_ready and "PASS (count=" .. ready_count .. ")"
                                   or "FAIL (ready never set)"))
print("  Info:   max_script=" .. max_script_seen
      .. " frm_cnt=" .. final_frm_cnt
      .. " script_changes=" .. script_changes)
print("  RESULT: " .. (all_pass and "PASS" or "FAIL"))
print("==============================")
