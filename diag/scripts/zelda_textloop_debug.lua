-- zelda_textloop_debug.lua
-- Detailed debug of text loading loop in demo phase 2

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "textloop_debug.txt"

memory.usememorydomain("M68K BUS")
os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
local log_file = assert(io.open(OUT_PATH, "w"))
local function log(msg) log_file:write(msg .. "\n"); log_file:flush() end
local function r8(addr) return memory.read_u8(addr) or 0 end
local function r16(addr) return memory.read_u16_be(addr) or 0 end

log("=== TEXT LOOP DEBUG ===")

local prev_frm = -1
local nmi_count = 0
local handler2_active = false
local consecutive_frozen = 0
local phase2_entered = false

for frame = 0, 3000 do
    emu.frameadvance()
    local frm = r8(0xFF0015)
    local rdy = r8(0xFF0011)
    local phase = r8(0xFF042D)
    local auto_demo = r8(0xFF042C)

    if frm ~= prev_frm then
        nmi_count = nmi_count + 1
        consecutive_frozen = 0
    else
        consecutive_frozen = consecutive_frozen + 1
    end

    if rdy ~= 0 and not handler2_active then
        handler2_active = true
    end

    -- When entering phase 2, dump key state every frame
    if auto_demo == 1 and phase == 2 then
        local ram_042E = r8(0xFF042E)
        local ram_0419 = r8(0xFF0419)
        local ram_0000 = r8(0xFF0000)
        local ram_0001 = r8(0xFF0001)
        local ptr_word = r16(0xFF0000)  -- big-endian read
        local ram_041B = r8(0xFF041B)
        local ram_041C = r8(0xFF041C)
        local ram_041D = r8(0xFF041D)

        if not phase2_entered then
            phase2_entered = true
            log(string.format("PHASE 2 ENTERED at f=%d nmi=%d", frame, nmi_count))
            log(string.format("  ram_042E=$%02X ram_0419=$%02X", ram_042E, ram_0419))
            log(string.format("  ram_0000=$%02X ram_0001=$%02X (ptr_word_BE=$%04X)", ram_0000, ram_0001, ptr_word))
            log(string.format("  ram_041B=$%02X ram_041C=$%02X ram_041D=$%02X", ram_041B, ram_041C, ram_041D))

            -- Dump tbl_915E first 16 bytes from ROM
            local tbl_addr = 0xD1B0  -- from listing
            log("  tbl_915E first 16 bytes:")
            local s = "    "
            for i = 0, 15 do
                s = s .. string.format("%02X ", r8(tbl_addr + i))
            end
            log(s)

            -- Dump tbl_94AD first 8 bytes from ROM
            local tbl2_addr = 0xD85E  -- from listing
            log("  tbl_94AD first 8 bytes:")
            s = "    "
            for i = 0, 7 do
                s = s .. string.format("%02X ", r8(tbl2_addr + i))
            end
            log(s)

            -- Dump text at $D41A first 40 bytes
            local text_addr = 0xD41A
            log("  Text at $D41A first 40 bytes:")
            s = "    "
            for i = 0, 39 do
                local b = r8(text_addr + i)
                s = s .. string.format("%02X ", b)
                if b == 0xFF then
                    s = s .. "(FF at offset " .. i .. ")"
                    break
                end
            end
            log(s)
        end

        -- Log every frame while in phase 2
        log(string.format("f=%05d frm=%3d 042E=$%02X 0419=$%02X 0000=$%02X 0001=$%02X 041B=$%02X cfr=%d",
            frame, frm, ram_042E, ram_0419, ram_0000, ram_0001, ram_041B, consecutive_frozen))
    end

    -- Detect freeze
    if handler2_active and consecutive_frozen >= 10 then
        local pc = emu.getregister("M68K PC") or 0
        local d0 = emu.getregister("M68K D0") or 0
        local d1 = emu.getregister("M68K D1") or 0
        local d2 = emu.getregister("M68K D2") or 0
        local d5 = emu.getregister("M68K D5") or 0
        local a0 = emu.getregister("M68K A0") or 0
        local a1 = emu.getregister("M68K A1") or 0
        log(string.format("*** FREEZE at f=%d frm=%d nmi=%d PC=%06X ***", frame, frm, nmi_count, pc))
        log(string.format("  D0=%08X D1=%08X D2=%08X D5=%08X", d0, d1, d2, d5))
        log(string.format("  A0=%08X A1=%08X", a0, a1))
        log(string.format("  ram_0000=$%02X ram_0001=$%02X", r8(0xFF0000), r8(0xFF0001)))

        -- Read what's at A0+D2 (the loop read address)
        local read_addr = (a0 + (d2 % 65536)) % 16777216  -- 24-bit wrap
        log(string.format("  Reading from A0+D2.W = $%06X: $%02X", read_addr, r8(read_addr)))

        break
    end

    prev_frm = frm
end

log("=== PROBE COMPLETE ===")
log_file:close()
client.exit()
