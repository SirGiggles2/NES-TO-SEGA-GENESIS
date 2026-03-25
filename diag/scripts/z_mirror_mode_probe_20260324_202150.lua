local OUT_DIR = "C:/Users/Jake Diggity/Documents/GitHub/NES-TO-SEGA-GENESIS/diag/reports/"
local TARGET_FRAME = 900
memory.usememorydomain("M68K BUS")
while emu.framecount() < TARGET_FRAME do emu.frameadvance() end
local out = assert(io.open(OUT_DIR .. "mirror_mode_v552_" .. os.date("%Y%m%d_%H%M%S") .. ".txt", "w"))
out:write(string.format("frame=%d\n", emu.framecount()))
out:write(string.format("PPU_MIRROR_MODE=%02X\n", memory.read_u8(0xFFEF17) or 0))
out:write(string.format("ROM8000=%02X\n", memory.read_u8(0xFF8000) or 0))
out:write(string.format("ROMA000=%02X\n", memory.read_u8(0xFFA000) or 0))
out:close()
client.exit()
