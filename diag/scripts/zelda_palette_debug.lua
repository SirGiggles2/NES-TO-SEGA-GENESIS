-- zelda_palette_debug.lua
-- Debug palette pipeline: PPU buffer → PAL_SHADOW → CRAM

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "palette_debug.txt"

memory.usememorydomain("M68K BUS")
os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
local log_file = assert(io.open(OUT_PATH, "w"))
local function log(msg) log_file:write(msg .. "\n"); log_file:flush() end
local function r8(addr) return memory.read_u8(addr) or 0 end
local function r16(addr) return memory.read_u16_be(addr) or 0 end

log("=== PALETTE DEBUG ===")

local PPU_PAL_SHADOW = 0xFF9200  -- actual address from vdp_layer.asm
local PPU_NT_SHADOW  = 0xFF8200
local PPUMASK_SHADOW = 0xFFEF01
local PPUCTRL_SHADOW = 0xFFEF00

local prev_frm = -1
local nmi_count = 0
local handler2_active = false
local last_dump = -100

for frame = 0, 4000 do
    emu.frameadvance()
    local frm = r8(0xFF0015)
    local rdy = r8(0xFF0011)
    local phase = r8(0xFF042D)
    local auto_demo = r8(0xFF042C)
    local script = r8(0xFF0012)  -- ram_script

    if frm ~= prev_frm then
        nmi_count = nmi_count + 1
    end
    if rdy ~= 0 then handler2_active = true end

    -- Dump palette state at key NMI counts
    local should_dump = false
    if nmi_count == 5 or nmi_count == 20 or nmi_count == 100 or nmi_count == 400
       or nmi_count == 530 or nmi_count == 700 or nmi_count == 965 or nmi_count == 1100
       or nmi_count == 1700 or nmi_count == 2000 then
        if nmi_count ~= last_dump then
            should_dump = true
            last_dump = nmi_count
        end
    end

    if should_dump then
        log(string.format("\n--- NMI=%d f=%d ad=%d ph=%d script=%d ---", nmi_count, frame, auto_demo, phase, script))

        -- PPU control shadows
        log(string.format("  PPUCTRL=$%02X PPUMASK=$%02X", r8(PPUCTRL_SHADOW), r8(PPUMASK_SHADOW)))

        -- PPU_PAL_SHADOW (32 bytes at $FF9200)
        log("  PPU_PAL_SHADOW ($FF9200):")
        local s1 = "    BG: "
        for i = 0, 15 do
            s1 = s1 .. string.format("%02X ", r8(PPU_PAL_SHADOW + i))
        end
        log(s1)
        local s2 = "    SP: "
        for i = 16, 31 do
            s2 = s2 .. string.format("%02X ", r8(PPU_PAL_SHADOW + i))
        end
        log(s2)

        -- PPU buffer first 40 bytes
        log("  PPU buffer ($FF0302):")
        local sb = "    "
        for i = 0, 39 do
            sb = sb .. string.format("%02X ", r8(0xFF0302 + i))
        end
        log(sb)

        -- ram_0301_buffer_index
        log(string.format("  ram_0301 (buf_idx)=$%02X", r8(0xFF0301)))

        -- ram_ppu_load_index
        log(string.format("  ram_005C=$%02X", r8(0xFF005C)))

        -- Nametable shadow first 64 bytes (for scroll debug)
        if nmi_count >= 965 then
            log("  NT_SHADOW first row ($FF8200):")
            local sn = "    "
            for i = 0, 31 do
                sn = sn .. string.format("%02X ", r8(PPU_NT_SHADOW + i))
            end
            log(sn)
        end

        -- Screenshot
        local ss_path = OUT_DIR .. "ss_pal_nmi" .. nmi_count .. ".png"
        client.screenshot(ss_path)
    end

    prev_frm = frm
end

log("\n=== PROBE COMPLETE ===")
log_file:close()
client.exit()
