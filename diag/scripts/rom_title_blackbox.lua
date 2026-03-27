-- rom_title_blackbox.lua
-- Generic BizHawk title-state probe for quick NES/Genesis black-box comparisons.

local OUT_DIR = "C:\\Users\\Jake Diggity\\Documents\\GitHub\\NES-TO-SEGA-GENESIS\\diag\\reports\\"
local SHOT_DIR = OUT_DIR .. "screens\\"
local SAMPLE_FRAME = 300

os.execute('if not exist "' .. OUT_DIR .. '" mkdir "' .. OUT_DIR .. '"')
os.execute('if not exist "' .. SHOT_DIR .. '" mkdir "' .. SHOT_DIR .. '"')

local function try_call(fn, ...)
    if type(fn) ~= "function" and type(fn) ~= "userdata" then
        return nil
    end
    local ok, value = pcall(fn, ...)
    if ok then
        return value
    end
    return nil
end

local function current_rom_name()
    return try_call(gameinfo and gameinfo.getromname)
        or try_call(gameinfo and gameinfo.getromfilename)
        or try_call(gameinfo and gameinfo.getfilename)
        or try_call(client and client.getromname)
        or try_call(client and client.getfilename)
        or try_call(emu and emu.getromname)
        or "unknown_rom"
end

local function sanitize_name(value)
    local text = tostring(value or "unknown_rom")
    text = text:gsub("\\", "/")
    text = text:gsub("^.*[/]", "")
    text = text:gsub("%.[^.]+$", "")
    text = text:gsub("[^%w]+", "_")
    text = text:gsub("^_+", "")
    text = text:gsub("_+$", "")
    if text == "" then
        text = "unknown_rom"
    end
    return text
end

local SYSTEM_ID = tostring(try_call(emu and emu.getsystemid) or "unknown"):lower()
local ROM_STEM = sanitize_name(current_rom_name())
local OUT_PATH = OUT_DIR .. ROM_STEM .. "_" .. SYSTEM_ID .. "_title_blackbox.txt"
local SHOT_PATH = SHOT_DIR .. ROM_STEM .. "_" .. SYSTEM_ID .. "_title_blackbox.png"

local log_file = assert(io.open(OUT_PATH, "w"))

local function log(msg)
    log_file:write(msg .. "\n")
    log_file:flush()
end

local function hex(value, width)
    return string.format("%0" .. tostring(width or 2) .. "X", value or 0)
end

local function get_domains()
    local list = try_call(memory and memory.getmemorydomainlist)
    if type(list) == "table" then
        return list
    end
    return {}
end

local function has_domain(name)
    for _, domain in ipairs(get_domains()) do
        if domain == name then
            return true
        end
    end
    return false
end

local function pick_domain(candidates)
    for _, name in ipairs(candidates) do
        if has_domain(name) then
            return name
        end
    end
    return nil
end

local function with_domain(domain, fn)
    if not domain then
        return false
    end
    local ok = pcall(memory.usememorydomain, domain)
    if not ok then
        return false
    end
    local inner_ok, inner_err = pcall(fn)
    if not inner_ok then
        log("domain_error[" .. tostring(domain) .. "]=" .. tostring(inner_err))
    end
    return inner_ok
end

local function log_client_dimensions()
    local buffer_w = try_call(client and client.bufferwidth)
    local buffer_h = try_call(client and client.bufferheight)
    local screen_w = try_call(client and client.screenwidth)
    local screen_h = try_call(client and client.screenheight)
    log(string.format(
        "client.buffer=%sx%s client.screen=%sx%s",
        tostring(buffer_w), tostring(buffer_h), tostring(screen_w), tostring(screen_h)
    ))
end

local function dump_words(domain, first_word, last_word, address_scale, label)
    with_domain(domain, function()
        for first = first_word, last_word, 16 do
            local parts = {}
            local final = math.min(first + 15, last_word)
            for i = first, final do
                local addr = i * address_scale
                parts[#parts + 1] = hex(memory.read_u16_be(addr) or 0, 4)
            end
            log(string.format("%s[%02X-%02X]=%s", label, first, final, table.concat(parts, " ")))
        end
    end)
end

local function dump_bytes(domain, start_addr, end_addr, label)
    with_domain(domain, function()
        for first = start_addr, end_addr, 16 do
            local parts = {}
            local final = math.min(first + 15, end_addr)
            for addr = first, final do
                parts[#parts + 1] = hex(memory.read_u8(addr) or 0, 2)
            end
            log(string.format("%s[%04X-%04X]=%s", label, first, final, table.concat(parts, " ")))
        end
    end)
end

local function dump_genesis_state()
    log("mode=genesis")
    dump_words("CRAM", 0x00, 0x3F, 2, "cram")
    dump_words("VSRAM", 0x00, 0x0F, 2, "vsram")
end

local function dump_nes_state()
    log("mode=nes")

    local ram_domain = pick_domain({"RAM", "System Bus"})
    log("ram_domain=" .. tostring(ram_domain))
    if ram_domain then
        dump_bytes(ram_domain, 0x0000, 0x00FF, "cpu_ram_low")
        dump_bytes(ram_domain, 0x0200, 0x021F, "oam_shadow")
        dump_bytes(ram_domain, 0x0300, 0x031F, "vram_buffer")
    end

    local palette_domain = pick_domain({"Palette RAM", "PALRAM", "PPU Bus"})
    log("palette_domain=" .. tostring(palette_domain))
    if palette_domain == "Palette RAM" or palette_domain == "PALRAM" then
        dump_bytes(palette_domain, 0x0000, 0x001F, "ppu_palette")
    elseif palette_domain == "PPU Bus" then
        dump_bytes(palette_domain, 0x3F00, 0x3F1F, "ppu_palette")
    end
end

log("=== ROM TITLE BLACKBOX ===")
log("system_id=" .. SYSTEM_ID)
log("rom_name=" .. tostring(current_rom_name()))
log("out_path=" .. OUT_PATH)
log("shot_path=" .. SHOT_PATH)
log("memory_domains=" .. table.concat(get_domains(), ","))
log_client_dimensions()

for frame = 1, SAMPLE_FRAME do
    emu.frameadvance()
    if frame == 1 or frame == 60 or frame == 120 or frame == 180 or frame == 240 or frame == SAMPLE_FRAME then
        log("frame=" .. tostring(frame))
    end
end

pcall(function() client.screenshot(SHOT_PATH) end)
log("screenshot=" .. SHOT_PATH)
log_client_dimensions()

if has_domain("CRAM") then
    dump_genesis_state()
else
    dump_nes_state()
end

log("=== ROM TITLE BLACKBOX COMPLETE ===")
log_file:close()
client.exit()
