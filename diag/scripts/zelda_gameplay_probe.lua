-- zelda_gameplay_probe.lua
-- Waits for gameplay (script>=5), captures screenshots, and logs key world state.
-- ROM_VERSION is patched by run_gameplay_probe.ps1 before launch.

local ROM_VERSION = "zelda_v378"
local MAX_FRAMES  = 18000

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR  = OUT_DIR .. "screens\\"
local OUT_PATH  = OUT_DIR .. "gameplay_probe_" .. ROM_VERSION .. ".txt"

local ADDR_SCRIPT            = 0xFF0012
local ADDR_SUBSCRIPT         = 0xFF0013
local ADDR_READY             = 0xFF0011
local ADDR_PPU_LOAD_IDX      = 0xFF0014
local ADDR_MAP_LOCATION      = 0xFF00EB
local ADDR_NEXT_MAP_LOCATION = 0xFF00EC
local ADDR_POS_X_LINK        = 0xFF0070
local ADDR_POS_Y_LINK        = 0xFF0084
local ADDR_DIR_LINK          = 0xFF0098
local ADDR_ENEMY_CNT         = 0xFF034E
local ADDR_ROOM_ITEM_FLAG    = 0xFF00BF
local ADDR_MESSAGE           = 0xFF0415
local ADDR_CURRENT_QUEST     = 0xFF062D
local ADDR_ITEM_HEARTS       = 0xFF066F
local ADDR_PAUSE_FLAG        = 0xFF00E0
local ADDR_SCREEN_TRANS      = 0xFF00E3
local ADDR_TIMER_LINK        = 0xFF0028
local ADDR_SPR_INDEX_1       = 0xFF0343
local ADDR_MMC1_CTRL         = 0xFF8000
local ADDR_MMC1_CHR0         = 0xFF8001
local ADDR_MMC1_CHR1         = 0xFF8002
local ADDR_MMC1_PRG          = 0xFF8003

local frame_num = 0
local log_file = io.open(OUT_PATH, "w")
local gameplay_entry = nil
local shots = {}

memory.usememorydomain("M68K BUS")

local function log(msg)
    if log_file then
        log_file:write(msg .. "\n")
        log_file:flush()
    end
    print(msg)
end

local function ensure_dirs()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
    os.execute('if not exist "' .. SHOT_DIR .. '" mkdir "' .. SHOT_DIR .. '"')
end

local function shot(name)
    ensure_dirs()
    local full = SHOT_DIR .. name
    client.screenshot(full)
    shots[#shots + 1] = full
    log("screenshot: " .. full)
end

local function read_state()
    return {
        script    = memory.read_u8(ADDR_SCRIPT),
        sub       = memory.read_u8(ADDR_SUBSCRIPT),
        ready     = memory.read_u8(ADDR_READY),
        ppu       = memory.read_u8(ADDR_PPU_LOAD_IDX),
        map       = memory.read_u8(ADDR_MAP_LOCATION),
        next_map  = memory.read_u8(ADDR_NEXT_MAP_LOCATION),
        x         = memory.read_u8(ADDR_POS_X_LINK),
        y         = memory.read_u8(ADDR_POS_Y_LINK),
        dir       = memory.read_u8(ADDR_DIR_LINK),
        enemies   = memory.read_u8(ADDR_ENEMY_CNT),
        room_item = memory.read_u8(ADDR_ROOM_ITEM_FLAG),
        message   = memory.read_u8(ADDR_MESSAGE),
        quest     = memory.read_u8(ADDR_CURRENT_QUEST),
        hearts    = memory.read_u8(ADDR_ITEM_HEARTS),
        pause     = memory.read_u8(ADDR_PAUSE_FLAG),
        trans     = memory.read_u8(ADDR_SCREEN_TRANS),
        timer     = memory.read_u8(ADDR_TIMER_LINK),
        spr_idx_1 = memory.read_u8(ADDR_SPR_INDEX_1),
        mmc1_8000 = memory.read_u8(ADDR_MMC1_CTRL),
        mmc1_a000 = memory.read_u8(ADDR_MMC1_CHR0),
        mmc1_c000 = memory.read_u8(ADDR_MMC1_CHR1),
        mmc1_e000 = memory.read_u8(ADDR_MMC1_PRG),
    }
end

local function log_state(prefix, s)
    log(string.format(
        "%s frame=%d script=%d sub=%d ready=%d ppu=0x%02X map=%02X next=%02X x=%02X y=%02X dir=%02X enemy_cnt=%d room_item=%02X msg=%02X quest=%02X hearts=%02X pause=%d trans=%d timer=%d spr1=%02X mmc=[%02X,%02X,%02X,%02X]",
        prefix, frame_num, s.script, s.sub, s.ready, s.ppu, s.map, s.next_map,
        s.x, s.y, s.dir, s.enemies, s.room_item, s.message, s.quest, s.hearts,
        s.pause, s.trans, s.timer, s.spr_idx_1,
        s.mmc1_8000, s.mmc1_a000, s.mmc1_c000, s.mmc1_e000
    ))
end

ensure_dirs()

log("=== GAMEPLAY PROBE " .. ROM_VERSION .. " ===")
log("Waiting for script>=5, then capturing gameplay state and screenshots.")
log("")

local prev_script = 0xFF
local prev_sub = 0xFF
local last_x = 0xFF
local last_y = 0xFF

while frame_num < MAX_FRAMES do
    emu.frameadvance()
    frame_num = frame_num + 1

    local s = read_state()

    if s.script ~= prev_script or s.sub ~= prev_sub then
        log_state("state", s)
    end

    if s.script >= 5 and gameplay_entry == nil then
        gameplay_entry = frame_num
        log("")
        log("*** GAMEPLAY ENTRY ***")
        log_state("entry", s)
        shot(ROM_VERSION .. "_gameplay_entry_f" .. frame_num .. ".png")
    end

    if gameplay_entry ~= nil then
        local delta = frame_num - gameplay_entry

        if (s.x ~= last_x or s.y ~= last_y) and delta <= 240 then
            log_state("move", s)
        end

        if delta == 30 then
            shot(ROM_VERSION .. "_gameplay_f" .. frame_num .. ".png")
            log_state("f+30", s)
        elseif delta == 120 then
            shot(ROM_VERSION .. "_gameplay_f" .. frame_num .. ".png")
            log_state("f+120", s)
        elseif delta == 240 then
            shot(ROM_VERSION .. "_gameplay_f" .. frame_num .. ".png")
            log_state("f+240", s)
            break
        end
    end

    if frame_num % 600 == 0 and gameplay_entry == nil then
        log_state("heartbeat", s)
    end

    prev_script = s.script
    prev_sub = s.sub
    last_x = s.x
    last_y = s.y
end

log("")
log("=== SUMMARY ===")
local final = read_state()
log_state("final", final)
log("gameplay_entry_frame=" .. tostring(gameplay_entry))
for _, s in ipairs(shots) do
    log("captured=" .. s)
end

if log_file then log_file:close() end
