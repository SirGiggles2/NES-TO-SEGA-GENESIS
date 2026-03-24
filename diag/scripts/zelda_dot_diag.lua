-- zelda_dot_diag.lua
-- Answers:
-- 1) Are there active sprites in top rows during manual phase?
-- 2) Are palette bytes oscillating frame-to-frame during manual phase?
-- 3) Are nametable writes occurring outside VBlank? (instrumented counter)

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "dot_diag_report.txt"

memory.usememorydomain("M68K BUS")
os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')

local f = assert(io.open(OUT_PATH, "w"))
local function log(s) f:write(s .. "\n"); f:flush() end
local function r8(a) return memory.read_u8(a) or 0 end
local function r16(a) return memory.read_u16_be(a) or 0 end

log("=== DOT DIAGNOSTIC ===")

local samples = 0
local top_sprite_frames = 0
local max_top_sprites = 0
local pal_changes = 0
local prev_pal = nil
local first_manual_frame = -1
local last_manual_frame = -1

for frame = 0, 7000 do
    emu.frameadvance()
    local script = r8(0xFF0057)
    local phase = r8(0xFF042D)
    local auto_demo = r8(0xFF042C)

    -- title script + manual/story phase (user-visible dots)
    if script == 0x00 and auto_demo == 0 and phase >= 0x02 then
        if first_manual_frame < 0 then first_manual_frame = frame end
        last_manual_frame = frame
        samples = samples + 1

        local top_count = 0
        for i = 0, 63 do
            local y = r8(0xFF0200 + i * 4)
            -- Genesis OAM Y is 0..255-ish with +128 offset in transfer path,
            -- but low raw NES Y in top rows still indicates likely top activity.
            if y < 0x30 then
                top_count = top_count + 1
            end
        end
        if top_count > 0 then top_sprite_frames = top_sprite_frames + 1 end
        if top_count > max_top_sprites then max_top_sprites = top_count end

        local pal = {}
        for i = 0, 31 do
            pal[i + 1] = r8(0xFF9200 + i)
        end
        if prev_pal then
            local changed = false
            for i = 1, 32 do
                if pal[i] ~= prev_pal[i] then
                    changed = true
                    break
                end
            end
            if changed then pal_changes = pal_changes + 1 end
        end
        prev_pal = pal
    end
end

local midframe_nt = r16(0xFFEF16)
log(string.format("manual_frame_window: first=%d last=%d samples=%d", first_manual_frame, last_manual_frame, samples))
log(string.format("top_sprite_frames_nonzero: %d", top_sprite_frames))
log(string.format("max_top_sprites_in_frame: %d", max_top_sprites))
log(string.format("palette_change_frames: %d", pal_changes))
log(string.format("midframe_nt_write_counter: %d", midframe_nt))

local oam_leak = (top_sprite_frames > 0)
local cram_osc = (pal_changes > (samples / 10))
local mid_nt = (midframe_nt > 0)
log(string.format("RESULT oam_leak=%s cram_oscillation=%s midframe_nt_writes=%s",
    tostring(oam_leak), tostring(cram_osc), tostring(mid_nt)))

log("=== DOT DIAGNOSTIC COMPLETE ===")
f:close()
client.exit()
