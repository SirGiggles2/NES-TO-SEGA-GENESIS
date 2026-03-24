-- zelda_register_pc_probe.lua
-- Focused execution probe for register/name-entry init.

local ROM_VERSION = "zelda_v411"
local MAX_FRAMES = 2600
local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "register_pc_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY        = 0xFF0011
local ADDR_SCRIPT       = 0xFF0012
local ADDR_SUBSCRIPT    = 0xFF0013
local ADDR_PPU_LOAD     = 0xFF0014
local ADDR_CUR_SLOT     = 0xFF0016
local ADDR_TRACE_LAST   = 0xFFF000
local ADDR_TRACE_SEQ    = 0xFFF002
local ADDR_CRASH_MAGIC  = 0xFFEE00
local ADDR_CRASH_VECTOR = 0xFFEE02
local ADDR_CRASH_PC     = 0xFFEE0A
local ADDR_041F         = 0xFF041F
local ADDR_0420         = 0xFF0420
local ADDR_0421         = 0xFF0421
local ADDR_0423         = 0xFF0423
local ADDR_0426         = 0xFF0426
local ADDR_0301         = 0xFF0301

memory.usememorydomain("M68K BUS")

local function ensure_dir(path)
    os.execute('if not exist "' .. path .. '" mkdir "' .. path .. '"')
end

ensure_dir(OUT_DIR)
local log_file = io.open(OUT_PATH, "w")

local function log(msg)
    if log_file then
        log_file:write(msg .. "\n")
        log_file:flush()
    end
    print(msg)
end

local function get_pc()
    local ok, regs = pcall(emu.getregisters)
    if ok and type(regs) == "table" then
        for _, key in ipairs({ "M68K PC", "68K PC", "PC", "pc", "PPC" }) do
            if type(regs[key]) == "number" then
                return regs[key] & 0xFFFFFF
            end
        end
    end
    return 0
end

local function read_state()
    return {
        ready = memory.read_u8(ADDR_READY),
        script = memory.read_u8(ADDR_SCRIPT),
        sub = memory.read_u8(ADDR_SUBSCRIPT),
        ppu = memory.read_u8(ADDR_PPU_LOAD),
        slot = memory.read_u8(ADDR_CUR_SLOT),
        trace_last = memory.read_u16_be(ADDR_TRACE_LAST),
        trace_seq = memory.read_u16_be(ADDR_TRACE_SEQ),
        crash_magic = memory.read_u16_be(ADDR_CRASH_MAGIC),
        crash_vector = memory.read_u16_be(ADDR_CRASH_VECTOR),
        crash_pc = memory.read_u32_be(ADDR_CRASH_PC),
        pc = get_pc(),
        a41f = memory.read_u8(ADDR_041F),
        a420 = memory.read_u8(ADDR_0420),
        a421 = memory.read_u8(ADDR_0421),
        a423 = memory.read_u8(ADDR_0423),
        a426 = memory.read_u8(ADDR_0426),
        b301 = memory.read_u8(ADDR_0301),
    }
end

local function fmt_state(frame, prefix, s)
    return string.format(
        "%s frame=%d ready=%d script=%d sub=%d ppu=%02X slot=%d trace=%04X/%04X pc=%06X crash=%04X/%04X/%08X vars=[041F=%02X 0420=%02X 0421=%02X 0423=%02X 0426=%02X 0301=%02X]",
        prefix, frame, s.ready, s.script, s.sub, s.ppu, s.slot, s.trace_last, s.trace_seq,
        s.pc, s.crash_magic, s.crash_vector, s.crash_pc, s.a41f, s.a420, s.a421, s.a423, s.a426, s.b301
    )
end

log("=== REGISTER PC PROBE " .. ROM_VERSION .. " ===")
log("")

local prev = nil
local entered = false
local entry_frame = 0

for frame = 1, MAX_FRAMES do
    emu.frameadvance()
    local s = read_state()

    local changed = (prev == nil)
        or s.ready ~= prev.ready
        or s.script ~= prev.script
        or s.sub ~= prev.sub
        or s.ppu ~= prev.ppu
        or s.slot ~= prev.slot
        or s.pc ~= prev.pc
        or s.a420 ~= prev.a420
        or s.a421 ~= prev.a421
        or s.a423 ~= prev.a423
        or s.a426 ~= prev.a426
        or s.b301 ~= prev.b301

    if changed then
        log(fmt_state(frame, "state", s))
    end

    if not entered and s.script == 14 then
        entered = true
        entry_frame = frame
        log("register_entered frame=" .. frame)
    end

    if entered and frame % 60 == 0 then
        log(fmt_state(frame, "sample", s))
    end

    if entered and frame - entry_frame >= 1200 then
        log("probe_done frame=" .. frame)
        break
    end

    prev = s
end

log("")
log("=== SUMMARY ===")
local final = read_state()
log(fmt_state(MAX_FRAMES, "final", final))

if log_file then
    log_file:close()
end
