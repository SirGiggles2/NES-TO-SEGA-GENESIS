-- Dump all 64 CRAM entries to the console.
-- Run from BizHawk: Tools > Lua Console > Open Script
-- Then advance to the title screen (frame ~163) and run.

memory.usememorydomain("CRAM")

local lines = {}
for row = 0, 3 do
    local parts = {}
    for col = 0, 15 do
        local idx = row * 16 + col
        local word = memory.read_u16_le(idx * 2)
        table.insert(parts, string.format("%04X", word))
    end
    table.insert(lines, string.format("cram[%02X-%02X]=%s", row*16, row*16+15, table.concat(parts, " ")))
end

for _, line in ipairs(lines) do
    print(line)
end
print("Done. Compare against Ares CRAM viewer.")
