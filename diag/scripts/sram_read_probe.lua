local out_path = "C:/Users/Jake Diggity/Documents/GitHub/NES-TO-SEGA-GENESIS/diag/reports/sram_read_probe.txt"
local f = assert(io.open(out_path, "w"))

memory.usememorydomain("M68K BUS")

local function log(s)
  f:write(s .. "\n")
  f:flush()
end

log("SRAM READ PROBE START")

for i=1,30 do
  emu.frameadvance()
end

local a = memory.read_u8(0xFF6001)
local b = memory.read_u8(0xFF7FFF)
log(string.format("read FF6001=%02X FF7FFF=%02X", a, b))

if a == 0x5A and b == 0xA5 then
  log("RESULT: PASS (startup SRAM load restored markers)")
else
  log("RESULT: FAIL (markers not restored)")
end

log("SRAM READ PROBE COMPLETE")
f:close()
client.exitCode = 0
client.exit()
