-- zelda_phase2_debug.lua
-- Capture demo phase 2 state to debug freeze

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "phase2_debug.txt"

memory.usememorydomain("M68K BUS")
os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
local log_file = assert(io.open(OUT_PATH, "w"))
local function log(msg) log_file:write(msg .. "\n"); log_file:flush() end
local function r8(addr) return memory.read_u8(addr) or 0 end
local function r16(addr) return memory.read_u16_be(addr) or 0 end

log("=== PHASE 2 DEBUG ===")

local prev_frm = -1
local nmi_count = 0
local handler2_active = false
local consecutive_frozen = 0
local phase2_logged = false

for frame = 0, 3000 do
    emu.frameadvance()
    local frm = r8(0xFF0015)
    local rdy = r8(0xFF0011)
    local phase = r8(0xFF042D)
    local auto_demo = r8(0xFF042C)
    local ram_042E = r8(0xFF042E)
    local ram_0419 = r8(0xFF0419)
    local ram_0017 = r8(0xFF0017)
    local ram_0018 = r8(0xFF0018)
    local ptr_val = r16(0xFF0017)  -- big-endian read of the pointer

    if frm ~= prev_frm then
        nmi_count = nmi_count + 1
        consecutive_frozen = 0
    else
        consecutive_frozen = consecutive_frozen + 1
    end

    if rdy ~= 0 and not handler2_active then
        handler2_active = true
    end

    -- Log every frame during demo phase 2
    if auto_demo == 1 and phase == 2 and not phase2_logged then
        log(string.format("PHASE 2 START at f=%d nmi=%d", frame, nmi_count))
        -- Dump relevant RAM
        log(string.format("  ram_042E (text idx) = $%02X", ram_042E))
        log(string.format("  ram_0419 (anim idx) = $%02X", ram_0419))
        log(string.format("  ram_0017 (ptr lo)   = $%02X", ram_0017))
        log(string.format("  ram_0018 (ptr hi)   = $%02X", ram_0018))
        log(string.format("  ptr_val (BE word)   = $%04X", ptr_val))
        log(string.format("  ptr_val (LE swap)   = $%04X", ((ptr_val & 0xFF) * 256) + ((ptr_val >> 8) & 0xFF)))

        -- Dump tbl_915E data around ram_0419 index
        -- tbl_915E is in ROM - need to find its address
        -- From listing: it would be at the assembled address
        -- Let's dump ram_042E*2 bytes from the pointer table area
        log("  Text at pointer:")
        local ptr_le = ((ptr_val & 0xFF) * 256) + ((ptr_val >> 8) & 0xFF)
        if ptr_le > 0 and ptr_le < 0x10000 then
            local s = "    "
            for i = 0, 31 do
                local b = r8(ptr_le + i)
                s = s .. string.format("%02X ", b)
                if b == 0xFF then
                    s = s .. "(FF found at offset " .. i .. ")"
                    break
                end
            end
            log(s)
        end
        phase2_logged = true
    end

    -- Log every frame while in phase 2
    if auto_demo == 1 and phase == 2 then
        log(string.format("f=%05d frm=%3d 042E=$%02X 0419=$%02X ptr=$%02X%02X cfr=%d",
            frame, frm, ram_042E, ram_0419, ram_0017, ram_0018, consecutive_frozen))
    end

    -- Detect freeze
    if handler2_active and consecutive_frozen >= 10 then
        local pc = emu.getregister("M68K PC") or 0
        log(string.format("*** FREEZE at f=%d frm=%d nmi=%d PC=%06X ***", frame, frm, nmi_count, pc))
        log(string.format("  ram_042E=$%02X ram_0419=$%02X ptr=$%02X%02X",
            ram_042E, ram_0419, ram_0017, ram_0018))
        break
    end

    prev_frm = frm
end

log("=== PROBE COMPLETE ===")
log_file:close()
client.exit()
