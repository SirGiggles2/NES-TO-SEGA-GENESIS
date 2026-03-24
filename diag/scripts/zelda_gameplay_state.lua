-- zelda_gameplay_state.lua
-- Minimal gameplay-state probe built from the working script3 diagnostic pattern.
-- Waits for script >= 5, logs key state for 240 frames, and attempts screenshots.

local ROM_VERSION = "v379"   -- patched by launcher
local MAX_FRAMES  = 12000

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\screens\\"
local OUT_PATH  = OUT_DIR .. "gameplay_state_" .. ROM_VERSION .. ".txt"

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

local frame_num = 0
local gameplay_entry = nil
local log_file = io.open(OUT_PATH, "w")

local function log(msg)
    if log_file then
        log_file:write(msg .. "\n")
        log_file:flush()
    end
    print(msg)
end

local function read_u8(addr)
    return memory.read_u8(addr)
end

local function state()
    return {
        script    = read_u8(ADDR_SCRIPT),
        sub       = read_u8(ADDR_SUBSCRIPT),
        ready     = read_u8(ADDR_READY),
        ppu       = read_u8(ADDR_PPU_LOAD_IDX),
        map       = read_u8(ADDR_MAP_LOCATION),
        next_map  = read_u8(ADDR_NEXT_MAP_LOCATION),
        x         = read_u8(ADDR_POS_X_LINK),
        y         = read_u8(ADDR_POS_Y_LINK),
        dir       = read_u8(ADDR_DIR_LINK),
        enemies   = read_u8(ADDR_ENEMY_CNT),
        room_item = read_u8(ADDR_ROOM_ITEM_FLAG),
        message   = read_u8(ADDR_MESSAGE),
        quest     = read_u8(ADDR_CURRENT_QUEST),
        hearts    = read_u8(ADDR_ITEM_HEARTS),
        pause     = read_u8(ADDR_PAUSE_FLAG),
        trans     = read_u8(ADDR_SCREEN_TRANS),
        timer     = read_u8(ADDR_TIMER_LINK),
        spr1      = read_u8(ADDR_SPR_INDEX_1),
    }
end

local function log_state(prefix, s)
    log(string.format(
        "%s frame=%d script=%d sub=%d ready=%d ppu=0x%02X map=%02X next=%02X x=%02X y=%02X dir=%02X enemy_cnt=%d room_item=%02X msg=%02X quest=%02X hearts=%02X pause=%d trans=%d timer=%d spr1=%02X",
        prefix, frame_num, s.script, s.sub, s.ready, s.ppu, s.map, s.next_map,
        s.x, s.y, s.dir, s.enemies, s.room_item, s.message, s.quest, s.hearts,
        s.pause, s.trans, s.timer, s.spr1
    ))
end

local function try_shot(tag)
    local path = SHOT_DIR .. ROM_VERSION .. "_" .. tag .. "_f" .. frame_num .. ".png"
    local ok, err = pcall(function() client.screenshot(path) end)
    if ok then
        log("screenshot=" .. path)
    else
        log("screenshot_error=" .. tostring(err))
    end
end

log("=== GAMEPLAY STATE " .. ROM_VERSION .. " ===")
log("")

while frame_num < MAX_FRAMES do
    emu.frameadvance()
    frame_num = frame_num + 1

    local s = state()

    if frame_num == 1 or frame_num % 300 == 0 then
        log_state("heartbeat", s)
    end

    if s.script >= 5 and gameplay_entry == nil then
        gameplay_entry = frame_num
        log("")
        log("*** GAMEPLAY ENTRY ***")
        log_state("entry", s)
        try_shot("entry")
    end

    if gameplay_entry ~= nil then
        local delta = frame_num - gameplay_entry
        if delta == 30 then
            log_state("f+30", s)
            try_shot("f30")
        elseif delta == 120 then
            log_state("f+120", s)
            try_shot("f120")
        elseif delta == 240 then
            log_state("f+240", s)
            try_shot("f240")
            break
        end
    end
end

log("")
log("=== SUMMARY ===")
local final = state()
log_state("final", final)
log("gameplay_entry_frame=" .. tostring(gameplay_entry))

if log_file then
    log_file:close()
end
