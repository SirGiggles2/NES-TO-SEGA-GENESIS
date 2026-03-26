local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')

local function get_system_id()
    local emu_table = rawget(_G, "emu")
    if type(emu_table) == "table" and type(emu_table.getsystemid) == "function" then
        local ok, value = pcall(emu_table.getsystemid)
        if ok and value ~= nil then
            return tostring(value)
        end
    end
    return "unknown"
end

local OUT_PATH = OUT_DIR .. "bizhawk_runtime_probe_" .. get_system_id() .. ".txt"
local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
end

local function dump_table(name)
    local value = rawget(_G, name)
    log(string.format("global.%s.type=%s", name, type(value)))
    if type(value) ~= "table" then
        return
    end

    local keys = {}
    for key, entry in pairs(value) do
        keys[#keys + 1] = string.format("%s:%s", tostring(key), type(entry))
    end
    table.sort(keys)
    log(string.format("global.%s.keys=%s", name, table.concat(keys, ",")))
end

local function log_runtime_snapshot(label)
    log("snapshot=" .. label)
    log("snapshot.system_id=" .. get_system_id())

    local joypad_value = rawget(_G, "joypad")
    log("snapshot.joypad.type=" .. type(joypad_value))
    if type(joypad_value) == "table" then
        log("snapshot.joypad.has_set=" .. tostring(type(joypad_value.set) == "function" or type(joypad_value.set) == "userdata"))
        log("snapshot.joypad.has_get=" .. tostring(type(joypad_value.get) == "function" or type(joypad_value.get) == "userdata"))
    end

    local event_value = rawget(_G, "event")
    log("snapshot.event.type=" .. type(event_value))
    if type(event_value) == "table" then
        log("snapshot.event.has_onframestart=" .. tostring(type(event_value.onframestart) == "function" or type(event_value.onframestart) == "userdata"))
        log("snapshot.event.has_oninputpoll=" .. tostring(type(event_value.oninputpoll) == "function" or type(event_value.oninputpoll) == "userdata"))
    end
end

log("=== BIZHAWK RUNTIME PROBE ===")
log("system_id=" .. get_system_id())

dump_table("joypad")
dump_table("event")
dump_table("input")
dump_table("movie")
dump_table("client")
dump_table("emu")
log_runtime_snapshot("startup")

local memory_table = rawget(_G, "memory")
if type(memory_table) == "table" and type(memory_table.getmemorydomainlist) == "function" then
    local ok, domains = pcall(memory_table.getmemorydomainlist)
    if ok and type(domains) == "table" then
        log("memory_domains=" .. table.concat(domains, ","))
    else
        log("memory_domains=unavailable")
    end
end

for frame = 1, 90 do
    emu.frameadvance()
    if frame == 1 or frame == 30 or frame == 60 or frame == 90 then
        log_runtime_snapshot("frame_" .. frame)
    end
end

log("=== BIZHAWK RUNTIME PROBE COMPLETE ===")
log_file:close()
client.exit()