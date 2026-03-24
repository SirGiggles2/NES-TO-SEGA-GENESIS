-- zelda_nes_visual_capture.lua
-- Capture NES intro-loop checkpoints for side-by-side comparison with Genesis capture.

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "nes_visual_capture.txt"
local MAX_FRAMES = 12000

os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
local log_file = assert(io.open(OUT_PATH, "w"))
local function log(msg) log_file:write(msg .. "\n"); log_file:flush() end

-- Domain selection
local domain = nil
local domains = memory.getmemorydomainlist()
for _, d in ipairs(domains) do
    if d == "RAM" then domain = "RAM"; break end
end
if not domain then
    for _, d in ipairs(domains) do
        if d == "System Bus" then domain = "System Bus"; break end
    end
end
if not domain then
    domain = domains[1]
end
memory.usememorydomain(domain)

local use_sysbus = (domain == "System Bus")
local function r8(addr)
    if not use_sysbus and addr > 0x07FF then
        local ok, val = pcall(function()
            memory.usememorydomain("System Bus")
            local v = memory.read_u8(addr)
            memory.usememorydomain(domain)
            return v
        end)
        if ok then return val or 0 end
        return 0
    end
    return memory.read_u8(addr) or 0
end

log("=== NES VISUAL CAPTURE ===")
log("domain=" .. tostring(domain))

local prev_frm = -1
local nmi_count = 0
local captured = {}
local title_candidates = {100, 300, 500, 700, 850}
local title_candidate_done = {}
local fade_candidates = {930, 945, 960, 975}
local fade_candidate_done = {}
local scroll_visible_steps = {0x18, 0x20, 0x28, 0x30, 0x38}
local scroll_visible_done = {}

for frame = 0, MAX_FRAMES do
    emu.frameadvance()

    local frm = r8(0x0015)
    local ready = r8(0x0011)
    local ppu_load = r8(0x0014)
    local for2000 = r8(0x00FF)
    local scroll_y = r8(0x00FC)

    if frm ~= prev_frm and prev_frm >= 0 then
        nmi_count = nmi_count + 1
    end

    -- Title candidate captures across the whole title hold.
    -- This lets offline scoring choose the closest state-matched oracle frame.
    for _, t in ipairs(title_candidates) do
        if not title_candidate_done[t] and nmi_count >= t and ready == 1 and ppu_load == 0x00 and scroll_y == 0x00 then
            title_candidate_done[t] = true
            local name = string.format("nes_ss_title_nmi%d.png", t)
            client.screenshot(OUT_DIR .. name)
            log(string.format("SCREENSHOT: title_candidate nmi=%d target=%d f=%d rdy=%d ppu=%02X 2000=%02X sy=%02X",
                nmi_count, t, frame, ready, ppu_load, for2000, scroll_y))
        end
    end

    -- Canonical title checkpoint uses late settled frame.
    if ready == 1 and ppu_load == 0x00 and scroll_y == 0x00 and nmi_count >= 850 and nmi_count <= 940 and not captured["title"] then
        captured["title"] = true
        client.screenshot(OUT_DIR .. "nes_ss_title.png")
        log(string.format("SCREENSHOT: title nmi=%d f=%d rdy=%d ppu=%02X 2000=%02X sy=%02X", nmi_count, frame, ready, ppu_load, for2000, scroll_y))
    end

    -- Fade checkpoint: ready=0 around first transition
    if ready == 0 and nmi_count > 900 and not captured["fade"] then
        captured["fade"] = true
        client.screenshot(OUT_DIR .. "nes_ss_fade_mid.png")
        log(string.format("SCREENSHOT: fade_mid nmi=%d f=%d rdy=%d ppu=%02X 2000=%02X sy=%02X", nmi_count, frame, ready, ppu_load, for2000, scroll_y))
    end
    for _, t in ipairs(fade_candidates) do
        if not fade_candidate_done[t] and nmi_count >= t then
            fade_candidate_done[t] = true
            local name = string.format("nes_ss_fade_nmi%d.png", t)
            client.screenshot(OUT_DIR .. name)
            log(string.format("SCREENSHOT: fade_candidate nmi=%d target=%d f=%d rdy=%d ppu=%02X 2000=%02X sy=%02X",
                nmi_count, t, frame, ready, ppu_load, for2000, scroll_y))
        end
    end

    -- Scroll start checkpoint: first intro scroll load
    if ppu_load == 0x02 and ready == 1 and not captured["scroll_start"] then
        captured["scroll_start"] = true
        client.screenshot(OUT_DIR .. "nes_ss_scroll_start.png")
        log(string.format("SCREENSHOT: scroll_start nmi=%d f=%d rdy=%d ppu=%02X 2000=%02X sy=%02X", nmi_count, frame, ready, ppu_load, for2000, scroll_y))
    end

    -- Visible scroll-start checkpoint: first clearly advanced scroll row.
    if captured["scroll_start"] and scroll_y >= 0x20 and not captured["scroll_start_visible"] then
        captured["scroll_start_visible"] = true
        client.screenshot(OUT_DIR .. "nes_ss_scroll_start_visible.png")
        log(string.format("SCREENSHOT: scroll_start_visible nmi=%d f=%d rdy=%d ppu=%02X 2000=%02X sy=%02X",
            nmi_count, frame, ready, ppu_load, for2000, scroll_y))
    end
    for _, sy_target in ipairs(scroll_visible_steps) do
        if captured["scroll_start"] and not scroll_visible_done[sy_target] and scroll_y >= sy_target then
            scroll_visible_done[sy_target] = true
            local name = string.format("nes_ss_scroll_visible_sy%02X.png", sy_target)
            client.screenshot(OUT_DIR .. name)
            log(string.format("SCREENSHOT: scroll_visible_candidate nmi=%d sy_target=%02X f=%d rdy=%d ppu=%02X 2000=%02X sy=%02X",
                nmi_count, sy_target, frame, ready, ppu_load, for2000, scroll_y))
        end
    end

    -- Scroll mid checkpoint
    if captured["scroll_start"] and scroll_y >= 0x70 and not captured["scroll_mid"] then
        captured["scroll_mid"] = true
        client.screenshot(OUT_DIR .. "nes_ss_scroll_mid.png")
        log(string.format("SCREENSHOT: scroll_mid nmi=%d f=%d rdy=%d ppu=%02X 2000=%02X sy=%02X", nmi_count, frame, ready, ppu_load, for2000, scroll_y))
    end

    -- Scroll near-end checkpoint
    if captured["scroll_mid"] and scroll_y >= 0xD0 and not captured["scroll_end"] then
        captured["scroll_end"] = true
        client.screenshot(OUT_DIR .. "nes_ss_scroll_end.png")
        log(string.format("SCREENSHOT: scroll_end nmi=%d f=%d rdy=%d ppu=%02X 2000=%02X sy=%02X", nmi_count, frame, ready, ppu_load, for2000, scroll_y))
    end

    if captured["title"] and captured["fade"] and captured["scroll_start"] and captured["scroll_start_visible"] and captured["scroll_mid"] and captured["scroll_end"] then
        break
    end

    prev_frm = frm
end

log("=== NES VISUAL CAPTURE COMPLETE ===")
log_file:close()
client.exit()
