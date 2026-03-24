-- zelda_file_select_state_probe.lua
-- Dumps live file-select renderer state at the settled frame.

local ROM_VERSION = "zelda_v430"
local MAX_FRAMES = 1400
local SETTLE_FRAMES = 90

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR = OUT_DIR .. "screens\\"
local OUT_PATH = OUT_DIR .. "file_select_state_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY        = 0xFF0011
local ADDR_SCRIPT       = 0xFF0012
local ADDR_SUBSCRIPT    = 0xFF0013
local ADDR_PPU_LOAD     = 0xFF0014
local ADDR_BTN_PRESS    = 0xFF00F8
local ADDR_BTN_HOLD     = 0xFF00FA
local ADDR_JOY_OVERRIDE = 0xFFEE90
local ADDR_JOY_ENABLE   = 0xFFEE91
local ADDR_CUR_SLOT     = 0xFF0016
local ADDR_SLOT_0       = 0xFF0633
local ADDR_SLOT_1       = 0xFF0634
local ADDR_SLOT_2       = 0xFF0635
local ADDR_SLOT_3       = 0xFF0636
local ADDR_SLOT_4       = 0xFF0637
local ADDR_TRACE_LAST   = 0xFFF000
local ADDR_TRACE_SEQ    = 0xFFF002
local ADDR_PPUCTRL      = 0xFFEF00
local ADDR_PPUMASK      = 0xFFEF01
local ADDR_PAL_SHADOW   = 0xFF9200
local ADDR_NT_SHADOW    = 0xFF8200
local ADDR_CHR_SHADOW   = 0xFFC000
local ADDR_SPR_BASE     = 0xFF0200
local ADDR_SPR_INDEX_1  = 0xFF0343
local ADDR_SPR_INDEX_2  = 0xFF0344
local PLANE_A_MAP_BASE  = 0xC000

memory.usememorydomain("M68K BUS")

local function ensure_dirs()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
    os.execute('if not exist "' .. SHOT_DIR .. '" mkdir "' .. SHOT_DIR .. '"')
end

local function hex(v, w)
    return string.format("%0" .. tostring(w) .. "X", v or 0)
end

local function read_u8(addr)
    return memory.read_u8(addr) or 0
end

local function with_domain(domain, fn)
    local ok = pcall(memory.usememorydomain, domain)
    if not ok then
        return false
    end
    fn()
    memory.usememorydomain("M68K BUS")
    return true
end

ensure_dirs()
local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
    print(msg)
end

local function shot(name)
    local full = SHOT_DIR .. name
    client.screenshot(full)
    log("screenshot=" .. full)
end

local function read_state()
    return {
        ready      = read_u8(ADDR_READY),
        script     = read_u8(ADDR_SCRIPT),
        sub        = read_u8(ADDR_SUBSCRIPT),
        ppu        = read_u8(ADDR_PPU_LOAD),
        slot       = read_u8(ADDR_CUR_SLOT),
        slot0      = read_u8(ADDR_SLOT_0),
        slot1      = read_u8(ADDR_SLOT_1),
        slot2      = read_u8(ADDR_SLOT_2),
        slot3      = read_u8(ADDR_SLOT_3),
        slot4      = read_u8(ADDR_SLOT_4),
        trace_last = memory.read_u16_be(ADDR_TRACE_LAST) or 0,
        trace_seq  = memory.read_u16_be(ADDR_TRACE_SEQ) or 0,
    }
end

local function log_state(prefix, frame_num, s)
    log(string.format(
        "%s frame=%d ready=%d script=%d sub=%d ppu=0x%02X slot=%d active=[%02X,%02X,%02X,%02X,%02X] trace=[%04X,%04X]",
        prefix, frame_num, s.ready, s.script, s.sub, s.ppu, s.slot,
        s.slot0, s.slot1, s.slot2, s.slot3, s.slot4, s.trace_last, s.trace_seq
    ))
end

local function dump_bytes(label, base, count)
    local parts = {}
    for i = 0, count - 1 do
        parts[#parts + 1] = hex(read_u8(base + i), 2)
    end
    log(label .. "=" .. table.concat(parts, " "))
end

local function dump_nt_rows(first_row, last_row)
    for row = first_row, last_row do
        local parts = {}
        for col = 0, 31 do
            parts[#parts + 1] = hex(read_u8(ADDR_NT_SHADOW + (row * 32) + col), 2)
        end
        log(string.format("nt[%02d]=%s", row, table.concat(parts, " ")))
    end
end

local function dump_attr_rows()
    for row = 0, 7 do
        local parts = {}
        local base = ADDR_NT_SHADOW + 0x03C0 + (row * 8)
        for col = 0, 7 do
            parts[#parts + 1] = hex(read_u8(base + col), 2)
        end
        log(string.format("attr[%02d]=%s", row, table.concat(parts, " ")))
    end
end

local function dump_sprite_rows(count)
    for i = 0, count - 1 do
        local base = ADDR_SPR_BASE + (i * 4)
        log(string.format(
            "spr[%d]=Y:%02X T:%02X A:%02X X:%02X",
            i,
            read_u8(base + 0),
            read_u8(base + 1),
            read_u8(base + 2),
            read_u8(base + 3)
        ))
    end
end

local function dump_cram_words(first_word, count)
    with_domain("CRAM", function()
        local parts = {}
        for i = 0, count - 1 do
            parts[#parts + 1] = hex(memory.read_u16_be((first_word + i) * 2) or 0, 4)
        end
        log(string.format("cram[%02X-%02X]=%s", first_word, first_word + count - 1, table.concat(parts, " ")))
    end)
end

local function dump_plane_rows(first_row, last_row)
    with_domain("VRAM", function()
        for row = first_row, last_row do
            local parts = {}
            local base = PLANE_A_MAP_BASE + (row * 64 * 2)
            for col = 0, 31 do
                parts[#parts + 1] = hex(memory.read_u16_be(base + (col * 2)) or 0, 4)
            end
            log(string.format("plane[%02d]=%s", row, table.concat(parts, " ")))
        end
    end)
end

local function collect_plane_tiles(first_row, last_row)
    local tiles = {}
    with_domain("VRAM", function()
        for row = first_row, last_row do
            local base = PLANE_A_MAP_BASE + (row * 64 * 2)
            for col = 0, 31 do
                local cell = memory.read_u16_be(base + (col * 2)) or 0
                local tile = cell & 0x07FF
                if not tiles[tile] then
                    tiles[tile] = { count = 0, sample = cell }
                end
                tiles[tile].count = tiles[tile].count + 1
            end
        end
    end)
    return tiles
end

local function collect_sprite_tiles(first_sprite, count)
    local tiles = {}
    for i = 0, count - 1 do
        local base = ADDR_SPR_BASE + ((first_sprite + i) * 4)
        local y = read_u8(base + 0)
        local tile = read_u8(base + 1)
        local attr = read_u8(base + 2)
        local x = read_u8(base + 3)
        if y ~= 0 or tile ~= 0 or attr ~= 0 or x ~= 0 then
            if not tiles[tile] then
                tiles[tile] = { count = 0, sample = { y = y, attr = attr, x = x } }
            end
            tiles[tile].count = tiles[tile].count + 1
        end
    end
    return tiles
end

local function dump_chr_tile(tile)
    local parts = {}
    local base = ADDR_CHR_SHADOW + (tile * 16)
    for i = 0, 15 do
        parts[#parts + 1] = hex(read_u8(base + i), 2)
    end
    log(string.format("chr[%03X]=%s", tile, table.concat(parts, " ")))
end

local function dump_vram_tile(tile)
    with_domain("VRAM", function()
        local parts = {}
        local base = tile * 32
        for i = 0, 15 do
            parts[#parts + 1] = hex(memory.read_u16_be(base + (i * 2)) or 0, 4)
        end
        log(string.format("vram_tile[%03X]=%s", tile, table.concat(parts, " ")))
    end)
end

local frame_num = 0
local stable_count = 0
local stable_frame = nil
local prev = nil
local phase = "wait_title_ready"
local phase_frame = nil
local hold_start_title = false

log("=== FILE SELECT STATE PROBE " .. ROM_VERSION .. " ===")

local function joypad_targets(start_pressed)
    return {
        { payload = { Start = start_pressed, C = false, A = false, B = false, Mode = false }, device = 1 },
        { payload = { ["P1 Start"] = start_pressed, ["P1 C"] = false, ["P1 A"] = false, ["P1 B"] = false, ["P1 Mode"] = false }, device = nil },
        { payload = { Start = start_pressed }, device = 1 },
        { payload = { ["P1 Start"] = start_pressed }, device = nil },
    }
end

local START_KEYS = { "Start", "P1 Start", "P1 RetroPad Start", "1 Start" }
local BTN_START  = 0x10

local function joypad_get_states()
    local jp = rawget(_G, "joypad")
    if type(jp) ~= "table" or type(jp.get) ~= "function" then
        return {}
    end

    local states = {}
    local devices = { 1, nil, "Controller 1", "P1", "Port 1" }
    for _, device in ipairs(devices) do
        local ok, state
        if device == nil then
            ok, state = pcall(jp.get)
        else
            ok, state = pcall(jp.get, device)
        end
        if ok and type(state) == "table" then
            states[#states + 1] = state
        end
    end
    return states
end

local function verify_button_state(states, keys, expected)
    local saw_key = false
    for _, state in ipairs(states) do
        for _, key in ipairs(keys) do
            local value = state[key]
            if value ~= nil then
                saw_key = true
                if value == expected then
                    return true, true
                end
            end
        end
    end
    return false, saw_key
end

local function summarize_pressed_keys(states)
    local pressed = {}
    for _, state in ipairs(states or {}) do
        for key, value in pairs(state) do
            if value == true then
                pressed[#pressed + 1] = key
            end
        end
    end
    table.sort(pressed)
    if #pressed == 0 then
        return "none"
    end
    if #pressed > 8 then
        return table.concat(pressed, ",", 1, 8) .. ",..."
    end
    return table.concat(pressed, ",")
end

local function apply_start(start_pressed)
    local jp = rawget(_G, "joypad")
    local pressed_mask = start_pressed and BTN_START or 0

    memory.write_u8(ADDR_JOY_OVERRIDE, pressed_mask)
    memory.write_u8(ADDR_JOY_ENABLE, pressed_mask ~= 0 and 1 or 0)
    memory.write_u8(ADDR_BTN_PRESS, pressed_mask)
    memory.write_u8(ADDR_BTN_HOLD, pressed_mask)

    if type(jp) ~= "table" or type(jp.set) ~= "function" then
        return pressed_mask ~= 0, "ram injection fallback"
    end

    for _, target in ipairs(joypad_targets(start_pressed)) do
        local ok
        if target.device == nil then
            ok = pcall(jp.set, target.payload)
        else
            ok = pcall(jp.set, target.payload, target.device)
        end
        if ok then
            local states = joypad_get_states()
            local verified, saw_key = verify_button_state(states, START_KEYS, start_pressed)
            if verified or not saw_key then
                return true, summarize_pressed_keys(states)
            end
        end
    end

    return false, summarize_pressed_keys(joypad_get_states())
end

while frame_num < MAX_FRAMES do
    if hold_start_title then
        apply_start(true)
    else
        apply_start(false)
    end

    emu.frameadvance()
    frame_num = frame_num + 1

    local s = read_state()
    local changed =
        prev == nil or
        s.ready ~= prev.ready or
        s.script ~= prev.script or
        s.sub ~= prev.sub or
        s.ppu ~= prev.ppu or
        s.slot ~= prev.slot or
        s.slot0 ~= prev.slot0 or
        s.slot1 ~= prev.slot1 or
        s.slot2 ~= prev.slot2 or
        s.slot3 ~= prev.slot3 or
        s.slot4 ~= prev.slot4

    if changed then
        log_state("state", frame_num, s)
    end

    if frame_num % 120 == 0 then
        log_state("heartbeat", frame_num, s)
    end

    if phase == "wait_title_ready" then
        if s.script == 0 and s.sub == 0 and s.ready == 1 and s.ppu == 0 then
            if phase_frame == nil then
                phase_frame = frame_num
                log("title_ready_frame=" .. frame_num)
            elseif frame_num >= phase_frame + 19 then
                hold_start_title = true
                local ok, keys = apply_start(true)
                phase = "wait_title_exit"
                log("action=hold_start_title frame=" .. frame_num .. " input_ok=" .. tostring(ok) .. " joypad_keys=" .. tostring(keys))
            end
        else
            phase_frame = nil
        end
    elseif phase == "wait_title_exit" then
        if s.script ~= 0 then
            hold_start_title = false
            phase = "wait_file_select"
            log("title_exit_detected frame=" .. frame_num)
        end
    elseif s.script == 1 and s.sub == 0 and s.ready == 1 and s.ppu == 0 then
        if stable_count == 0 then
            stable_frame = frame_num
            log("file_select_entered frame=" .. frame_num)
        end
        stable_count = stable_count + 1
        if stable_count == SETTLE_FRAMES then
            break
        end
    else
        stable_count = 0
        stable_frame = nil
    end

    prev = s
end

local final = read_state()
log("")
log("=== SETTLED ===")
log_state("final", frame_num, final)
if stable_frame ~= nil then
    log("stable_start_frame=" .. stable_frame)
end
log(string.format(
    "ppu_shadow ctrl=%02X mask=%02X spr_idx=%02X/%02X",
    read_u8(ADDR_PPUCTRL),
    read_u8(ADDR_PPUMASK),
    read_u8(ADDR_SPR_INDEX_1),
    read_u8(ADDR_SPR_INDEX_2)
))
dump_bytes("pal[00-1F]", ADDR_PAL_SHADOW, 0x20)
dump_cram_words(0x00, 0x40)
dump_nt_rows(4, 28)
dump_attr_rows()
dump_plane_rows(4, 28)
dump_bytes("spr_raw[00-3F]", ADDR_SPR_BASE, 0x40)
dump_sprite_rows(16)

local tiles = collect_plane_tiles(4, 28)
local ordered = {}
for tile, info in pairs(tiles) do
    ordered[#ordered + 1] = { tile = tile, count = info.count, sample = info.sample }
end
table.sort(ordered, function(a, b)
    if a.count ~= b.count then
        return a.count > b.count
    end
    return a.tile < b.tile
end)

log("plane_tiles_top=")
for i = 1, math.min(#ordered, 32) do
    local item = ordered[i]
    log(string.format("tile[%02d]=%03X count=%d sample=%04X", i, item.tile, item.count, item.sample))
end

for i = 1, math.min(#ordered, 16) do
    local tile = ordered[i].tile
    dump_chr_tile(tile)
    dump_vram_tile(tile)
end

local sprite_tiles = collect_sprite_tiles(0, 16)
local sprite_ordered = {}
for tile, info in pairs(sprite_tiles) do
    sprite_ordered[#sprite_ordered + 1] = { tile = tile, count = info.count, sample = info.sample }
end
table.sort(sprite_ordered, function(a, b)
    if a.count ~= b.count then
        return a.count > b.count
    end
    return a.tile < b.tile
end)

log("sprite_tiles_top=")
for i = 1, math.min(#sprite_ordered, 16) do
    local item = sprite_ordered[i]
    log(string.format(
        "spr_tile[%02d]=%03X count=%d sample_y=%02X sample_attr=%02X sample_x=%02X",
        i,
        item.tile,
        item.count,
        item.sample.y,
        item.sample.attr,
        item.sample.x
    ))
end

for i = 1, math.min(#sprite_ordered, 12) do
    local tile = sprite_ordered[i].tile
    dump_chr_tile(tile)
    dump_vram_tile(tile)
end

shot(ROM_VERSION .. "_file_select_state_f" .. frame_num .. ".png")

log("")
log("=== SUMMARY ===")
log_state("summary", frame_num, final)
log("stable_count=" .. stable_count)

log_file:close()
