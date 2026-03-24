-- zelda_canary.lua
-- Minimal canary: writes a file IMMEDIATELY at load time, before any frame advance.
-- If this file appears, BizHawk loaded and ran Lua.
-- If it doesn't appear, BizHawk is blocking Lua execution (modal dialog, crash, etc.)

local OUT = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\canary_ROMNAME.txt"

-- Write canary file immediately
local f = io.open(OUT, "w")
if f then
    f:write("BIZHAWK_LUA_ALIVE\n")
    f:write("Timestamp: " .. os.time() .. "\n")
    f:flush()
end

-- Read one memory byte to see if emulator is responsive
local ok, val = pcall(function() return memory.read_u8(0xFF0012) end)
if f then
    if ok then
        f:write("ram_script (0xFF0012) = " .. tostring(val) .. "\n")
    else
        f:write("memory.read_u8 failed: " .. tostring(val) .. "\n")
    end
end

-- Run a brief heartbeat loop so we can see if frames advance at all
local frames_done = 0
for i = 1, 120 do
    local ok2, err = pcall(function() emu.frameadvance() end)
    if not ok2 then
        if f then f:write("frameadvance error at i=" .. i .. ": " .. tostring(err) .. "\n") end
        break
    end
    frames_done = i
end

if f then
    f:write("frames_advanced = " .. frames_done .. "\n")
    local ok3, v2 = pcall(function() return memory.read_u8(0xFF0012) end)
    if ok3 then
        f:write("ram_script after frames = " .. tostring(v2) .. "\n")
    end
    f:write("DONE\n")
    f:close()
end
