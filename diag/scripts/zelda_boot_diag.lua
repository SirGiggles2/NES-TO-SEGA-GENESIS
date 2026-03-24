-- zelda_boot_diag.lua
-- Early boot trace: script/sub/ready/ppu_idx/first-call flag.
-- ROM_VERSION is patched by run_boot_diag.ps1.

local ROM_VERSION = "v391"
local MAX_FRAMES = 1200

local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "boot_diag_" .. ROM_VERSION .. ".txt"

local ADDR_READY = 0xFF0011
local ADDR_SCRIPT = 0xFF0012
local ADDR_SUB = 0xFF0013
local ADDR_PPU_IDX = 0xFF0014
local ADDR_BOOT_FLAG = 0xFF00F4
local ADDR_TRACE_LAST = 0xFFF000
local ADDR_CRASH_MAGIC = 0xFFEE00
local ADDR_CRASH_VECTOR = 0xFFEE02
local ADDR_CRASH_PC = 0xFFEE0A

local f = io.open(OUT_PATH, "w")

local function log(msg)
    if f then
        f:write(msg .. "\n")
        f:flush()
    end
    print(msg)
end

local function get_pc_hex()
    local ok, regs = pcall(emu.getregisters)
    if not ok or type(regs) ~= "table" then
        return "------"
    end

    for _, key in ipairs({ "M68K PC", "68K PC", "PC", "pc", "PPC" }) do
        local value = regs[key]
        if type(value) == "number" then
            return string.format("%06X", value & 0xFFFFFF)
        end
    end

    return "------"
end

local prev_script = -1
local prev_sub = -1
local prev_ready = -1
local prev_ppu = -1
local prev_boot = -1
local prev_trace = -1
local prev_crash_magic = -1
local prev_crash_vector = -1
local prev_crash_pc = -1

log("=== BOOT DIAG " .. ROM_VERSION .. " ===")
log("Frame | Script | Sub | Ready | PpuIdx | 00F4 | Trace  | PC     | Crash           | Notes")
log(string.rep("-", 126))

for frame = 1, MAX_FRAMES do
    emu.frameadvance()

    local ready = memory.read_u8(ADDR_READY)
    local script = memory.read_u8(ADDR_SCRIPT)
    local sub = memory.read_u8(ADDR_SUB)
    local ppu = memory.read_u8(ADDR_PPU_IDX)
    local boot = memory.read_u8(ADDR_BOOT_FLAG)
    local trace = memory.read_u16_be(ADDR_TRACE_LAST)
    local pc_hex = get_pc_hex()
    local crash_magic = memory.read_u16_be(ADDR_CRASH_MAGIC)
    local crash_vector = memory.read_u16_be(ADDR_CRASH_VECTOR)
    local crash_pc = memory.read_u32_be(ADDR_CRASH_PC)
    local crash_hex = string.format("%04X/%04X/%08X", crash_magic & 0xFFFF, crash_vector & 0xFFFF, crash_pc)

    local notes = {}
    if script ~= prev_script then table.insert(notes, string.format("SCRIPT %d->%d", prev_script, script)) end
    if sub ~= prev_sub then table.insert(notes, string.format("SUB %d->%d", prev_sub, sub)) end
    if ready ~= prev_ready then table.insert(notes, string.format("READY %d->%d", prev_ready, ready)) end
    if ppu ~= prev_ppu then table.insert(notes, string.format("PPU 0x%02X->0x%02X", prev_ppu & 0xFF, ppu)) end
    if boot ~= prev_boot then table.insert(notes, string.format("00F4 %d->%d", prev_boot, boot)) end
    if trace ~= prev_trace then table.insert(notes, string.format("TRACE 0x%04X->0x%04X", prev_trace & 0xFFFF, trace)) end
    if crash_magic ~= prev_crash_magic or crash_vector ~= prev_crash_vector or crash_pc ~= prev_crash_pc then
        table.insert(notes, string.format("CRASH %04X/%04X/%08X->%s",
            prev_crash_magic & 0xFFFF, prev_crash_vector & 0xFFFF, prev_crash_pc & 0xFFFFFFFF, crash_hex))
    end

    if #notes > 0 or frame % 120 == 0 then
        local note = (#notes > 0) and table.concat(notes, "; ") or "heartbeat"
        log(string.format("%5d | %6d | %3d | %5d | 0x%02X   | %4d | 0x%04X | %s | %s | %s",
            frame, script, sub, ready, ppu, boot, trace, pc_hex, crash_hex, note))
    end

    prev_script = script
    prev_sub = sub
    prev_ready = ready
    prev_ppu = ppu
    prev_boot = boot
    prev_trace = trace
    prev_crash_magic = crash_magic
    prev_crash_vector = crash_vector
    prev_crash_pc = crash_pc
end

log("")
log("=== SUMMARY ===")
log(string.format("Final: script=%d sub=%d ready=%d ppu_idx=0x%02X 00F4=%d trace=0x%04X crash=%04X/%04X/%08X",
    memory.read_u8(ADDR_SCRIPT),
    memory.read_u8(ADDR_SUB),
    memory.read_u8(ADDR_READY),
    memory.read_u8(ADDR_PPU_IDX),
    memory.read_u8(ADDR_BOOT_FLAG),
    memory.read_u16_be(ADDR_TRACE_LAST),
    memory.read_u16_be(ADDR_CRASH_MAGIC),
    memory.read_u16_be(ADDR_CRASH_VECTOR),
    memory.read_u32_be(ADDR_CRASH_PC)))

if f then f:close() end
