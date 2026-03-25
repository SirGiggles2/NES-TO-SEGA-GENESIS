local TARGET_FRAME = 900
local NT_BASE = 0xFF8200
local out_path = [[diag/reports/mapper_attr_v551_20260324_200655.txt]]
memory.usememorydomain("M68K BUS")
local function hx(v) return string.format("%02X", v or 0) end
local ok, err = pcall(function()
  while emu.framecount() < TARGET_FRAME do emu.frameadvance() end
  local f = assert(io.open(out_path, "w"))
  f:write("frame=" .. tostring(emu.framecount()) .. "\n")
  f:write("ROM8000=" .. hx(memory.read_u8(0xFF8000)) .. "\n")
  f:write("ROMA000=" .. hx(memory.read_u8(0xFFA000)) .. "\n")
  f:write("ROMC000=" .. hx(memory.read_u8(0xFFC000)) .. "\n")
  f:write("ROME000=" .. hx(memory.read_u8(0xFFE000)) .. "\n")
  for r=0,7 do
    local vals = {}
    for c=0,7 do
      local off = 0x3C0 + r*8 + c
      vals[#vals+1] = hx(memory.read_u8(NT_BASE + off))
    end
    f:write(string.format("ATTR%01d=%s\n", r, table.concat(vals, " ")))
  end
  f:close()
end)
if not ok then
  local ef = io.open(out_path, "w")
  if ef then ef:write("ERR=" .. tostring(err) .. "\n"); ef:close() end
end
client.exit()

