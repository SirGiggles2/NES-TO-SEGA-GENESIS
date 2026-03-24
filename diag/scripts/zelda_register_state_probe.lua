-- zelda_register_state_probe.lua
-- Dumps live register/name-entry renderer state at the settled frame.

local ROM_VERSION = "zelda_v421"
local MAX_FRAMES = 1600
local SETTLE_FRAMES = 30
local FALLBACK_DELAY = 180

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR = OUT_DIR .. "screens\\"
local OUT_PATH = OUT_DIR .. "register_state_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY        = 0xFF0011
local ADDR_SCRIPT       = 0xFF0012
local ADDR_SUBSCRIPT    = 0xFF0013
local ADDR_PPU_LOAD     = 0xFF0014
local ADDR_CUR_SLOT     = 0xFF0016
local ADDR_TRACE_LAST   = 0xFFF000
local ADDR_TRACE_SEQ    = 0xFFF002
local ADDR_PPUCTRL      = 0xFFEF00
local ADDR_PPUMASK      = 0xFFEF01
local ADDR_PLANE_CACHE  = 0xFFEF12
local ADDR_FULL_REDRAW  = 0xFFEF13
local ADDR_PAL_SHADOW   = 0xFF9200
local ADDR_NT_SHADOW    = 0xFF8200
local ADDR_CHR_SHADOW   = 0xFFC000
local ADDR_SPR_BASE     = 0xFF0200
local ADDR_LINK_X       = 0xFF0070
local ADDR_LINK_Y       = 0xFF0084
local ADDR_ENEMY_X      = 0xFF0071
local ADDR_ENEMY_Y      = 0xFF0085
local ADDR_041F         = 0xFF041F
local ADDR_0420         = 0xFF0420
local ADDR_0421         = 0xFF0421
local ADDR_0422         = 0xFF0422
local ADDR_0423         = 0xFF0423
local ADDR_0425         = 0xFF0425
local ADDR_0426         = 0xFF0426
local PLANE_A_MAP_BASE  = 0xC000

memory.usememorydomain("M68K BUS")

local frame_num = 0
local register_entry = nil
local ready_stable = 0

local function ensure_dirs()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
    os.execute('if not exist "' .. SHOT_DIR .. '" mkdir "' .. SHOT_DIR .. '"')
end

ensure_dirs()
local log_file = io.open(OUT_PATH, "w")

local function log(msg)
    if log_file then
        log_file:write(msg .. "\n")
        log_file:flush()
    end
    print(msg)
end

local function shot(name)
    local full = SHOT_DIR .. name
    client.screenshot(full)
    log("screenshot=" .. full)
end

local function read_u8(addr)
    return memory.read_u8(addr)
end

local function read_state()
    return {
        ready = read_u8(ADDR_READY),
        script = read_u8(ADDR_SCRIPT),
        sub = read_u8(ADDR_SUBSCRIPT),
        ppu = read_u8(ADDR_PPU_LOAD),
        slot = read_u8(ADDR_CUR_SLOT),
    }
end

local function dump_bytes(label, base, count)
    local parts = {}
    for i = 0, count - 1 do
        parts[#parts + 1] = string.format("%02X", read_u8(base + i))
    end
    log(label .. "=" .. table.concat(parts, " "))
end

local function dump_sprite_rows()
    for i = 0, 5 do
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

local function dump_nt_rows(first_row, last_row)
    for row = first_row, last_row do
        local parts = {}
        for col = 0, 31 do
            parts[#parts + 1] = string.format("%02X", read_u8(ADDR_NT_SHADOW + (row * 32) + col))
        end
        log(string.format("nt[%02d]=%s", row, table.concat(parts, " ")))
    end
end

local function dump_attr_rows()
    for row = 0, 7 do
        local parts = {}
        local base = ADDR_NT_SHADOW + 0x03C0 + (row * 8)
        for col = 0, 7 do
            parts[#parts + 1] = string.format("%02X", read_u8(base + col))
        end
        log(string.format("attr[%02d]=%s", row, table.concat(parts, " ")))
    end
end

local function dump_chr_tile(tile)
    local parts = {}
    local base = ADDR_CHR_SHADOW + (tile * 16)
    for i = 0, 15 do
        parts[#parts + 1] = string.format("%02X", read_u8(base + i))
    end
    log(string.format("chr[%03X]=%s", tile, table.concat(parts, " ")))
end

local function with_domain(domain, fn)
    local ok = pcall(memory.usememorydomain, domain)
    if not ok then
        log("domain_missing=" .. domain)
        return
    end
    fn()
    memory.usememorydomain("M68K BUS")
end

local function dump_cram_words(first_word, count)
    with_domain("CRAM", function()
        local parts = {}
        for i = 0, count - 1 do
            parts[#parts + 1] = string.format("%04X", memory.read_u16_be((first_word + i) * 2))
        end
        log(string.format("cram[%02X-%02X]=%s", first_word, first_word + count - 1, table.concat(parts, " ")))
    end)
end

local function dump_plane_row(row)
    with_domain("VRAM", function()
        local parts = {}
        local base = PLANE_A_MAP_BASE + (row * 64 * 2)
        for col = 0, 31 do
            parts[#parts + 1] = string.format("%04X", memory.read_u16_be(base + (col * 2)))
        end
        log(string.format("plane[%02d]=%s", row, table.concat(parts, " ")))
    end)
end

local function dump_vram_tile(tile)
    with_domain("VRAM", function()
        local parts = {}
        local base = tile * 32
        for i = 0, 15 do
            parts[#parts + 1] = string.format("%04X", memory.read_u16_be(base + (i * 2)))
        end
        log(string.format("vram_tile[%03X]=%s", tile, table.concat(parts, " ")))
    end)
end

local function dump_final_state(tag)
    log("")
    log("=== " .. tag .. " ===")
    local s = read_state()
    log(string.format(
        "frame=%d ready=%d script=%d sub=%d ppu=%02X slot=%d trace=%04X/%04X",
        frame_num,
        s.ready,
        s.script,
        s.sub,
        s.ppu,
        s.slot,
        memory.read_u16_be(ADDR_TRACE_LAST),
        memory.read_u16_be(ADDR_TRACE_SEQ)
    ))
    log(string.format(
        "ppu_shadow ctrl=%02X mask=%02X plane_cache=%02X full_redraw=%02X link=(%02X,%02X) enemy=(%02X,%02X)",
        read_u8(ADDR_PPUCTRL),
        read_u8(ADDR_PPUMASK),
        read_u8(ADDR_PLANE_CACHE),
        read_u8(ADDR_FULL_REDRAW),
        read_u8(ADDR_LINK_X),
        read_u8(ADDR_LINK_Y),
        read_u8(ADDR_ENEMY_X),
        read_u8(ADDR_ENEMY_Y)
    ))
    log(string.format(
        "vars 041F=%02X 0420=%02X 0421=%02X 0422=%02X 0423=%02X 0425=%02X 0426=%02X",
        read_u8(ADDR_041F),
        read_u8(ADDR_0420),
        read_u8(ADDR_0421),
        read_u8(ADDR_0422),
        read_u8(ADDR_0423),
        read_u8(ADDR_0425),
        read_u8(ADDR_0426)
    ))
    dump_bytes("pal[00-1F]", ADDR_PAL_SHADOW, 0x20)
    dump_cram_words(0x00, 0x40)
    dump_nt_rows(4, 15)
    dump_attr_rows()
    dump_plane_row(15)
    dump_bytes("spr_raw[00-1F]", ADDR_SPR_BASE, 0x20)
    dump_sprite_rows()
    dump_chr_tile(0x008)
    dump_chr_tile(0x00A)
    dump_chr_tile(0x025)
    dump_chr_tile(0x0F3)
    dump_chr_tile(0x10E)
    dump_chr_tile(0x110)
    dump_chr_tile(0x11B)
    dump_chr_tile(0x11C)
    dump_vram_tile(0x008)
    dump_vram_tile(0x00A)
    dump_vram_tile(0x025)
    dump_vram_tile(0x10E)
    dump_vram_tile(0x110)
    dump_vram_tile(0x11B)
    dump_vram_tile(0x11C)
    shot(ROM_VERSION .. "_register_state_" .. string.lower(tag) .. "_f" .. frame_num .. ".png")
end

log("=== REGISTER STATE PROBE " .. ROM_VERSION .. " ===")

while frame_num < MAX_FRAMES do
    emu.frameadvance()
    frame_num = frame_num + 1

    local s = read_state()

    if register_entry == nil and s.script == 14 then
        register_entry = frame_num
        log("register_entered frame=" .. frame_num)
    end

    if register_entry ~= nil then
        if s.script == 14 and s.ready == 1 and s.sub == 4 and s.ppu == 0 then
            ready_stable = ready_stable + 1
        else
            ready_stable = 0
        end

        if ready_stable == SETTLE_FRAMES then
            dump_final_state("SETTLED")
            break
        end

        if frame_num - register_entry >= FALLBACK_DELAY then
            dump_final_state("FALLBACK")
            break
        end
    end
end

log("")
log("=== SUMMARY ===")
local final = read_state()
log(string.format(
    "final frame=%d ready=%d script=%d sub=%d ppu=%02X slot=%d",
    frame_num, final.ready, final.script, final.sub, final.ppu, final.slot
))

if log_file then
    log_file:close()
end
