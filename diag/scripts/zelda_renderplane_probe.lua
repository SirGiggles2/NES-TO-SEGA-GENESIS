-- zelda_renderplane_probe.lua
-- Try BizHawk render-plane controls on the Zelda title screen.

local ROM_VERSION = "zelda_v677"
local MAX_FRAMES = 360

local OUT_DIR   = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR  = OUT_DIR .. "screens\\"
local OUT_PATH  = OUT_DIR .. "renderplane_probe_" .. ROM_VERSION .. ".txt"

local ADDR_READY     = 0xFF0011
local ADDR_SCRIPT    = 0xFF0012
local ADDR_SUB       = 0xFF0013
local ADDR_PPU_LOAD  = 0xFF0014

local function ensure_dirs()
    os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
    os.execute('if not exist "' .. SHOT_DIR .. '" mkdir "' .. SHOT_DIR .. '"')
end

ensure_dirs()
local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
end

local function read_u8(addr)
    memory.usememorydomain("M68K BUS")
    return memory.read_u8(addr) or 0
end

local function shot(tag)
    local path = SHOT_DIR .. ROM_VERSION .. "_renderplane_" .. tag .. ".png"
    client.screenshot(path)
    log("screenshot[" .. tag .. "]=" .. path)
end

local function try_call(label, fn)
    local ok, err = pcall(fn)
    log(string.format("call[%s]=%s", label, ok and "ok" or ("err:" .. tostring(err))))
    return ok
end

local function try_signature(label, payload)
    if payload.kind == "table" then
        return try_call(label, function() emu.setrenderplanes(payload.value) end)
    end
    return try_call(label, function() emu.setrenderplanes(table.unpack(payload.value)) end)
end

local function apply_mask(mask)
    local attempts = {
        { kind = "table", value = mask },
        { kind = "args",  value = mask },
    }
    for i, attempt in ipairs(attempts) do
        if try_signature("mask_" .. table.concat((function()
            local s = {}
            for _, v in ipairs(mask) do
                s[#s + 1] = v and "1" or "0"
            end
            return s
        end)(), "") .. "_" .. attempt.kind, attempt) then
            return true
        end
    end
    return false
end

memory.usememorydomain("M68K BUS")
log("=== RENDERPLANE PROBE " .. ROM_VERSION .. " ===")

local ready_hold = 0

for frame = 1, MAX_FRAMES do
    emu.frameadvance()

    local ready = read_u8(ADDR_READY)
    local script = read_u8(ADDR_SCRIPT)
    local sub = read_u8(ADDR_SUB)
    local ppu = read_u8(ADDR_PPU_LOAD)

    if script == 0 and sub == 0 and ready == 1 and ppu == 0 then
        ready_hold = ready_hold + 1
    else
        ready_hold = 0
    end

    if ready_hold >= 20 then
        log(string.format("sample_frame=%d ready=%d script=%d sub=%d ppu=%02X hold=%d", frame, ready, script, sub, ppu, ready_hold))

        local masks = {
            { tag = "all_on", mask = { true, true, true, true } },
            { tag = "off_1",  mask = { false, true, true, true } },
            { tag = "off_2",  mask = { true, false, true, true } },
            { tag = "off_3",  mask = { true, true, false, true } },
            { tag = "off_4",  mask = { true, true, true, false } },
            { tag = "p1_only", mask = { true, false, false, false } },
            { tag = "p2_only", mask = { false, true, false, false } },
            { tag = "p3_only", mask = { false, false, true, false } },
            { tag = "p4_only", mask = { false, false, false, true } },
        }

        for _, entry in ipairs(masks) do
            if apply_mask(entry.mask) then
                emu.frameadvance()
                shot(entry.tag)
            end
        end

        apply_mask({ true, true, true, true })
        break
    end
end

log("=== RENDERPLANE PROBE COMPLETE ===")
log_file:close()
client.exit()
