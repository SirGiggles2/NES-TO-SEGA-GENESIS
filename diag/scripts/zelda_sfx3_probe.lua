-- zelda_sfx3_probe.lua
-- Probe ram_sfx_3 and ram_0606_sfx_3 values around the freeze point

local OUT_DIR  = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local OUT_PATH = OUT_DIR .. "sfx3_probe_v480.txt"

memory.usememorydomain("M68K BUS")
os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
local log_file = assert(io.open(OUT_PATH, "w"))
local function log(msg) log_file:write(msg .. "\n"); log_file:flush() end
local function r8(addr) return memory.read_u8(addr) or 0 end

log("=== SFX3 PROBE v480 ===")

-- Find the RAM addresses for sfx_3 and ram_0606_sfx_3
-- From NES: ram_sfx_3 = $0603, ram_0606_sfx_3 = $0606, ram_0069_se = $0069
-- Genesis: $FF0603, $FF0606, $FF0069

local prev_frm = -1
local nmi_count = 0
local handler2_active = false
local consecutive_frozen = 0
local prev_sfx3 = -1
local prev_0606 = -1
local prev_0069 = -1

for frame = 0, 1200 do
    emu.frameadvance()
    local frm = r8(0xFF0015)
    local rdy = r8(0xFF0011)
    local sfx3 = r8(0xFF0603)
    local sfx3_0606 = r8(0xFF0606)
    local se_069 = r8(0xFF0069)

    if frm ~= prev_frm then
        nmi_count = nmi_count + 1
        consecutive_frozen = 0
    else
        consecutive_frozen = consecutive_frozen + 1
    end

    if rdy ~= 0 and not handler2_active then
        handler2_active = true
        log(string.format("handler_2 active f=%d frm=%d nmi=%d", frame, frm, nmi_count))
    end

    -- Log any change in sfx3 values
    if sfx3 ~= prev_sfx3 or sfx3_0606 ~= prev_0606 or se_069 ~= prev_0069 then
        log(string.format("f=%05d frm=%3d sfx3=$%02X 0606=$%02X se69=$%02X nmi=%d cfr=%d",
            frame, frm, sfx3, sfx3_0606, se_069, nmi_count, consecutive_frozen))
        prev_sfx3 = sfx3
        prev_0606 = sfx3_0606
        prev_0069 = se_069
    end

    -- Log every frame around freeze
    if handler2_active and frame >= 995 and frame <= 1020 then
        log(string.format("f=%05d frm=%3d sfx3=$%02X 0606=$%02X se69=$%02X nmi=%d cfr=%d [freeze_zone]",
            frame, frm, sfx3, sfx3_0606, se_069, nmi_count, consecutive_frozen))
    end

    -- Detect freeze
    if handler2_active and consecutive_frozen >= 10 then
        local pc = emu.getregister("M68K PC") or 0
        log(string.format("*** FREEZE f=%d frm=%d sfx3=$%02X 0606=$%02X se69=$%02X PC=%06X ***",
            frame, frm, sfx3, sfx3_0606, se_069, pc))
        break
    end

    prev_frm = frm
end

log("=== PROBE COMPLETE ===")
log_file:close()
client.exit()
