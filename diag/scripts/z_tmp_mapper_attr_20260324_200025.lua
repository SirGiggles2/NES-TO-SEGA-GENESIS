local out_path = [[.\\diag\\reports\\mapper_attr_v551_20260324_200025.txt]]
local TARGET_FRAME = 900
local NT_BASE = 0xFF8200
local ROM8000 = 0xFF8000
local ROMA000 = 0xFFA000
local ROMC000 = 0xFFC000
local ROME000 = 0xFFE000
memory.usememorydomain("M68K BUS")
while emu.framecount() < TARGET_FRAME do emu.frameadvance() end
local f = assert(io.open(out_path, "w"))
local function w(s) f:write(s .. "\n") end
local function hx(v) return string.format("%02X", v or 0) end
w("frame=" .. tostring(emu.framecount()))
w("ROM8000=" .. hx(memory.read_u8(ROM8000)))
w("ROMA000=" .. hx(memory.read_u8(ROMA000)))
w("ROMC000=" .. hx(memory.read_u8(ROMC000)))
w("ROME000=" .. hx(memory.read_u8(ROME000)))
for r=0,7 do
  local vals = {}
  for c=0,7 do
    local off = 0x3C0 + r*8 + c
    vals[#vals+1] = hx(memory.read_u8(NT_BASE + off))
  end
  w(string.format("ATTR%01d=%s", r, table.concat(vals, " ")))
end
f:close()
client.exit()

