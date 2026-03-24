-- zelda_frm_cnt_probe.lua
-- Quick probe: logs frm_cnt every frame around the freeze point to determine
-- if the NMI is truly stuck or just aliasing at sample points.

local ROM_VERSION = "zelda_v479"
local MAX_FRAMES = 2500

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "frm_cnt_probe_" .. ROM_VERSION .. ".txt"

memory.usememorydomain("M68K BUS")

os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
end

local function r8(addr) return memory.read_u8(addr) or 0 end

log("=== FRM_CNT PROBE: " .. ROM_VERSION .. " ===")

local prev_frm = -1
local nmi_count = 0

for frame = 0, MAX_FRAMES do
    emu.frameadvance()

    local frm = r8(0xFF0015)
    local rdy = r8(0xFF0011)
    local scr = r8(0xFF0012)

    if frm ~= prev_frm then
        nmi_count = nmi_count + 1
    end

    -- Log every frame from 740-800 and 990-1050 to see NMI rate
    -- Log every 10 frames from 800-990
    -- Log every 100 frames otherwise
    local should_log = false
    if frame >= 740 and frame <= 800 then should_log = true end
    if frame >= 990 and frame <= 1100 then should_log = true end
    if frame >= 800 and frame < 990 and frame % 10 == 0 then should_log = true end
    if frame > 1100 and frame % 100 == 0 then should_log = true end
    if frm ~= prev_frm then should_log = true end

    if should_log then
        log(string.format("f=%05d frm=%3d rdy=%d scr=%d nmi=%d%s",
            frame, frm, rdy, scr, nmi_count,
            (frm ~= prev_frm and prev_frm >= 0) and " <<< TICK" or ""))
    end

    prev_frm = frm
end

log("")
log("=== PROBE COMPLETE ===")
log("Total NMI ticks: " .. nmi_count)
log_file:close()
client.exit()
