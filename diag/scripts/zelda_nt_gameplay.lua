local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local TRACE_HINT = "zelda_v394"
local NT_BASE = 0xFF8200
local PPUCTRL_ADDR = 0xFF00FF
local PPUMASK_ADDR = 0xFF00FE
local SCRIPT_ADDR = 0xFF0012
local SUBSCRIPT_ADDR = 0xFF0013
local MAP_ADDR = 0xFF00EB
local NEXT_MAP_ADDR = 0xFF00EC
local MAX_FRAMES = 12000

local function rom_label()
    if TRACE_HINT and TRACE_HINT ~= "" then
        return TRACE_HINT
    end
    local path = gameinfo.getromname() or "unknown"
    path = tostring(path):gsub("^.*[\\/]", "")
    return path:gsub("%.[Mm][Dd]$", "")
end

local function hex(v, width)
    return string.format("%0" .. tostring(width) .. "X", v or 0)
end

memory.usememorydomain("M68K BUS")

local frame = 0
while frame < MAX_FRAMES do
    emu.frameadvance()
    frame = frame + 1
    if (memory.read_u8(SCRIPT_ADDR) or 0) >= 5 then
        break
    end
end

local label = rom_label()
local out_path = OUT_DIR .. "nt_gameplay_" .. label .. ".txt"
local done_path = OUT_DIR .. "nt_gameplay_" .. label .. ".done"
local out = assert(io.open(out_path, "w"))

out:write("ROM: " .. label .. "\n")
out:write("Frame: " .. tostring(emu.framecount()) .. "\n")
out:write("Script: " .. tostring(memory.read_u8(SCRIPT_ADDR) or 0) .. "\n")
out:write("Subscript: " .. tostring(memory.read_u8(SUBSCRIPT_ADDR) or 0) .. "\n")
out:write("Map: $" .. hex(memory.read_u8(MAP_ADDR) or 0, 2) .. "\n")
out:write("NextMap: $" .. hex(memory.read_u8(NEXT_MAP_ADDR) or 0, 2) .. "\n")
out:write("PPUCTRL: $" .. hex(memory.read_u8(PPUCTRL_ADDR) or 0, 2) .. "\n")
out:write("PPUMASK: $" .. hex(memory.read_u8(PPUMASK_ADDR) or 0, 2) .. "\n")
out:write("\n")

for row = 0, 29 do
    local values = {}
    for col = 0, 31 do
        local addr = NT_BASE + (row * 32) + col
        values[#values + 1] = hex(memory.read_u8(addr) or 0, 2)
    end
    out:write(string.format("NT row %02d: %s\n", row, table.concat(values, " ")))
end

out:close()

local done = io.open(done_path, "w")
if done then
    done:write("done\n")
    done:close()
end

client.exit()
