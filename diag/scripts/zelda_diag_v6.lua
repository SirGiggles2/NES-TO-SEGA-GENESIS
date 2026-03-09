-- ============================================================
--  zelda_diag.lua  -  Automated Zelda Genesis Port Diagnostics
--  v6 - Deep telemetry build
--
--  Focus:
--   * stronger VDP/NMI visibility
--   * helper-call heuristics from hot PC windows
--   * better transition logging
--   * stronger RAM/VRAM/CRAM summaries
--   * explicit detection of VINT being enabled then lost
--   * explicit detection of $2000/$2001/$2005/$2006/$2007 activity
-- ============================================================

-- ======================== CONFIG ============================
local NUM_FRAMES    = 300
local REPORT_PATH   = "D:\\Zelda port CHAT GPT\\diag_report.txt"
local ROM_DIR       = "D:\\Zelda port CHAT GPT\\"
local SCREENSHOT_AT = {1, 30, 60, 120, 180, 240, 300}
local SAMPLE_VRAM   = true
local SAMPLE_CRAM   = true
local POLL_SECONDS  = 3
local PC_DUMP_BEFORE = 16
local PC_DUMP_AFTER  = 48
local TOP_PC_DUMPS   = 8
local STATUS_Y       = 0

-- Suspect helper/logic addresses we care about (from current port work)
local HOT_SYMBOLS = {
    {name="PPU_WRITE_2000", addr=0x000534},
    {name="PPU_READ_2002",  addr=0x0004BC},
    {name="PPU_WRITE_2006", addr=0x000544},
    {name="PPU_WRITE_2007", addr=0x000576},
    {name="TITLE/NMI LOOP", addr=0x014B80},
    {name="vec_0x01E494_NMI", addr=0x01E494}, -- may not exist in current ROM window, but useful if present
}
-- ============================================================

-- ======================== HELPERS ============================
local function hex(val, digits)
    digits = digits or 2
    if val == nil then val = 0 end
    if val < 0 then val = 0 end
    return string.format("$%0" .. digits .. "X", val)
end

local function read_ram(addr, sz)
    if sz == 4 then
        return memory.read_u32_be(addr, "68K RAM")
    elseif sz == 2 then
        return memory.read_u16_be(addr, "68K RAM")
    else
        return memory.readbyte(addr, "68K RAM")
    end
end

local function safe_read_u16(domain, addr)
    local ok, v = pcall(memory.read_u16_be, addr, domain)
    if ok then return v end
    return 0
end

local function safe_read_byte(domain, addr)
    local ok, v = pcall(memory.readbyte, addr, domain)
    if ok then return v end
    return 0
end

local function scan_roms()
    local roms = {}
    local handle = io.popen('dir /b /o-d "' .. ROM_DIR .. 'zelda_v*.md" 2>nul')
    if handle then
        for line in handle:lines() do roms[#roms+1] = line end
        handle:close()
    end
    return roms
end

local function get_latest_rom()
    local roms = scan_roms()
    if #roms > 0 then return roms[1] end
    return nil
end

local function get_domain_list()
    local ok, list = pcall(memory.getmemorydomainlist)
    if ok and list then return list end
    return {}
end

local function domain_exists(name)
    for _, d in ipairs(get_domain_list()) do
        if d == name then return true end
    end
    return false
end

local function pick_rom_domain()
    local candidates = {"MD CART", "Genesis ROM", "ROM", "M68K BUS", "68K BUS"}
    for _, d in ipairs(candidates) do
        if domain_exists(d) then return d end
    end
    return nil
end

local function get_domain_size(name)
    local ok, size = pcall(memory.getmemorydomainsize, name)
    if ok then return size end
    return nil
end

local function read_rom_byte(addr, rom_domain)
    if not rom_domain then return nil end
    if addr < 0 then return nil end
    local ok, val = pcall(memory.readbyte, addr, rom_domain)
    if ok then return val end
    return nil
end

local function dump_rom_bytes(center_pc, before_count, after_count, rom_domain)
    local lines = {}
    if not rom_domain then
        lines[#lines+1] = "  ROM domain not found; cannot dump bytes around PC."
        return lines
    end

    local rom_size = get_domain_size(rom_domain)
    if not rom_size then
        lines[#lines+1] = "  Could not determine ROM size for domain " .. rom_domain
        return lines
    end

    local start_addr = center_pc - before_count
    local end_addr   = center_pc + after_count
    if start_addr < 0 then start_addr = 0 end
    if end_addr >= rom_size then end_addr = rom_size - 1 end

    lines[#lines+1] = "  ROM domain: " .. rom_domain
    lines[#lines+1] = "  ROM size: " .. hex(rom_size, 6)
    lines[#lines+1] = "  Byte window: " .. hex(start_addr, 6) .. " - " .. hex(end_addr, 6)

    local row_start = start_addr - (start_addr % 16)
    while row_start <= end_addr do
        local row = string.format("  %s:", hex(row_start, 6))
        local ascii = ""
        for i = 0, 15 do
            local a = row_start + i
            if a >= 0 and a < rom_size then
                local b = read_rom_byte(a, rom_domain)
                if b == nil then
                    row = row .. " ??"
                    ascii = ascii .. "."
                else
                    row = row .. " " .. string.format("%02X", b)
                    if b >= 32 and b <= 126 then ascii = ascii .. string.char(b) else ascii = ascii .. "." end
                end
            else
                row = row .. "   "
                ascii = ascii .. " "
            end
        end
        row = row .. "  |" .. ascii .. "|"
        lines[#lines+1] = row
        row_start = row_start + 16
    end
    return lines
end

local function append_lines(dst, src)
    for _, s in ipairs(src) do dst[#dst+1] = s end
end

local function count_nonzero_unique(tbl)
    local c = 0
    for k,_ in pairs(tbl) do if k ~= 0 then c = c + 1 end end
    return c
end

-- ======================== RAM WATCHES ============================
local WATCHES = {
    {addr=0x0000, sz=1, name="ppu_data_lo",    desc="PPU buf ptr lo  [ZP $00]"},
    {addr=0x0001, sz=1, name="ppu_data_hi",    desc="PPU buf ptr hi  [ZP $01]"},
    {addr=0x0004, sz=1, name="obj_pos_x",      desc="object X-ish scratch [ZP $04]"},
    {addr=0x0005, sz=1, name="obj_pos_y",      desc="object Y-ish scratch [ZP $05]"},
    {addr=0x0010, sz=1, name="game_mode",      desc="dungeon_level/game mode [ZP $10]"},
    {addr=0x0011, sz=1, name="screen_ready",   desc="screen_ready_flag (0=init) [ZP $11]"},
    {addr=0x0012, sz=1, name="ram_script",     desc="current script# (0=title) [ZP $12]"},
    {addr=0x0013, sz=1, name="ram_subscript",  desc="sub-script [ZP $13]"},
    {addr=0x0014, sz=1, name="ppu_load_index", desc="PPU data table index [ZP $14]"},
    {addr=0x0015, sz=1, name="ram_frm_cnt",    desc="frame counter / NMI completion [ZP $15]"},
    {addr=0x0016, sz=1, name="cur_save_slot",  desc="current save slot [ZP $16]"},
    {addr=0x0017, sz=1, name="rendering_flag", desc="blocks render enable [ZP $17]"},
    {addr=0x005B, sz=1, name="ram_next_script",desc="next_script [ZP $5B]"},
    {addr=0x005C, sz=1, name="ram_005C",       desc="NMI toggle flag [ZP $5C]"},
    {addr=0x006C, sz=1, name="link_dir",       desc="direction / state scratch [ZP $6C]"},
    {addr=0x0070, sz=1, name="obj_id_0",       desc="object slot 0 id [ZP $70]"},
    {addr=0x0071, sz=1, name="obj_id_1",       desc="object slot 1 id [ZP $71]"},
    {addr=0x00E0, sz=1, name="pause_flag",     desc="pause_flag [ZP $E0]"},
    {addr=0x00E1, sz=1, name="pause_script",   desc="pause_script [ZP $E1]"},
    {addr=0x00E3, sz=1, name="screen_trans",   desc="screen_transition_flag [ZP $E3]"},
    {addr=0x00F4, sz=1, name="ram_00F4",       desc="reset/setup flag [ZP $F4]"},
    {addr=0x00F8, sz=1, name="btn_press_lo",   desc="button press lo byte"},
    {addr=0x00F9, sz=1, name="btn_press_hi",   desc="button press hi byte"},
    {addr=0x00FA, sz=1, name="btn_hold_lo",    desc="button hold lo byte"},
    {addr=0x00FB, sz=1, name="btn_hold_hi",    desc="button hold hi byte"},
    {addr=0x00FC, sz=1, name="scroll_Y",       desc="ram_scroll_Y [ZP $FC]"},
    {addr=0x00FD, sz=1, name="scroll_X",       desc="ram_scroll_X [ZP $FD]"},
    {addr=0x00FE, sz=1, name="ram_for_2001",   desc="PPU $2001 mirror - render ctrl [ZP $FE]"},
    {addr=0x00FF, sz=1, name="ram_for_2000",   desc="PPU $2000 mirror - NMI enable bit7 [ZP $FF]"},
    {addr=0x0200, sz=1, name="oam_0_y",        desc="OAM sprite0 Y"},
    {addr=0x0201, sz=1, name="oam_0_tile",     desc="OAM sprite0 tile"},
    {addr=0x0202, sz=1, name="oam_0_attr",     desc="OAM sprite0 attr"},
    {addr=0x0203, sz=1, name="oam_0_x",        desc="OAM sprite0 X"},
    {addr=0x0300, sz=1, name="ppu_buf_status", desc="$3F when buffer write complete"},
    {addr=0x0301, sz=1, name="ppu_buf_index",  desc="PPU buffer write index"},
    {addr=0x0302, sz=1, name="ppu_buf_0",      desc="PPU buffer[0] ($FF=terminator)"},
    {addr=0x0303, sz=1, name="ppu_buf_1",      desc="PPU buffer[1]"},
    {addr=0x0304, sz=1, name="ppu_buf_2",      desc="PPU buffer[2]"},
    {addr=0x0305, sz=1, name="ppu_buf_3",      desc="PPU buffer[3]"},
    {addr=0x0310, sz=1, name="ppu_buf_16",     desc="PPU buffer[16]"},
    {addr=0x0311, sz=1, name="ppu_buf_17",     desc="PPU buffer[17]"},
    {addr=0xEF00, sz=1, name="PPUCTRL_SHADOW", desc="Shadow PPU $2000"},
    {addr=0xEF01, sz=1, name="PPUMASK_SHADOW", desc="Shadow PPU $2001"},
    {addr=0xEF04, sz=1, name="PPUADDR_LATCH",  desc="PPUADDR latch state"},
    {addr=0xEF05, sz=1, name="PPUSCROLL_X_sh", desc="HScroll shadow"},
    {addr=0xEF06, sz=1, name="PPUSCROLL_Y_sh", desc="VScroll shadow"},
    {addr=0xEF07, sz=1, name="PPUSCROLL_LATCH",desc="PPUSCROLL latch state"},
    {addr=0xEF08, sz=2, name="VRAM_ADDR_CURR", desc="Current VRAM write addr"},
    {addr=0xEF0A, sz=1, name="VDP_REG1",       desc="VDP Mode2 shadow"},
    {addr=0xEE00, sz=4, name="CRASH_SP",       desc="Crash logger SP (optional)"},
    {addr=0xEE04, sz=2, name="CRASH_SR",       desc="Crash logger SR (optional)"},
    {addr=0xEE06, sz=4, name="CRASH_PC",       desc="Crash logger PC (optional)"},
    {addr=0xEE0A, sz=2, name="CRASH_VEC",      desc="Crash logger vector/format (optional)"},
}

local function run_diagnostics(rom_name)
    local report = {}
    local function log(s) report[#report+1] = s end
    local function log_sep(title)
        log("")
        log("=== " .. title .. " " .. string.rep("=", math.max(0, 58 - #title)))
    end

    local rom_domain = pick_rom_domain()

    local ram_prev, ram_changes = {}, {}
    local pc_histogram = {}
    local helper_hits = {}
    local pc_min, pc_max = 0xFFFFFF, 0
    local vram_nonzero, cram_data = 0, {}
    local milestones = {}
    local stuck_pc, stuck_count, last_pc = nil, 0, 0
    local screenshots_taken, screenshot_set = {}, {}
    local vdp_reg1_transitions = {}
    local vdp_lost_vint = false
    local vdp_lost_frame = nil
    local ppu2000_nonzero_frame = nil
    local ppu2001_nonzero_frame = nil
    local last_vdp_reg1 = nil
    local prev_frmcnt = nil
    local nmi_run_count = 0
    local mode_seen = {}
    local max_vram_addr = 0
    local min_vram_addr = 0xFFFF
    local unique_pc_count = 0
    local pc_seen = {}
    local pc_run_len, longest_same_pc, longest_same_pc_addr = 0, 0, 0
    local oam_nonzero_words = 0

    for _, f in ipairs(SCREENSHOT_AT) do screenshot_set[f] = true end
    local function add_ms(frame, event) milestones[#milestones+1] = {frame=frame, event=event} end

    memory.usememorydomain("68K RAM")
    for _, w in ipairs(WATCHES) do
        local val = read_ram(w.addr, w.sz)
        ram_prev[w.addr] = val
        ram_changes[w.addr] = {
            count=0, first_frame=-1, last_frame=-1,
            first_val=val, last_val=val,
            min_val=val, max_val=val,
            unique={[val]=true}, history={}
        }
    end
    prev_frmcnt = read_ram(0x0015,1)
    last_vdp_reg1 = read_ram(0xEF0A,1)

    for i = 1, NUM_FRAMES do
        local regs = emu.getregisters()
        local pc = regs["M68K PC"] or regs["PC"] or 0
        pc_histogram[pc] = (pc_histogram[pc] or 0) + 1
        if not pc_seen[pc] then pc_seen[pc] = true; unique_pc_count = unique_pc_count + 1 end
        if pc < pc_min then pc_min = pc end
        if pc > pc_max then pc_max = pc end

        for _, sym in ipairs(HOT_SYMBOLS) do
            if pc >= sym.addr and pc < (sym.addr + 0x20) then
                helper_hits[sym.name] = (helper_hits[sym.name] or 0) + 1
            end
        end

        if pc == last_pc then
            stuck_count = stuck_count + 1
            pc_run_len = pc_run_len + 1
            if stuck_count == 30 and not stuck_pc then
                stuck_pc = pc
                add_ms(i, "STUCK: PC=" .. hex(pc,6) .. " for 30+ frames")
            end
            if pc_run_len > longest_same_pc then
                longest_same_pc = pc_run_len
                longest_same_pc_addr = pc
            end
        else
            stuck_count = 0
            pc_run_len = 1
        end
        last_pc = pc

        for _, w in ipairs(WATCHES) do
            local val = read_ram(w.addr, w.sz)
            local prev = ram_prev[w.addr]
            local info = ram_changes[w.addr]
            if val ~= prev then
                info.count = info.count + 1
                if info.first_frame == -1 then info.first_frame = i end
                info.last_frame = i
                info.last_val = val
                if val < info.min_val then info.min_val = val end
                if val > info.max_val then info.max_val = val end
                info.unique[val] = true
                if #info.history < 50 then
                    info.history[#info.history+1] = {frame=i, old=prev, new=val}
                end
                ram_prev[w.addr] = val
            end
        end

        local r2000  = read_ram(0x00FF,1)
        local r2001  = read_ram(0x00FE,1)
        local reg1   = read_ram(0xEF0A,1)
        local ppuctrl= read_ram(0xEF00,1)
        local mode   = read_ram(0x0010,1)
        local sub    = read_ram(0x0011,1)
        local frmcnt = read_ram(0x0015,1)
        local vramc  = read_ram(0xEF08,2)
        if vramc > max_vram_addr then max_vram_addr = vramc end
        if vramc < min_vram_addr then min_vram_addr = vramc end

        if ppu2000_nonzero_frame == nil and r2000 ~= 0 then
            ppu2000_nonzero_frame = i
            add_ms(i, "ram_for_2000 became nonzero: " .. hex(r2000))
        end
        if ppu2001_nonzero_frame == nil and r2001 ~= 0 then
            ppu2001_nonzero_frame = i
            add_ms(i, "ram_for_2001 became nonzero: " .. hex(r2001))
        end
        if ppuctrl ~= 0 and ram_changes[0xEF00].count == 1 and ram_changes[0xEF00].last_frame == i then
            add_ms(i, "PPU_WRITE_2000 set shadow=" .. hex(ppuctrl))
        end
        if r2001 >= 0x08 and ram_changes[0x00FE].count == 1 and ram_changes[0x00FE].last_frame == i then
            add_ms(i, "RENDER ENABLED: ram_for_2001=" .. hex(r2001))
        end
        if (reg1 & 0x20) ~= 0 and (last_vdp_reg1 & 0x20) == 0 then
            add_ms(i, "VDP VINT ON: VDP_REG1=" .. hex(reg1))
        end
        if (reg1 & 0x40) ~= 0 and (last_vdp_reg1 & 0x40) == 0 then
            add_ms(i, "VDP DISPLAY ON: VDP_REG1=" .. hex(reg1))
        end
        if (last_vdp_reg1 & 0x20) ~= 0 and (reg1 & 0x20) == 0 and not vdp_lost_vint then
            vdp_lost_vint = true
            vdp_lost_frame = i
            add_ms(i, "VDP VINT LOST: VDP_REG1=" .. hex(reg1))
        end
        if reg1 ~= last_vdp_reg1 then
            vdp_reg1_transitions[#vdp_reg1_transitions+1] = {frame=i, old=last_vdp_reg1, new=reg1}
            last_vdp_reg1 = reg1
        end
        if frmcnt ~= prev_frmcnt then
            nmi_run_count = nmi_run_count + 1
            add_ms(i, "ram_frm_cnt changed: " .. hex(prev_frmcnt) .. " -> " .. hex(frmcnt))
            prev_frmcnt = frmcnt
        end

        local mk = hex(mode) .. "/" .. hex(sub)
        if not mode_seen[mk] then mode_seen[mk] = true; add_ms(i, "GAME MODE: dungeon=" .. hex(mode) .. " screen_ready=" .. hex(sub)) end
        local uflag = read_ram(0x0300,1)
        if uflag == 0x3F and ram_changes[0x0300].count == 0 and i == 1 then
            add_ms(i, "PPU BUFFER WRITE COMPLETE: $0300=$3F")
        elseif uflag == 0x3F and ram_changes[0x0300].count > 0 and ram_changes[0x0300].last_frame == i then
            add_ms(i, "PPU BUFFER WRITE COMPLETE: $0300=$3F")
        end

        local status = string.format("[%s] F:%d PC:%s r2000:%s r2001:%s reg1:%s frm:%s vram:%s",
            rom_name or "?", i, hex(pc,6), hex(r2000), hex(r2001), hex(reg1), hex(frmcnt), hex(vramc,4))
        gui.drawText(0, STATUS_Y, status, 0xFFFFFFFF, 0xCC000000, 10)

        if screenshot_set[i] then
            local fname = "zelda_diag_f" .. string.format("%03d", i) .. ".png"
            client.screenshot(fname)
            screenshots_taken[#screenshots_taken+1] = fname
        end
        emu.frameadvance()
    end

    if SAMPLE_VRAM then
        local vram_regions = {}
        for addr = 0, 65535, 2 do
            local val = safe_read_u16("VRAM", addr)
            if val ~= 0 then
                vram_nonzero = vram_nonzero + 1
                local block = math.floor(addr / 1024)
                vram_regions[block] = (vram_regions[block] or 0) + 1
            end
        end
        ram_changes.vram_regions = vram_regions
    end

    if SAMPLE_CRAM then
        for addr = 0, 127, 2 do
            cram_data[#cram_data+1] = safe_read_u16("CRAM", addr)
        end
    end

    for addr = 0x0200, 0x027F, 2 do
        if safe_read_byte("68K RAM", addr) ~= 0 or safe_read_byte("68K RAM", addr+1) ~= 0 then
            oam_nonzero_words = oam_nonzero_words + 1
        end
    end

    log("================================================================")
    log("  ZELDA GENESIS PORT - DIAGNOSTIC REPORT  v6")
    log("  ROM: " .. (rom_name or "(unknown)"))
    log("  Frames: " .. NUM_FRAMES .. "  (~" .. string.format("%.1f", NUM_FRAMES/60.0) .. "s)")
    log("  Report path: " .. REPORT_PATH)
    log("  ROM dir: " .. ROM_DIR)
    log("  ROM domain: " .. (rom_domain or "(not found)"))
    log("================================================================")

    log_sep("EXECUTIVE SUMMARY")
    local checks = {}
    local final_r2000 = read_ram(0x00FF,1)
    local final_reg1  = read_ram(0xEF0A,1)
    local final_shadow= read_ram(0xEF00,1)

    if (final_r2000 & 0x80) ~= 0 then
        checks[#checks+1] = "PASS  NMI enabled (ram_for_2000 bit7=1)"
    elseif final_r2000 ~= 0 then
        checks[#checks+1] = "WARN  NMI partially set (ram_for_2000=" .. hex(final_r2000) .. " bit7=0)"
    else
        checks[#checks+1] = "FAIL  NMI never enabled (ram_for_2000 always 0)"
    end

    if nmi_run_count > 0 then
        checks[#checks+1] = "PASS  NMI handler visibly completed (ram_frm_cnt changed " .. nmi_run_count .. " times)"
    else
        checks[#checks+1] = "FAIL  NMI handler never visibly completed (ram_frm_cnt stuck)"
    end

    if final_shadow ~= 0 then
        checks[#checks+1] = "PASS  PPU_WRITE_2000 updated shadow (PPUCTRL_SHADOW=" .. hex(final_shadow) .. ")"
    else
        checks[#checks+1] = "FAIL  PPU_WRITE_2000 never updated shadow"
    end

    if (final_reg1 & 0x20) ~= 0 then
        checks[#checks+1] = "PASS  VDP VINT enabled"
    else
        checks[#checks+1] = "FAIL  VDP VINT never enabled"
    end

    if (final_reg1 & 0x40) ~= 0 then
        checks[#checks+1] = "PASS  VDP display enabled"
    else
        checks[#checks+1] = "FAIL  VDP display never enabled"
    end

    if vram_nonzero > 0 then checks[#checks+1] = "PASS  VRAM has " .. vram_nonzero .. " nonzero words" else checks[#checks+1] = "FAIL  VRAM completely empty" end

    local palette_nonzero = 0
    for _, v in ipairs(cram_data) do if v ~= 0 then palette_nonzero = palette_nonzero + 1 end end
    if palette_nonzero > 0 then checks[#checks+1] = "PASS  CRAM has " .. palette_nonzero .. " nonzero colors" else checks[#checks+1] = "FAIL  CRAM empty" end

    if read_ram(0x0300,1) == 0x3F then checks[#checks+1] = "PASS  PPU buffer write completed" else checks[#checks+1] = "FAIL  PPU buffer write never completed (ppu_buf_0=" .. hex(read_ram(0x0302,1)) .. ")" end
    if not stuck_pc then checks[#checks+1] = "PASS  CPU not stuck in a single location" else checks[#checks+1] = "FAIL  CPU STUCK at PC=" .. hex(stuck_pc,6) .. " for 30+ frames" end
    if read_ram(0x00FE,1) >= 0x08 then checks[#checks+1] = "PASS  Rendering enabled (ram_for_2001=" .. hex(read_ram(0x00FE,1)) .. ")" else checks[#checks+1] = "WARN  Rendering never enabled" end

    local unique_modes = 0
    for _ in pairs(mode_seen) do unique_modes = unique_modes + 1 end
    if unique_modes > 1 then checks[#checks+1] = "PASS  Game mode changed (" .. unique_modes .. " states seen)" else checks[#checks+1] = "WARN  Game mode never changed (stuck in mode " .. hex(read_ram(0x0010,1)) .. ")" end
    if ram_changes[0xEF05].count > 0 or ram_changes[0xEF06].count > 0 then checks[#checks+1] = "PASS  Scroll shadows changed" else checks[#checks+1] = "WARN  No scroll shadow activity observed" end
    if vdp_lost_vint then checks[#checks+1] = "WARN  VDP VINT was enabled then lost at frame " .. tostring(vdp_lost_frame) end

    local crash_pc = read_ram(0xEE06,4)
    if crash_pc ~= 0 then
        checks[#checks+1] = "FAIL  EXCEPTION_HANDLER hit! crash_pc=" .. hex(crash_pc,8)
    end

    local pass_count, fail_count = 0, 0
    for _, c in ipairs(checks) do
        log("  " .. c)
        if c:sub(1,4) == "PASS" then pass_count = pass_count + 1 end
        if c:sub(1,4) == "FAIL" then fail_count = fail_count + 1 end
    end
    log("")
    log("  Score: " .. pass_count .. " PASS / " .. fail_count .. " FAIL / " .. (#checks - pass_count - fail_count) .. " WARN")
    log("  NMI completion count: " .. nmi_run_count)
    log("  PC range observed: " .. hex(pc_min,6) .. " - " .. hex(pc_max,6))
    log("  Unique PCs sampled: " .. tostring(unique_pc_count))
    log("  Longest same-PC run: " .. tostring(longest_same_pc) .. " frames at " .. hex(longest_same_pc_addr,6))

    log_sep("MILESTONES (chronological)")
    if #milestones == 0 then log("  (none detected)") else table.sort(milestones, function(a,b) return a.frame < b.frame end) for _,m in ipairs(milestones) do log("  Frame " .. string.format("%4d", m.frame) .. ": " .. m.event) end end

    log_sep("DEEP DIAG / INTERPRETATION")
    log("  Helper activity heuristic:")
    for _, sym in ipairs(HOT_SYMBOLS) do
        log(string.format("    %-18s  %4d frames in sampled windows near %s", sym.name, helper_hits[sym.name] or 0, hex(sym.addr,6)))
    end
    log("  VRAM addr observed min/max: " .. hex(min_vram_addr,4) .. " / " .. hex(max_vram_addr,4))
    log("  OAM nonzero pairs in $0200-$027F: " .. tostring(oam_nonzero_words))
    log("  PPUCTRL first nonzero frame: " .. tostring(ppu2000_nonzero_frame or "never"))
    log("  PPUMASK first nonzero frame: " .. tostring(ppu2001_nonzero_frame or "never"))
    log("  VDP REG1 transitions: " .. tostring(#vdp_reg1_transitions))
    if #vdp_reg1_transitions > 0 then
        for i = 1, math.min(10, #vdp_reg1_transitions) do
            local t = vdp_reg1_transitions[i]
            log("    Frame " .. string.format("%4d", t.frame) .. ": " .. hex(t.old) .. " -> " .. hex(t.new))
        end
    end

    log_sep("RAM WATCH SUMMARY")
    log(string.format("  %-20s  %-10s  %-8s  %-10s  %-10s  %s", "Name", "Final", "Changes", "Min", "Max", "Description"))
    log("  " .. string.rep("-", 95))
    for _, w in ipairs(WATCHES) do
        local info = ram_changes[w.addr]
        local digits = (w.sz == 4) and 8 or ((w.sz == 2) and 4 or 2)
        log(string.format("  %-20s  %-10s  %-8d  %-10s  %-10s  %s", w.name, hex(info.last_val, digits), info.count, hex(info.min_val, digits), hex(info.max_val, digits), w.desc))
    end

    log_sep("RAM CHANGE HISTORY (all key vars with any change)")
    for _, w in ipairs(WATCHES) do
        local info = ram_changes[w.addr]
        if info.count > 0 and #info.history > 0 then
            local digits = (w.sz == 4) and 8 or ((w.sz == 2) and 4 or 2)
            log("  " .. w.name .. " [" .. hex(w.addr,4) .. "] - " .. info.count .. " changes:")
            local show = math.min(#info.history, 20)
            for j = 1, show do
                local h = info.history[j]
                log("    Frame " .. string.format("%4d", h.frame) .. ": " .. hex(h.old, digits) .. " -> " .. hex(h.new, digits))
            end
            if #info.history > 20 then log("    ... (" .. (#info.history - 20) .. " more)") end
        end
    end

    if SAMPLE_VRAM then
        log_sep("VRAM CONTENT")
        log("  Nonzero words: " .. vram_nonzero .. " / 32768")
        local blocks = {}
        for k,v in pairs(ram_changes.vram_regions or {}) do blocks[#blocks+1] = {block=k,count=v} end
        table.sort(blocks, function(a,b) return a.block < b.block end)
        for _, b in ipairs(blocks) do
            local base = b.block * 1024
            log(string.format("    VRAM $%04X-$%04X: %d nonzero words", base, base+1023, b.count))
        end
    end

    if SAMPLE_CRAM then
        log_sep("CRAM / PALETTE")
        log("  Nonzero entries: " .. palette_nonzero .. " / 64")
        for pal = 0, 3 do
            local pline = "  Palette " .. pal .. ":"
            for c = 0, 15 do
                local idx = pal*16+c+1
                pline = pline .. " " .. hex(cram_data[idx] or 0, 4)
            end
            log(pline)
        end
    end

    log_sep("PC HOTSPOTS (sampled once/frame)")
    log("  PC range this run: " .. hex(pc_min,6) .. " - " .. hex(pc_max,6))
    local pc_sorted = {}
    for pc_val, count in pairs(pc_histogram) do pc_sorted[#pc_sorted+1] = {pc=pc_val, count=count} end
    table.sort(pc_sorted, function(a,b) return a.count > b.count end)
    for idx = 1, math.min(#pc_sorted, 30) do
        local p = pc_sorted[idx]
        log(string.format("  %s: %4d frames (%.1f%%)", hex(p.pc,6), p.count, p.count/NUM_FRAMES*100))
    end

    log_sep("ROM BYTE DUMPS AROUND STUCK/HOT PCS")
    if stuck_pc then
        log("  STUCK PC dump for " .. hex(stuck_pc,6))
        append_lines(report, dump_rom_bytes(stuck_pc, PC_DUMP_BEFORE, PC_DUMP_AFTER, rom_domain))
    else
        log("  No stuck PC detected.")
    end
    for i = 1, math.min(#pc_sorted, TOP_PC_DUMPS) do
        local p = pc_sorted[i]
        log("")
        log("  HOT PC #" .. i .. "  " .. hex(p.pc,6) .. "  (" .. p.count .. " frames)")
        append_lines(report, dump_rom_bytes(p.pc, PC_DUMP_BEFORE, PC_DUMP_AFTER, rom_domain))
    end

    local crash_pc2 = read_ram(0xEE06,4)
    if crash_pc2 ~= 0 then
        log("")
        log("  CRASH PC BYTE DUMP")
        append_lines(report, dump_rom_bytes(crash_pc2, 16, 48, rom_domain))
    end

    log_sep("FINAL CPU STATE")
    local regs = emu.getregisters()
    local reg_names = {"M68K D0","M68K D1","M68K D2","M68K D3","M68K D4","M68K D5","M68K D6","M68K D7","M68K A0","M68K A1","M68K A2","M68K A3","M68K A4","M68K A5","M68K A6","M68K A7","M68K PC","M68K SR"}
    for _, rn in ipairs(reg_names) do local v = regs[rn]; if v then log(string.format("  %-10s = %s", rn, hex(v,8))) end end

    log_sep("RAM DUMP: $FF0000-$FF003F (core ZP)")
    for row = 0, 3 do
        local base = row * 16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FF00E0-$FF011F (PPU ctrl / input / flags)")
    for row = 0, 3 do
        local base = 0x00E0 + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FF0200-$FF021F (OAM sprite 0-7)")
    for row = 0, 1 do
        local base = 0x0200 + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FF0300-$FF033F (PPU buffer)")
    for row = 0, 3 do
        local base = 0x0300 + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FFEE00-$FFEE1F (optional crash logger area)")
    for row = 0, 1 do
        local base = 0xEE00 + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("RAM DUMP: $FFEF00-$FFEF1F (VDP shadow regs)")
    for row = 0, 1 do
        local base = 0xEF00 + row*16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do dline = dline .. " " .. hex(safe_read_byte("68K RAM", base+col)) end
        log(dline)
    end

    log_sep("SCREENSHOTS")
    for _, s in ipairs(screenshots_taken) do log("  " .. s) end
    log("")
    log("================================================================")
    log("  END OF DIAGNOSTIC REPORT")
    log("================================================================")

    local f = io.open(REPORT_PATH, "w")
    if f then for _, line_text in ipairs(report) do f:write(line_text .. "\n") end f:close() console.log("Report written: " .. REPORT_PATH) else for _, line_text in ipairs(report) do console.log(line_text) end end
    return pass_count, fail_count
end

console.clear()
console.log("=== ZELDA GENESIS DIAGNOSTIC v6 ===")
console.log("Watching: " .. ROM_DIR .. "zelda_v*.md")
console.log("")

local current_rom = get_latest_rom()
console.log("Latest ROM: " .. (current_rom or "(none found)"))
console.log("Running diagnostics (" .. NUM_FRAMES .. " frames)...")
local pass, fail = run_diagnostics(current_rom)
console.log(string.format("Done! %d PASS / %d FAIL", pass, fail))
console.log("")
console.log("Now watching for new builds... (poll every " .. POLL_SECONDS .. "s)")
console.log("")

local poll_frames, idle_counter = POLL_SECONDS*60, 0
while true do
    gui.drawText(0, STATUS_Y, string.format("IDLE - watching for new ROM (last: %s  %dP/%dF)", current_rom or "?", pass, fail), 0xFF00FF00, 0xCC000000, 10)
    emu.frameadvance()
    idle_counter = idle_counter + 1
    if idle_counter >= poll_frames then
        idle_counter = 0
        local latest = get_latest_rom()
        if latest and latest ~= current_rom then
            console.log("")
            console.log("*** NEW ROM DETECTED: " .. latest .. " ***")
            console.log("Loading and running diagnostics...")
            client.openrom(ROM_DIR .. latest)
            for settle = 1, 10 do emu.frameadvance() end
            current_rom = latest
            pass, fail = run_diagnostics(current_rom)
            console.log(string.format("Done! %d PASS / %d FAIL", pass, fail))
            console.log("Watching for next build...")
        end
    end
end
