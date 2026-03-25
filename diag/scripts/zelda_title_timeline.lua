local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local TRACE_HINT = nil
local MAX_FRAMES = 1800

local GAME_MODE = 0xFF0010
local SCREEN_READY = 0xFF0011
local SCRIPT = 0xFF0012
local SUBSCRIPT = 0xFF0013
local PPU_LOAD_INDEX = 0xFF0014
local FRAME_COUNTER = 0xFF0015
local RAM_005C = 0xFF005C
local RAM_FOR_2001 = 0xFF00FE
local RAM_FOR_2000 = 0xFF00FF
local AUTO_DEMO = 0xFF042C
local PHASE = 0xFF042D

local PPUCTRL_SHADOW = 0xFFEF00
local PPUMASK_SHADOW = 0xFFEF01
local PPU_TITLE_CHR_FLUSH_DONE = 0xFFEF14
local VDP_IN_VBLANK_FLAG = 0xFFEF15
local PPU_MIRROR_MODE = 0xFFEF17

local NT_BASE = 0xFF8200
local PAL_BASE = 0xFF9200
local CHR_BASE = 0xFFC000

local WATCH_ROWS = { 4, 7, 8, 11, 13, 17, 20 }
local WATCH_TILES = { 0x008, 0x01C, 0x108, 0x11C }
local CHECKPOINT_FRAMES = {
    [0] = true,
    [1] = true,
    [2] = true,
    [5] = true,
    [10] = true,
    [20] = true,
    [40] = true,
    [60] = true,
    [90] = true,
    [120] = true,
    [180] = true,
    [240] = true,
    [360] = true,
    [530] = true,
    [700] = true,
    [900] = true,
    [1200] = true,
    [1500] = true,
    [1800] = true,
}

local function get_rom_label()
    local label = TRACE_HINT
    if label and label ~= "" then
        return label
    end
    local path = gameinfo.getromname() or "unknown"
    label = tostring(path):gsub("^.*[\\/]", "")
    label = label:gsub("%.[Mm][Dd]$", "")
    return label
end

local function r8(addr)
    return memory.read_u8(addr) or 0
end

local function hx(value, width)
    return string.format("%0" .. tostring(width) .. "X", value or 0)
end

local function line(handle, text)
    handle:write(text)
    handle:write("\n")
    handle:flush()
end

local function nt_signature()
    local rows = {}
    for _, row in ipairs(WATCH_ROWS) do
        local cols = {}
        for col = 0, 31 do
            cols[#cols + 1] = hx(r8(NT_BASE + (row * 32) + col), 2)
        end
        rows[#rows + 1] = table.concat(cols, "")
    end
    return table.concat(rows, "|")
end

local function pal_signature()
    local colors = {}
    for index = 0, 31 do
        colors[#colors + 1] = hx(r8(PAL_BASE + index), 2)
    end
    return table.concat(colors, "")
end

local function chr_tile_bytes(tile)
    local bytes = {}
    local base = CHR_BASE + (tile * 16)
    for offset = 0, 15 do
        bytes[#bytes + 1] = hx(r8(base + offset), 2)
    end
    return table.concat(bytes, "")
end

local function chr_signature()
    local parts = {}
    for _, tile in ipairs(WATCH_TILES) do
        parts[#parts + 1] = chr_tile_bytes(tile)
    end
    return table.concat(parts, "|")
end

local function dump_snapshot(handle, frame, reason)
    line(handle, string.format("SNAPSHOT frame=%d reason=%s", frame, reason))
    line(handle, string.format(
        "  state gm=%02X ready=%02X script=%02X sub=%02X ppu_idx=%02X ram_005C=%02X auto=%02X phase=%02X frm=%02X ctrl=%02X mask=%02X ctrl_shadow=%02X mask_shadow=%02X flush_done=%02X vblank=%02X mirror=%02X",
        r8(GAME_MODE),
        r8(SCREEN_READY),
        r8(SCRIPT),
        r8(SUBSCRIPT),
        r8(PPU_LOAD_INDEX),
        r8(RAM_005C),
        r8(AUTO_DEMO),
        r8(PHASE),
        r8(FRAME_COUNTER),
        r8(RAM_FOR_2000),
        r8(RAM_FOR_2001),
        r8(PPUCTRL_SHADOW),
        r8(PPUMASK_SHADOW),
        r8(PPU_TITLE_CHR_FLUSH_DONE),
        r8(VDP_IN_VBLANK_FLAG),
        r8(PPU_MIRROR_MODE)
    ))
    for _, row in ipairs(WATCH_ROWS) do
        local cols = {}
        for col = 0, 31 do
            cols[#cols + 1] = hx(r8(NT_BASE + (row * 32) + col), 2)
        end
        line(handle, string.format("  nt_row_%02d=%s", row, table.concat(cols, " ")))
    end
    line(handle, string.format("  pal=%s", pal_signature()))
    for _, tile in ipairs(WATCH_TILES) do
        line(handle, string.format("  chr_%03X=%s", tile, chr_tile_bytes(tile)))
    end
end

memory.usememorydomain("M68K BUS")

local rom_label = get_rom_label()
local out_path = OUT_DIR .. "title_timeline_" .. rom_label .. ".txt"
local done_path = OUT_DIR .. "title_timeline_" .. rom_label .. ".done"
local out = assert(io.open(out_path, "w"))

line(out, "=== TITLE TIMELINE ===")
line(out, "ROM=" .. rom_label)

local previous_state = nil
local previous_nt = nil
local previous_pal = nil
local previous_chr = nil

for frame = 0, MAX_FRAMES do
    if frame > 0 then
        emu.frameadvance()
    end

    local state = table.concat({
        hx(r8(GAME_MODE), 2),
        hx(r8(SCREEN_READY), 2),
        hx(r8(SCRIPT), 2),
        hx(r8(SUBSCRIPT), 2),
        hx(r8(PPU_LOAD_INDEX), 2),
        hx(r8(RAM_005C), 2),
        hx(r8(AUTO_DEMO), 2),
        hx(r8(PHASE), 2),
        hx(r8(FRAME_COUNTER), 2),
        hx(r8(PPU_TITLE_CHR_FLUSH_DONE), 2),
        hx(r8(VDP_IN_VBLANK_FLAG), 2),
        hx(r8(PPUCTRL_SHADOW), 2),
        hx(r8(PPUMASK_SHADOW), 2),
        hx(r8(PPU_MIRROR_MODE), 2),
    }, "|")

    local nt = nt_signature()
    local pal = pal_signature()
    local chr = chr_signature()

    if previous_state ~= state then
        dump_snapshot(out, frame, "state_change")
    elseif previous_nt ~= nt then
        dump_snapshot(out, frame, "nt_change")
    elseif previous_pal ~= pal then
        dump_snapshot(out, frame, "palette_change")
    elseif previous_chr ~= chr then
        dump_snapshot(out, frame, "chr_change")
    elseif CHECKPOINT_FRAMES[frame] then
        dump_snapshot(out, frame, "checkpoint")
    end

    previous_state = state
    previous_nt = nt
    previous_pal = pal
    previous_chr = chr
end

line(out, "=== COMPLETE ===")
out:close()

local done = io.open(done_path, "w")
if done then
    done:write("done\n")
    done:close()
end

client.exit()