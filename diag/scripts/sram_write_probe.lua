local out_path = "C:/Users/Jake Diggity/Documents/GitHub/NES-TO-SEGA-GENESIS/diag/reports/sram_write_probe.txt"
local f = assert(io.open(out_path, "w"))

memory.usememorydomain("M68K BUS")

local function log(s)
  f:write(s .. "\n")
  f:flush()
end

log("SRAM WRITE PROBE START")
log(string.format("before FF6001=%02X FF7FFF=%02X", memory.read_u8(0xFF6001), memory.read_u8(0xFF7FFF)))

memory.write_u8(0xFF6001, 0x5A)
memory.write_u8(0xFF7FFF, 0xA5)

log("wrote markers FF6001=5A FF7FFF=A5")

for i=1,360 do
  emu.frameadvance()
end

log(string.format("after FF6001=%02X FF7FFF=%02X", memory.read_u8(0xFF6001), memory.read_u8(0xFF7FFF)))
log("SRAM WRITE PROBE COMPLETE")
f:close()
client.exitCode = 0
client.exit()
