-- zelda_script3_diag.lua
-- Deep per-frame trace of script=3+ world-load through to gameplay
-- Monitors: script, subscript, screen_ready_flag, ppu_load_index, ram_007C, ram_007D
-- ROM_VERSION is patched by run_script3_diag.ps1 before launch

local ROM_VERSION  = "zelda_v393"   -- patched by PS launcher
local MAX_FRAMES   = 12000

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "script3_diag_" .. ROM_VERSION .. ".txt"

local ADDR_SCREEN_READY = 0xFF0011
local ADDR_SCRIPT       = 0xFF0012
local ADDR_SUBSCRIPT    = 0xFF0013
local ADDR_PPU_LOAD_IDX = 0xFF0014
local ADDR_RAM_007C     = 0xFF007C
local ADDR_RAM_007D     = 0xFF007D
local ADDR_RENDER_FLAG  = 0xFF0017
local ADDR_TIMER_LINK   = 0xFF0028
local ADDR_TRACE_LAST   = 0xFFF000
local ADDR_CRASH_MAGIC  = 0xFFEE00
local ADDR_CRASH_VECTOR = 0xFFEE02
local ADDR_CRASH_PC     = 0xFFEE0A

local frame_num   = 0
local log_file    = io.open(OUT_PATH, "w")

local function log(msg)
    if log_file then
        log_file:write(msg .. "\n")
        log_file:flush()
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

log("=== SCRIPT3+ DIAGNOSTICS " .. ROM_VERSION .. " ===")
log("Addresses: ready=FF0011 script=FF0012 sub=FF0013 ppu_idx=FF0014 007C=FF007C timer=FF0028")
log("Handler: ready=0 -> PRIMARY; ready!=0 -> SECONDARY")
log("")
log("Frame | Scr | Sub | Ready | PpuIdx | 007C | 007D | Rendr | Timer | Trace  | PC     | Crash           | Notes")
log(string.rep("-", 130))

local prev_script    = 0
local prev_sub       = 0
local prev_ready     = 0
local prev_ppu       = 0
local prev_007c      = 0
local prev_render    = 0
local prev_timer     = 0
local prev_trace     = -1
local prev_crash_magic  = -1
local prev_crash_vector = -1
local prev_crash_pc     = -1

local script3_entry_frame = nil
local script3_frames      = 0
local stall_script = -1
local stall_sub    = -1
local stall_count  = 0
local max_stall    = 0

while frame_num < MAX_FRAMES do
    emu.frameadvance()
    frame_num = frame_num + 1

    local script    = memory.read_u8(ADDR_SCRIPT)
    local subscript = memory.read_u8(ADDR_SUBSCRIPT)
    local ready     = memory.read_u8(ADDR_SCREEN_READY)
    local ppu_idx   = memory.read_u8(ADDR_PPU_LOAD_IDX)
    local r007c     = memory.read_u8(ADDR_RAM_007C)
    local r007d     = memory.read_u8(ADDR_RAM_007D)
    local render    = memory.read_u8(ADDR_RENDER_FLAG)
    local timer     = memory.read_u8(ADDR_TIMER_LINK)
    local trace     = memory.read_u16_be(ADDR_TRACE_LAST)
    local crash_magic = memory.read_u16_be(ADDR_CRASH_MAGIC)
    local crash_vector = memory.read_u16_be(ADDR_CRASH_VECTOR)
    local crash_pc     = memory.read_u32_be(ADDR_CRASH_PC)
    local pc_hex = get_pc_hex()
    local crash_hex = string.format("%04X/%04X/%08X", crash_magic & 0xFFFF, crash_vector & 0xFFFF, crash_pc)

    local should_log = false
    local notes = {}

    if script == stall_script and subscript == stall_sub then
        stall_count = stall_count + 1
        if stall_count > max_stall then max_stall = stall_count end
    else
        stall_count = 0
        stall_script = script
        stall_sub = subscript
    end

    if script ~= prev_script then
        table.insert(notes, string.format("SCRIPT %d->%d", prev_script, script))
        should_log = true
        if script == 3 then script3_entry_frame = frame_num end
    end
    if subscript ~= prev_sub then
        table.insert(notes, string.format("SUB %d->%d", prev_sub, subscript))
        should_log = true
    end

    if script >= 3 and script <= 5 then
        if script == 3 then script3_frames = script3_frames + 1 end

        if ready ~= prev_ready then
            table.insert(notes, string.format("READY %d->%d", prev_ready, ready))
            should_log = true
        end
        if ppu_idx ~= prev_ppu then
            table.insert(notes, string.format("PPU_IDX 0x%02X->0x%02X", prev_ppu, ppu_idx))
            should_log = true
        end
        if r007c ~= prev_007c then
            table.insert(notes, string.format("007C %d->%d", prev_007c, r007c))
            should_log = true
        end
        if render ~= prev_render then
            table.insert(notes, string.format("RENDER %d->%d", prev_render, render))
            should_log = true
        end
        if timer ~= prev_timer or trace ~= prev_trace then
            should_log = true
        end
        if crash_magic ~= prev_crash_magic or crash_vector ~= prev_crash_vector or crash_pc ~= prev_crash_pc then
            should_log = true
        end

        if script3_frames > 0 and script3_frames % 60 == 0 then
            should_log = true
            if #notes == 0 then table.insert(notes, "heartbeat") end
        end
        if script == 4 and frame_num % 60 == 0 then
            should_log = true
            if #notes == 0 then table.insert(notes, "heartbeat") end
        end
    else
        if frame_num % 300 == 0 then
            should_log = true
            if #notes == 0 then table.insert(notes, "heartbeat") end
        end
    end

    if should_log then
        log(string.format("%5d | %3d | %3d | %5d | 0x%02X   | %4d | %4d | %5d | %5d | 0x%04X | %s | %s | %s",
            frame_num, script, subscript, ready, ppu_idx, r007c, r007d, render, timer,
            trace, pc_hex, crash_hex, table.concat(notes, "; ")))
    end

    prev_script = script
    prev_sub    = subscript
    prev_ready  = ready
    prev_ppu    = ppu_idx
    prev_007c   = r007c
    prev_render = render
    prev_timer  = timer
    prev_trace  = trace
    prev_crash_magic = crash_magic
    prev_crash_vector = crash_vector
    prev_crash_pc = crash_pc

    if script >= 5 and frame_num > 200 then
        log("")
        log(string.format("*** GAMEPLAY REACHED frame=%d script=%d sub=%d ***", frame_num, script, subscript))
        break
    end

    if stall_count > 3000 and script >= 3 then
        log("")
        log(string.format("*** STUCK: script=%d sub=%d for %d frames (ready=%d ppu=0x%02X 007C=%d timer=%d trace=0x%04X pc=%s crash=%s)",
            script, subscript, stall_count, ready, ppu_idx, r007c, timer, trace, pc_hex, crash_hex))
        if script == 3 and subscript <= 2 then
            log("   -> Early script-3 stall: check PPU request routing / legacy termination")
        elseif script == 3 and ready == 1 then
            log("   -> Secondary handler stuck: likely curtain or its RAM PPU buffer builder")
        elseif script == 3 then
            log("   -> Primary handler stuck at subscript " .. subscript)
        elseif script == 4 then
            log("   -> Screen transition end stuck (check ofs_main_script_1_0x01478B_04)")
        end
        break
    end

    if script == 1 and frame_num > 2000 then
        log("")
        log("*** STUCK in slot select at frame " .. frame_num)
        break
    end
end

log("")
log("=== SUMMARY ===")
log(string.format("Final: script=%d sub=%d ready=%d ppu_idx=0x%02X 007C=%d timer=%d trace=0x%04X crash=%04X/%04X/%08X",
    memory.read_u8(ADDR_SCRIPT),
    memory.read_u8(ADDR_SUBSCRIPT),
    memory.read_u8(ADDR_SCREEN_READY),
    memory.read_u8(ADDR_PPU_LOAD_IDX),
    memory.read_u8(ADDR_RAM_007C),
    memory.read_u8(ADDR_TIMER_LINK),
    memory.read_u16_be(ADDR_TRACE_LAST),
    memory.read_u16_be(ADDR_CRASH_MAGIC),
    memory.read_u16_be(ADDR_CRASH_VECTOR),
    memory.read_u32_be(ADDR_CRASH_PC)))
log("Total frames: " .. frame_num)
log("Max stall: " .. max_stall .. " frames at script=" .. stall_script .. " sub=" .. stall_sub)
if script3_entry_frame then
    log(string.format("Script=3 entered at frame %d, spent %d frames inside", script3_entry_frame, script3_frames))
end

if log_file then log_file:close() end
if client and type(client.exit) == "function" then
    client.exit()
end
