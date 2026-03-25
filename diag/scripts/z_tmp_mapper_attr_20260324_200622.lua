local TARGET_FRAME = 900
local NT_BASE = 0xFF8200
memory.usememorydomain("M68K BUS")
while emu.framecount() < TARGET_FRAME do emu.frameadvance() end
local function hx(v) return string.format("%02X", v or 0) end
console.log("frame=" .. tostring(emu.framecount()))
console.log("ROM8000=" .. hx(memory.read_u8(0xFF8000)))
console.log("ROMA000=" .. hx(memory.read_u8(0xFFA000)))
console.log("ROMC000=" .. hx(memory.read_u8(0xFFC000)))
console.log("ROME000=" .. hx(memory.read_u8(0xFFE000)))
for r=0,7 do
  local vals = {}
  for c=0,7 do
    local off = 0x3C0 + r*8 + c
    vals[#vals+1] = hx(memory.read_u8(NT_BASE + off))
  end
  console.log(string.format("ATTR%01d=%s", r, table.concat(vals, " ")))
end
client.exit()
