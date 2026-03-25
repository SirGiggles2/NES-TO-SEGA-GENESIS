local OUT_DIR = "C:/Users/Jake Diggity/Documents/GitHub/NES-TO-SEGA-GENESIS/diag/reports/"
local TRACE_HINT = "v552_20260324_201416"
local TARGET_FRAME = 900
local NT_BASE = 0xFF8200
local function get_rom_label()
  local label = TRACE_HINT
  if label and label ~= "" then return label end
  local path = gameinfo.getromname() or "unknown"
  label = tostring(path):gsub("^.*[\\/]", "")
  label = label:gsub("%.[Mm][Dd]$", "")
  return label
end
local function hex(v,w) return string.format("%0"..tostring(w).."X", v or 0) end
memory.usememorydomain("M68K BUS")
while emu.framecount() < TARGET_FRAME do emu.frameadvance() end
local rom_label = get_rom_label()
local out_path = OUT_DIR .. "mapper_attr_" .. rom_label .. ".txt"
local out = assert(io.open(out_path, "w"))
out:write("frame=" .. tostring(emu.framecount()) .. "\n")
out:write("ROM8000=" .. hex(memory.read_u8(0xFF8000),2) .. "\n")
out:write("ROMA000=" .. hex(memory.read_u8(0xFFA000),2) .. "\n")
out:write("ROMC000=" .. hex(memory.read_u8(0xFFC000),2) .. "\n")
out:write("ROME000=" .. hex(memory.read_u8(0xFFE000),2) .. "\n")
for r=0,7 do
  local vals = {}
  for c=0,7 do
    local off = 0x3C0 + r*8 + c
    vals[#vals+1] = hex(memory.read_u8(NT_BASE + off),2)
  end
  out:write(string.format("ATTR%01d=%s\n", r, table.concat(vals, " ")))
end
out:close()
client.exit()

