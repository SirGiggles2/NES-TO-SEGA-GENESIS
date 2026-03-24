-- zelda_frontend_order_probe.lua
-- Verifies the front-end branch order under internal autostart harnesses.

local ROM_VERSION = "zelda_v408"
local MAX_FRAMES = 1400

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR = OUT_DIR .. "screens\\"
local OUT_PATH = OUT_DIR .. "frontend_order_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY      = 0xFF0011
local ADDR_SCRIPT     = 0xFF0012
local ADDR_SUBSCRIPT  = 0xFF0013
local ADDR_PPU_LOAD   = 0xFF0014
local ADDR_CUR_SLOT   = 0xFF0016
local ADDR_SLOT_0     = 0xFF0633
local ADDR_SLOT_1     = 0xFF0634
local ADDR_SLOT_2     = 0xFF0635
local ADDR_SLOT_3     = 0xFF0636
local ADDR_SLOT_4     = 0xFF0637
local ADDR_TRACE_LAST = 0xFFF000
local ADDR_TRACE_SEQ  = 0xFFF002

memory.usememorydomain("M68K BUS")

local frame_num = 0
local saw_file_select = false
local prev = nil

local function ensure_dirs()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
    os.execute('if not exist "' .. SHOT_DIR .. '" mkdir "' .. SHOT_DIR .. '"')
end

ensure_dirs()
local log_file = io.open(OUT_PATH, "w")

local function log(msg)
    if log_file then
        log_file:write(msg .. "\n")
        log_file:flush()
    end
    print(msg)
end

local function shot(name)
    local full = SHOT_DIR .. name
    client.screenshot(full)
    log("screenshot=" .. full)
end

local function read_state()
    return {
        ready      = memory.read_u8(ADDR_READY),
        script     = memory.read_u8(ADDR_SCRIPT),
        sub        = memory.read_u8(ADDR_SUBSCRIPT),
        ppu        = memory.read_u8(ADDR_PPU_LOAD),
        slot       = memory.read_u8(ADDR_CUR_SLOT),
        slot0      = memory.read_u8(ADDR_SLOT_0),
        slot1      = memory.read_u8(ADDR_SLOT_1),
        slot2      = memory.read_u8(ADDR_SLOT_2),
        slot3      = memory.read_u8(ADDR_SLOT_3),
        slot4      = memory.read_u8(ADDR_SLOT_4),
        trace_last = memory.read_u16_be(ADDR_TRACE_LAST),
        trace_seq  = memory.read_u16_be(ADDR_TRACE_SEQ),
    }
end

local function log_state(prefix, s)
    log(string.format(
        "%s frame=%d ready=%d script=%d sub=%d ppu=0x%02X slot=%d active=[%02X,%02X,%02X,%02X,%02X] trace=[%04X,%04X]",
        prefix, frame_num, s.ready, s.script, s.sub, s.ppu, s.slot,
        s.slot0, s.slot1, s.slot2, s.slot3, s.slot4, s.trace_last, s.trace_seq
    ))
end

log("=== FRONTEND ORDER PROBE " .. ROM_VERSION .. " ===")
log("Goal: verify title -> file select -> next script under title+slot autostart harnesses.")
log("")

while frame_num < MAX_FRAMES do
    emu.frameadvance()
    frame_num = frame_num + 1

    local s = read_state()
    local changed =
        prev == nil or
        s.ready ~= prev.ready or
        s.script ~= prev.script or
        s.sub ~= prev.sub or
        s.ppu ~= prev.ppu or
        s.slot ~= prev.slot

    if changed then
        log_state("state", s)
    end

    if frame_num % 120 == 0 then
        log_state("heartbeat", s)
    end

    if not saw_file_select and s.script == 1 and s.sub == 0 and s.ready == 1 and s.ppu == 0 then
        saw_file_select = true
        log("file_select_ready frame=" .. frame_num)
        shot(ROM_VERSION .. "_order_file_select_f" .. frame_num .. ".png")
    end

    if saw_file_select and s.script ~= 1 then
        log("post_file_select_script frame=" .. frame_num .. " script=" .. s.script .. " sub=" .. s.sub)
        shot(ROM_VERSION .. "_order_post_file_select_f" .. frame_num .. ".png")
        break
    end

    prev = s
end

log("")
log("=== SUMMARY ===")
local final = read_state()
log_state("final", final)

if log_file then
    log_file:close()
end
