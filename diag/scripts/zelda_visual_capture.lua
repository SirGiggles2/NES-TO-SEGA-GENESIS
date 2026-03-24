-- zelda_visual_capture.lua
-- Capture VDP state at key intro phases to diagnose visual issues

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "visual_capture.txt"

memory.usememorydomain("M68K BUS")
os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
local log_file = assert(io.open(OUT_PATH, "w"))
local function log(msg) log_file:write(msg .. "\n"); log_file:flush() end
local function r8(addr) return memory.read_u8(addr) or 0 end
local function r16(addr) return memory.read_u16_be(addr) or 0 end

log("=== VISUAL CAPTURE ===")

-- Also save screenshots at key moments
local screenshots_taken = {}

local prev_frm = -1
local prev_phase = -1
local prev_ad = -1
local nmi_count = 0
local handler2_active = false
local phase2_frame_count = 0

for frame = 0, 6000 do
    emu.frameadvance()
    local frm = r8(0xFF0015)
    local rdy = r8(0xFF0011)
    local phase = r8(0xFF042D)
    local auto_demo = r8(0xFF042C)
    local scroll_Y = r8(0xFF00FC)
    local scroll_X = r8(0xFF00FD)

    if frm ~= prev_frm then
        nmi_count = nmi_count + 1
    end
    if rdy ~= 0 then handler2_active = true end

    -- Take screenshots at key moments
    local key = string.format("ad%d_ph%d", auto_demo, phase)

    -- Screenshot on phase transitions
    if (phase ~= prev_phase or auto_demo ~= prev_ad) and handler2_active then
        if not screenshots_taken[key] then
            screenshots_taken[key] = true
            local ss_path = OUT_DIR .. "ss_" .. key .. ".png"
            client.screenshot(ss_path)
            log(string.format("SCREENSHOT: %s at f=%d nmi=%d sy=$%02X sx=$%02X", key, frame, nmi_count, scroll_Y, scroll_X))
        end
    end

    -- During phase 2, take periodic screenshots and dump sprite/palette state
    if auto_demo == 1 and phase == 2 then
        phase2_frame_count = phase2_frame_count + 1

        -- Take screenshots every 500 NMI ticks during phase 2
        if phase2_frame_count == 1 or phase2_frame_count == 100 or phase2_frame_count == 300 or phase2_frame_count == 600 then
            local ss_path = OUT_DIR .. "ss_phase2_f" .. phase2_frame_count .. ".png"
            client.screenshot(ss_path)
            log(string.format("PHASE2 SCREENSHOT at phase2_frame=%d f=%d nmi=%d", phase2_frame_count, frame, nmi_count))

            -- Dump OAM data (first 11 sprites, 4 bytes each)
            log("  OAM (Y, Tile, Attr, X):")
            for spr = 0, 10 do
                local base = 0xFF0200 + (spr * 4)
                local y = r8(base)
                local tile = r8(base + 1)
                local attr = r8(base + 2)
                local x = r8(base + 3)
                log(string.format("    Spr%02d: Y=$%02X T=$%02X A=$%02X X=$%02X", spr, y, tile, attr, x))
            end

            -- Dump palette shadow (first 32 bytes)
            log("  Palette shadow ($FF0300? or PPU_PAL_SHADOW):")
            -- Try reading from common palette shadow locations
            local pal_s = "    "
            for i = 0, 31 do
                pal_s = pal_s .. string.format("%02X ", r8(0xFF8000 + i))
            end
            log(pal_s)

            -- Dump Genesis CRAM via VDP
            -- Can't read CRAM directly from Lua easily, but dump RAM palette shadow

            -- Dump PPU buffer area
            log("  PPU buffer ($FF0302-$FF0325):")
            local buf_s = "    "
            for i = 0, 35 do
                buf_s = buf_s .. string.format("%02X ", r8(0xFF0302 + i))
            end
            log(buf_s)
        end
    end

    -- Also capture title screen and fade
    if auto_demo == 0 and phase == 0 and nmi_count == 100 and not screenshots_taken["title_100"] then
        screenshots_taken["title_100"] = true
        client.screenshot(OUT_DIR .. "ss_title.png")
        log("TITLE SCREENSHOT at nmi=100")

        -- Dump palette
        log("  Palette shadow:")
        local pal_s = "    "
        for i = 0, 31 do
            pal_s = pal_s .. string.format("%02X ", r8(0xFF8000 + i))
        end
        log(pal_s)
    end

    if auto_demo == 0 and phase == 1 and nmi_count > 600 and not screenshots_taken["fade_mid"] then
        screenshots_taken["fade_mid"] = true
        client.screenshot(OUT_DIR .. "ss_fade_mid.png")
        log("FADE MID SCREENSHOT at nmi=" .. nmi_count)
    end

    prev_phase = phase
    prev_ad = auto_demo
    prev_frm = frm
end

log("=== PROBE COMPLETE ===")
log_file:close()
client.exit()
