-- zelda_scroll_overlay.lua
-- Interactive BizHawk overlay: pixel coordinate rulers + live VDP scroll state.
-- Purpose: visually confirm Plane A Y-scroll is clamped to 0 on the title screen.
--
-- Usage: Load zelda ROM in BizHawk, then load this script via Lua Console.
--        Does NOT auto-close BizHawk.  No output file produced.
--
-- Key readouts (top-right HUD):
--   ram_scroll_Y  : NES ZP $FC — the value the NMI writes to VSRAM each frame
--   PPUSCROLL_Y   : PPU scroll shadow in 68K RAM ($FFEF06)
--   VSRAM[0]      : What the VDP actually uses for Plane A Y-scroll (highlighted RED if ≠ 0)
--   script/sub    : Current front-end phase
--
-- Pixel rulers:
--   Left  : Y scanline ticks every 8px, label every 16px
--   Top   : X column  ticks every 8px, label every 32px

memory.usememorydomain("M68K BUS")

-- ── RAM addresses (M68K BUS, 24-bit) ──────────────────────────────────────
local ADDR_SCRIPT       = 0xFF0012   -- ram_script     (con_script_*)
local ADDR_SUB          = 0xFF0013   -- ram_subscript
local ADDR_SCROLL_Y     = 0xFF00FC   -- ram_scroll_Y   (NES ZP $FC)
local ADDR_PPUSCROLL_Y  = 0xFFEF06   -- PPUSCROLL_Y shadow (written by PPU_WRITE_2005)

-- ── Script name table ─────────────────────────────────────────────────────
local SCRIPT_NAMES = {
    [0]  = "title",
    [1]  = "intro",
    [2]  = "file_sel",
    [3]  = "register",
    [4]  = "trans",
    [5]  = "gameplay",
}

-- ── Screen dimensions (Genesis Mode 5, 320x224) ───────────────────────────
local SW, SH = 320, 224

-- ── Helpers ───────────────────────────────────────────────────────────────
local function r8(addr)
    return memory.read_u8(addr, "M68K BUS")
end

-- Read VSRAM[0] (Plane A full-screen Y scroll, word at offset 0).
-- BizHawk Genesis exposes a dedicated "VSRAM" domain (80 bytes).
-- Falls back to nil if the domain is unavailable on this BizHawk build.
local function read_vsram_y()
    local ok, val = pcall(function()
        return memory.read_u16_be(0, "VSRAM")
    end)
    return ok and val or nil
end

-- ── Per-frame overlay ─────────────────────────────────────────────────────
event.onframeend(function()

    -- ── Left Y ruler (scanline numbers) ─────────────────────────────────
    for y = 0, SH - 1, 8 do
        gui.drawLine(0, y, 4, y, "#FFFF0066")
        if y % 16 == 0 then
            gui.drawText(5, y - 1, tostring(y), "#FFFF00CC", nil, 7)
        end
    end

    -- ── Top X ruler (column numbers) ────────────────────────────────────
    for x = 0, SW - 1, 8 do
        gui.drawLine(x, 0, x, 4, "#00FFFF66")
        if x % 32 == 0 and x > 0 then
            gui.drawText(x + 1, 5, tostring(x), "#00FFFFCC", nil, 7)
        end
    end

    -- ── HUD data reads ───────────────────────────────────────────────────
    local script_id  = r8(ADDR_SCRIPT)
    local sub_id     = r8(ADDR_SUB)
    local scroll_y   = r8(ADDR_SCROLL_Y)
    local ppusc_y    = r8(ADDR_PPUSCROLL_Y)
    local vsram_y    = read_vsram_y()

    local s_name = SCRIPT_NAMES[script_id] or string.format("s%d", script_id)

    -- ── Build HUD lines ──────────────────────────────────────────────────
    local hud = {
        { text = string.format("script  %-8s sub=%d", s_name, sub_id),  color = "#FFFFFF" },
        { text = string.format("ram_scroll_Y  %3d (0x%02X)", scroll_y, scroll_y), color = "#FFFFFF" },
        { text = string.format("PPUSCROLL_Y   %3d (0x%02X)", ppusc_y, ppusc_y),  color = "#FFFFFF" },
    }

    if vsram_y ~= nil then
        -- Red when non-zero — that is the scroll-drift bug.  Green when clamped.
        local vcolor = (vsram_y ~= 0) and "#FF5555" or "#55FF55"
        hud[#hud+1] = { text = string.format("VSRAM[0]      %3d (0x%04X)", vsram_y, vsram_y), color = vcolor }
    else
        hud[#hud+1] = { text = "VSRAM domain  unavailable", color = "#AAAAAA" }
    end

    -- ── Draw HUD box in top-right corner ─────────────────────────────────
    local LINE_H = 12
    local HUD_W  = 210
    local HUD_H  = #hud * LINE_H + 6
    local HX     = SW - HUD_W - 2
    local HY     = 2

    gui.drawRectangle(HX - 2, HY - 2, HUD_W + 4, HUD_H, "#000000BB", "#000000BB")
    for i, entry in ipairs(hud) do
        gui.drawText(HX, HY + (i - 1) * LINE_H, entry.text, entry.color, nil, 9)
    end

    -- ── Soft horizontal line at Y = VSRAM[0] when non-zero ───────────────
    -- Shows exactly where the VDP thinks the top of Plane A is.
    if vsram_y and vsram_y > 0 and vsram_y < SH then
        gui.drawLine(0, vsram_y, SW - 1, vsram_y, "#FF555566")
        gui.drawText(46, vsram_y + 1, string.format("← VSRAM Y=%d", vsram_y), "#FF5555", nil, 8)
    end

end)

print("[scroll_overlay] loaded — rulers + VSRAM readout active")
