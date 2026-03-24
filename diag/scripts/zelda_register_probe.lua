-- zelda_register_probe.lua
-- Waits for the register/name-entry screen and captures it after it settles.

local ROM_VERSION = "zelda_v411"
local MAX_FRAMES = 1600
local SETTLE_FRAMES = 30
local FALLBACK_DELAY = 180

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR = OUT_DIR .. "screens\\"
local OUT_PATH = OUT_DIR .. "register_probe_" .. ROM_VERSION .. ".txt"

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
local ADDR_CRASH_MAGIC  = 0xFFEE00
local ADDR_CRASH_VECTOR = 0xFFEE02
local ADDR_CRASH_PC     = 0xFFEE0A

memory.usememorydomain("M68K BUS")

local frame_num = 0
local register_entry = nil
local ready_stable = 0
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
    local ok, regs = pcall(emu.getregisters)
    local pc = 0
    if ok and type(regs) == "table" then
        for _, key in ipairs({ "M68K PC", "68K PC", "PC", "pc", "PPC" }) do
            if type(regs[key]) == "number" then
                pc = regs[key] & 0xFFFFFF
                break
            end
        end
    end

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
        crash_magic  = memory.read_u16_be(ADDR_CRASH_MAGIC),
        crash_vector = memory.read_u16_be(ADDR_CRASH_VECTOR),
        crash_pc     = memory.read_u32_be(ADDR_CRASH_PC),
        pc           = pc,
    }
end

local function log_state(prefix, s)
    log(string.format(
        "%s frame=%d ready=%d script=%d sub=%d ppu=0x%02X slot=%d active=[%02X,%02X,%02X,%02X,%02X] trace=[%04X,%04X] pc=%06X crash=%04X/%04X/%08X",
        prefix, frame_num, s.ready, s.script, s.sub, s.ppu, s.slot,
        s.slot0, s.slot1, s.slot2, s.slot3, s.slot4, s.trace_last, s.trace_seq,
        s.pc, s.crash_magic, s.crash_vector, s.crash_pc
    ))
end

log("=== REGISTER PROBE " .. ROM_VERSION .. " ===")
log("Goal: capture the register/name-entry screen after it settles.")
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

    if register_entry == nil and s.script == 14 then
        register_entry = frame_num
        log("register_entered frame=" .. frame_num)
        shot(ROM_VERSION .. "_register_entry_f" .. frame_num .. ".png")
    end

    if register_entry ~= nil then
        if s.script == 14 and s.ready == 1 and s.ppu == 0 then
            ready_stable = ready_stable + 1
        else
            ready_stable = 0
        end

        if ready_stable == SETTLE_FRAMES then
            log("register_settled frame=" .. frame_num)
            shot(ROM_VERSION .. "_register_settled_f" .. frame_num .. ".png")
            break
        end

        if frame_num - register_entry >= FALLBACK_DELAY then
            log("register_fallback_capture frame=" .. frame_num)
            shot(ROM_VERSION .. "_register_fallback_f" .. frame_num .. ".png")
            break
        end
    end

    prev = s
end

log("")
log("=== SUMMARY ===")
local final = read_state()
log_state("final", final)
if register_entry ~= nil then
    log("register_entry_frame=" .. register_entry)
end

if log_file then
    log_file:close()
end
