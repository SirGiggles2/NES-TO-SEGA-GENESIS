-- zelda_cram_brightness_probe.lua
-- Diagnose "too dark" issue: dump CRAM values at title, file-select, and gameplay
-- to verify VDP_LIFT_HARDWARE_COLOR is actually being applied.
-- Also reads VDP register $0C status to check for shadow/highlight mode.

local ROM_VERSION = "zelda_v707"
local MAX_FRAMES = 900  -- ~15 seconds at 60fps

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "cram_brightness_probe_" .. ROM_VERSION .. ".txt"

local ADDR_SCRIPT   = 0xFF0012
local ADDR_SUB      = 0xFF0013
local PPU_PAL_SHADOW = 0xFF9200

-- Expected CRAM values for key NES indices AFTER gamma 0.65 + 2-level lift.
-- Format: NES index -> expected CRAM word (post-lift)
local EXPECTED_LIFTED = {
    [0x00] = 0x0CCC,  -- gray (124,124,124): table $0888, lift -> $0CCC
    [0x0F] = 0x0000,  -- black: stays $0000
    [0x10] = 0x0EEE,  -- lt gray (188): table $0CCC, lift -> $0EEE
    [0x16] = 0x00AE,  -- red-orange (248,56,0): table $006E, lift -> $00AE
    [0x20] = 0x0EEE,  -- near-white (248): table $0EEE, lift -> $0EEE
    [0x27] = 0x0AEE,  -- orange (252,160,68): table $06AE, lift -> $0AEE
    [0x29] = 0x08EE,  -- green (0,168,68): table $04EC, lift -> $08EE
    [0x30] = 0x0EEE,  -- white (252): table $0EEE, lift -> $0EEE
}

-- Expected RAW (unlifted) table values for same indices
local EXPECTED_RAW = {
    [0x00] = 0x0888,
    [0x0F] = 0x0000,
    [0x10] = 0x0CCC,
    [0x16] = 0x006E,
    [0x20] = 0x0EEE,
    [0x27] = 0x06AE,
    [0x29] = 0x04EC,
    [0x30] = 0x0EEE,
}

-- Script IDs
local SCRIPT_TITLE    = 0x00
local SCRIPT_FILE_SEL = 0x01
local SCRIPT_GAMEPLAY = 0x03

memory.usememorydomain("M68K BUS")
os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
os.execute('if not exist "' .. OUT_DIR .. 'screens\\" mkdir "' .. OUT_DIR .. 'screens\\"')

local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
end

local function hex(v, width)
    return string.format("%0" .. tostring(width or 2) .. "X", v or 0)
end

local function read_u8(addr)
    return memory.read_u8(addr) or 0
end

local function with_domain(domain, fn)
    local ok = pcall(memory.usememorydomain, domain)
    if not ok then
        log("ERROR: missing domain " .. domain)
        return
    end
    fn()
    memory.usememorydomain("M68K BUS")
end

local function read_cram()
    local cram = {}
    with_domain("CRAM", function()
        for i = 0, 63 do
            cram[i] = memory.read_u16_be(i * 2) or 0
        end
    end)
    return cram
end

local function dump_cram(cram)
    for first = 0, 63, 16 do
        local parts = {}
        for i = 0, 15 do
            parts[#parts + 1] = hex(cram[first + i], 4)
        end
        log(string.format("  cram[%02X-%02X]=%s", first, first + 15, table.concat(parts, " ")))
    end
end

local function read_shadow_palette()
    local shadow = {}
    for i = 0, 31 do
        shadow[i] = read_u8(PPU_PAL_SHADOW + i)
    end
    return shadow
end

local function dump_shadow(shadow)
    local bg = {}
    for i = 0, 15 do bg[#bg + 1] = hex(shadow[i], 2) end
    log("  ppu_shadow_bg =" .. table.concat(bg, " "))
    local sp = {}
    for i = 16, 31 do sp[#sp + 1] = hex(shadow[i], 2) end
    log("  ppu_shadow_spr=" .. table.concat(sp, " "))
end

local function check_lift_applied(cram, shadow)
    -- For each key NES index used in shadow palette, check if CRAM has
    -- the lifted value or the raw value (or something else entirely)
    log("  === LIFT VERIFICATION ===")
    local lifted_count = 0
    local raw_count = 0
    local other_count = 0

    -- Check BG palette line 0, colors 1-3 (CRAM 01-03)
    for color = 1, 3 do
        local nes_idx = shadow[color]  -- NES index from shadow
        local cram_word = cram[color]   -- actual CRAM value
        local exp_lifted = EXPECTED_LIFTED[nes_idx]
        local exp_raw = EXPECTED_RAW[nes_idx]

        local status = "?"
        if exp_lifted and cram_word == exp_lifted then
            status = "LIFTED"
            lifted_count = lifted_count + 1
        elseif exp_raw and cram_word == exp_raw then
            status = "RAW (no lift!)"
            raw_count = raw_count + 1
        else
            status = "UNKNOWN"
            other_count = other_count + 1
        end

        log(string.format("    pal0_color%d: NES=$%02X  CRAM=$%04X  expected_lifted=$%s  expected_raw=$%s  => %s",
            color, nes_idx, cram_word,
            exp_lifted and hex(exp_lifted, 4) or "????",
            exp_raw and hex(exp_raw, 4) or "????",
            status))
    end

    -- Check backdrop (color 0 of line 0 = shadow[0])
    local bg_nes = shadow[0]
    local bg_cram = cram[0]
    local bg_exp_l = EXPECTED_LIFTED[bg_nes]
    local bg_exp_r = EXPECTED_RAW[bg_nes]
    local bg_status = "?"
    if bg_exp_l and bg_cram == bg_exp_l then bg_status = "LIFTED"; lifted_count = lifted_count + 1
    elseif bg_exp_r and bg_cram == bg_exp_r then bg_status = "RAW"; raw_count = raw_count + 1
    else bg_status = "UNKNOWN"; other_count = other_count + 1 end
    log(string.format("    backdrop:    NES=$%02X  CRAM=$%04X  expected_lifted=$%s  expected_raw=$%s  => %s",
        bg_nes, bg_cram,
        bg_exp_l and hex(bg_exp_l, 4) or "????",
        bg_exp_r and hex(bg_exp_r, 4) or "????",
        bg_status))

    -- Also check the backdrop mirror at color 15 of line 0
    local mirror_cram = cram[15]
    log(string.format("    backdrop_mirror(color15): CRAM=$%04X  (should match backdrop)", mirror_cram))

    -- Check color 15 (NES backdrop mirror) in CRAM
    local idx15_cram = cram[0x0F]
    log(string.format("    CRAM[$0F]=$%04X  (NES_BACKDROP_CRAM_INDEX)", idx15_cram))

    log(string.format("  VERDICT: %d lifted, %d raw (unlifted!), %d unknown", lifted_count, raw_count, other_count))
    if raw_count > 0 then
        log("  >>> BUG: Some CRAM values are RAW (no lift applied). The lift function may not be running.")
    end
    if lifted_count > 0 and raw_count == 0 then
        log("  >>> OK: All checked values are properly lifted. Darkness is NOT caused by missing lift.")
    end
end

local function check_vdp_regs()
    -- Read VDP register shadows from the 68K bus to check mode
    log("  === VDP REGISTER CHECK ===")
    local reg12_shadow = 0x00  -- We can't easily read VDP regs, but we can check our shadow
    -- The enforce function writes $8C00 every VBlank, so reg12 should be $00
    log("  VDP_ENFORCE_MODE_REG12 writes $8C00 every VBlank (shadow/highlight OFF)")
    log("  If display is dim, shadow/highlight may be enabled mid-frame between VBlanks")
end

local function brightness_stats(cram)
    -- Compute average brightness of all non-black CRAM entries
    local total_r, total_g, total_b = 0, 0, 0
    local count = 0
    for i = 0, 63 do
        local w = cram[i]
        if w ~= 0 then
            local r = (w & 0x000E) >> 1
            local g = (w & 0x00E0) >> 5
            local b = (w & 0x0E00) >> 9
            total_r = total_r + r
            total_g = total_g + g
            total_b = total_b + b
            count = count + 1
        end
    end
    if count > 0 then
        log(string.format("  avg_brightness: R=%.1f G=%.1f B=%.1f (of 7.0 max) over %d non-black entries",
            total_r / count, total_g / count, total_b / count, count))
        log(string.format("  avg_pct: %.0f%% of maximum", ((total_r + total_g + total_b) / (count * 3)) / 7 * 100))
    end
end

-- ========== MAIN LOOP ==========
log("=== CRAM BRIGHTNESS PROBE " .. ROM_VERSION .. " ===")
log("Purpose: verify VDP_LIFT_HARDWARE_COLOR is applied and diagnose darkness")
log("")

local captures = {}
local script_names = {
    [SCRIPT_TITLE] = "title",
    [SCRIPT_FILE_SEL] = "file_select",
    [SCRIPT_GAMEPLAY] = "gameplay",
}
local hold_frames = {}

for frame = 1, MAX_FRAMES do
    emu.frameadvance()

    local script = read_u8(ADDR_SCRIPT)
    local name = script_names[script]

    if name and not captures[name] then
        hold_frames[name] = (hold_frames[name] or 0) + 1

        -- Wait 30 frames in each state to ensure palette sync has run
        if hold_frames[name] >= 30 then
            captures[name] = true
            log(string.format("--- %s (frame %d, script=$%02X) ---", name, frame, script))

            -- Screenshot
            local shot = OUT_DIR .. "screens\\cram_probe_" .. ROM_VERSION .. "_" .. name .. ".png"
            pcall(function() client.screenshot(shot) end)
            log("  screenshot=" .. shot)

            -- Dump state
            local shadow = read_shadow_palette()
            dump_shadow(shadow)
            local cram = read_cram()
            dump_cram(cram)
            check_lift_applied(cram, shadow)
            brightness_stats(cram)
            check_vdp_regs()
            log("")
        end
    else
        -- Reset hold counter if we leave the state
        if name then
            -- still in same state, counter keeps going
        else
            for k, _ in pairs(hold_frames) do
                if not captures[k] then
                    hold_frames[k] = 0
                end
            end
        end
    end

    -- Done once we have all 3 (or timeout)
    if captures["title"] and captures["file_select"] and captures["gameplay"] then
        break
    end
end

log("=== CAPTURES COMPLETED ===")
local got = {}
for k, _ in pairs(captures) do got[#got + 1] = k end
log("captured: " .. table.concat(got, ", "))
if not captures["title"] then log("MISSED: title screen") end
if not captures["file_select"] then log("MISSED: file_select") end
if not captures["gameplay"] then log("MISSED: gameplay (need to start a game)") end

log("")
log("=== PROBE COMPLETE ===")
log_file:close()
client.exit()
