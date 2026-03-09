-- ============================================================
--  zelda_diag.lua  -  Automated Zelda Genesis Port Diagnostics
--  v4 - Extended variable tracking, NMI completion detection,
--       PC range analysis, corrected address labels + crash logger
-- ============================================================
--  Usage: Load zelda ROM in BizHawk, then load this script.
--  Output: D:\Zelda port\diag_report.txt
-- ============================================================

-- ======================== CONFIG ============================
local NUM_FRAMES    = 300          -- 5 seconds at 60fps
local REPORT_PATH   = "D:\\Zelda port\\diag_report.txt"
local ROM_DIR       = "D:\\Zelda port\\"
local SCREENSHOT_AT = {1, 60, 150, 300}
local SAMPLE_VRAM   = true
local SAMPLE_CRAM   = true
local POLL_SECONDS  = 3
-- ============================================================

-- ======================== HELPERS ============================
local function hex(val, digits)
    digits = digits or 2
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

-- ======================== RAM WATCHES ============================
-- All offsets are relative to genesis 68K RAM domain ($FF0000 base)
-- ram_for_2000 = $FF00FF  => offset $00FF  (NOT $0012 which is ram_script!)
-- PPUCTRL_SHADOW = $FFFFEF00 => 24-bit = $FFEF00 => RAM offset $EF00
local WATCHES = {
    -- NES ZP $00-$17 (key game state)
    {addr=0x0000, sz=1, name="ppu_data_lo",    desc="PPU buf ptr lo  [ZP $00]"},
    {addr=0x0001, sz=1, name="ppu_data_hi",    desc="PPU buf ptr hi  [ZP $01]"},
    {addr=0x0010, sz=1, name="game_mode",       desc="dungeon_level/game mode [ZP $10]"},
    {addr=0x0011, sz=1, name="screen_ready",    desc="screen_ready_flag (0=init) [ZP $11]"},
    {addr=0x0012, sz=1, name="ram_script",      desc="current script# (0=title) [ZP $12]"},
    {addr=0x0013, sz=1, name="ram_subscript",   desc="sub-script [ZP $13]"},
    {addr=0x0014, sz=1, name="ppu_load_index",  desc="PPU data table index [ZP $14]"},
    {addr=0x0015, sz=1, name="ram_frm_cnt",     desc="frame counter (NMI completion!) [ZP $15]"},
    {addr=0x0016, sz=1, name="cur_save_slot",   desc="current save slot [ZP $16]"},
    {addr=0x0017, sz=1, name="rendering_flag",  desc="blocks render enable [ZP $17]"},
    -- Key NMI/game vars
    {addr=0x005C, sz=1, name="ram_005C",        desc="NMI toggle flag [ZP $5C]"},
    {addr=0x005B, sz=1, name="ram_next_script", desc="next_script [ZP $5B]"},
    -- Pause / transition
    {addr=0x00E0, sz=1, name="pause_flag",      desc="pause_flag [ZP $E0]"},
    {addr=0x00E1, sz=1, name="pause_script",    desc="pause_script [ZP $E1]"},
    {addr=0x00E3, sz=1, name="screen_trans",    desc="screen_transition_flag [ZP $E3]"},
    -- PPU control mirrors (THE key vars)
    {addr=0x00F4, sz=1, name="ram_00F4",        desc="reset flag (0 after loc_E440) [ZP $F4]"},
    {addr=0x00FC, sz=1, name="scroll_Y",        desc="ram_scroll_Y [ZP $FC]"},
    {addr=0x00FD, sz=1, name="scroll_X",        desc="ram_scroll_X [ZP $FD]"},
    {addr=0x00FE, sz=1, name="ram_for_2001",    desc="PPU $2001 mirror - render ctrl [ZP $FE]"},
    {addr=0x00FF, sz=1, name="ram_for_2000",    desc="PPU $2000 mirror - NMI enable bit7 [ZP $FF]"},
    -- VDP shadow registers (at $FFEF00+, RAM offset $EF00+)
    {addr=0xEF00, sz=1, name="PPUCTRL_SHADOW",  desc="Shadow PPU $2000 (PPU_WRITE_2000 sets this)"},
    {addr=0xEF01, sz=1, name="PPUMASK_SHADOW",  desc="Shadow PPU $2001 (PPU_WRITE_2001 sets this)"},
    {addr=0xEF05, sz=1, name="PPUSCROLL_X_sh",  desc="HScroll shadow"},
    {addr=0xEF06, sz=1, name="PPUSCROLL_Y_sh",  desc="VScroll shadow"},
    {addr=0xEF08, sz=2, name="VRAM_ADDR_CURR",  desc="Current VRAM write addr"},
    {addr=0xEF0A, sz=1, name="VDP_REG1",        desc="VDP Mode2: $74=VINT+DISP,$54=off,$34=disp-only"},
    -- PPU buffer
    {addr=0x0300, sz=1, name="ppu_buf_status",  desc="$3F when buffer write complete"},
    {addr=0x0301, sz=1, name="ppu_buf_index",   desc="PPU buffer write index"},
    {addr=0x0302, sz=1, name="ppu_buf_0",       desc="PPU buffer[0] ($FF=terminator)"},
    {addr=0x0303, sz=1, name="ppu_buf_1",       desc="PPU buffer[1]"},
    {addr=0x0304, sz=1, name="ppu_buf_2",       desc="PPU buffer[2]"},
    {addr=0x0305, sz=1, name="ppu_buf_3",       desc="PPU buffer[3]"},
    -- Controller
    {addr=0x00F8, sz=1, name="btn_press_lo",    desc="button press lo byte"},
    {addr=0x00FA, sz=1, name="btn_hold_lo",     desc="button hold lo byte"},
    -- Crash logger at $FFEE00+
    {addr=0xEE00, sz=2, name="CRASH_MAGIC",     desc="Crash logger magic ($BEEF if hit)"},
    {addr=0xEE02, sz=2, name="CRASH_VECTOR",    desc="Crash vector / reserved"},
    {addr=0xEE04, sz=4, name="CRASH_SP",        desc="Crash exception-frame SP"},
    {addr=0xEE08, sz=2, name="CRASH_SR",        desc="Crash SR (generic frame)"},
    {addr=0xEE0A, sz=4, name="CRASH_PC",        desc="Crash PC (generic frame)"},
}

-- ============================================================
--  run_diagnostics() — main diagnostic pass
-- ============================================================
local function run_diagnostics(rom_name)
    local report = {}
    local function log(s) report[#report+1] = s end
    local function log_sep(title)
        log("")
        log("=== " .. title .. " " .. string.rep("=", math.max(0, 58 - #title)))
    end

    -- State
    local ram_prev      = {}
    local ram_changes   = {}
    local pc_histogram  = {}
    local pc_min        = 0xFFFFFF
    local pc_max        = 0
    local vram_nonzero  = 0
    local cram_data     = {}
    local milestones    = {}
    local stuck_pc      = nil
    local stuck_count   = 0
    local last_pc       = 0
    local screenshots_taken = {}
    local screenshot_set    = {}
    for _, f in ipairs(SCREENSHOT_AT) do screenshot_set[f] = true end

    -- Milestone helpers
    local function add_ms(frame, event)
        milestones[#milestones+1] = {frame=frame, event=event}
    end

    -- Initialize watches
    memory.usememorydomain("68K RAM")
    for _, w in ipairs(WATCHES) do
        local val = read_ram(w.addr, w.sz)
        ram_prev[w.addr]    = val
        ram_changes[w.addr] = {
            count=0, first_frame=-1, last_frame=-1,
            first_val=val, last_val=val,
            min_val=val, max_val=val,
            unique={[val]=true}, history={}
        }
    end

    -- Per-milestone flags
    local ms_nmi_enabled   = false
    local ms_nmi_completed = false
    local ms_render_on     = false
    local ms_vdp_vint      = false
    local ms_vdp_disp      = false
    local ms_buf_written   = false
    local ms_ppuctrl_set   = false
    local mode_seen        = {}
    local prev_frmcnt      = read_ram(0x0015, 1)
    local nmi_run_count    = 0
    local stuck_announced  = false

    -- ── MAIN FRAME LOOP ──
    for i = 1, NUM_FRAMES do
        local regs = emu.getregisters()
        local pc   = regs["M68K PC"] or regs["PC"] or 0
        pc_histogram[pc] = (pc_histogram[pc] or 0) + 1
        if pc < pc_min then pc_min = pc end
        if pc > pc_max then pc_max = pc end

        -- Stuck detection
        if pc == last_pc then
            stuck_count = stuck_count + 1
            if stuck_count == 30 and not stuck_announced then
                stuck_announced = true
                stuck_pc = pc
                add_ms(i, "STUCK: PC=" .. hex(pc,6) .. " for 30+ frames")
            end
        else
            stuck_count = 0
        end
        last_pc = pc

        -- Sample RAM watches
        for _, w in ipairs(WATCHES) do
            local val  = read_ram(w.addr, w.sz)
            local prev = ram_prev[w.addr]
            local info = ram_changes[w.addr]
            if val ~= prev then
                info.count = info.count + 1
                if info.first_frame == -1 then info.first_frame = i end
                info.last_frame = i
                info.last_val   = val
                if val < info.min_val then info.min_val = val end
                if val > info.max_val then info.max_val = val end
                info.unique[val] = true
                if #info.history < 50 then
                    info.history[#info.history+1] = {frame=i, old=prev, new=val}
                end
                ram_prev[w.addr] = val
            end
        end

        -- ── MILESTONES ──
        local r2000 = read_ram(0x00FF, 1)   -- ACTUAL ram_for_2000
        local r2001 = read_ram(0x00FE, 1)
        local reg1  = read_ram(0xEF0A, 1)
        local ppucs = read_ram(0xEF00, 1)   -- PPUCTRL_SHADOW
        local mode  = read_ram(0x0010, 1)
        local sub   = read_ram(0x0011, 1)
        local frmcnt = read_ram(0x0015, 1)

        -- NMI enabled (ram_for_2000 bit7 set)
        if (r2000 & 0x80) ~= 0 and not ms_nmi_enabled then
            ms_nmi_enabled = true
            add_ms(i, "NMI ENABLED: ram_for_2000=" .. hex(r2000) .. " (bit7=1)")
        end
        if r2000 ~= 0 and not ms_nmi_enabled then
            -- Track any non-zero value (might be $20 or $30 without bit7)
            add_ms(i, "ram_for_2000 nonzero: " .. hex(r2000))
        end

        -- NMI completed (ram_frm_cnt incremented by NMI handler)
        if frmcnt ~= prev_frmcnt then
            nmi_run_count = nmi_run_count + 1
            if not ms_nmi_completed then
                ms_nmi_completed = true
                add_ms(i, "NMI COMPLETED first time! ram_frm_cnt=" .. hex(frmcnt) .. " (loc_E573 reached!)")
            elseif nmi_run_count <= 5 then
                add_ms(i, "NMI run #" .. nmi_run_count .. ": frm_cnt=" .. hex(frmcnt))
            end
            prev_frmcnt = frmcnt
        end

        -- PPU_WRITE_2000 called with non-zero (PPUCTRL_SHADOW updated)
        if ppucs ~= 0 and not ms_ppuctrl_set then
            ms_ppuctrl_set = true
            add_ms(i, "PPU_WRITE_2000 called with $" .. string.format("%02X", ppucs) .. " (PPUCTRL_SHADOW set)")
        end

        -- Render enabled (PPU $2001 has show sprites/BG)
        if r2001 >= 0x08 and not ms_render_on then
            ms_render_on = true
            add_ms(i, "RENDER ENABLED: ram_for_2001=" .. hex(r2001))
        end

        -- VDP VINT enable
        if (reg1 & 0x20) ~= 0 and not ms_vdp_vint then
            ms_vdp_vint = true
            add_ms(i, "VDP VINT ON: VDP_REG1=" .. hex(reg1))
        end

        -- VDP display enable
        if (reg1 & 0x40) ~= 0 and not ms_vdp_disp then
            ms_vdp_disp = true
            add_ms(i, "VDP DISPLAY ON: VDP_REG1=" .. hex(reg1))
        end

        -- Game mode changes
        local mk = hex(mode) .. "/" .. hex(sub)
        if not mode_seen[mk] then
            mode_seen[mk] = true
            add_ms(i, "GAME MODE: dungeon=" .. hex(mode) .. " screen_ready=" .. hex(sub))
        end

        -- PPU buffer written
        local uflag = read_ram(0x0300, 1)
        if uflag == 0x3F and not ms_buf_written then
            ms_buf_written = true
            add_ms(i, "PPU BUFFER WRITE COMPLETE: $0300=$3F")
        end

        -- OSD
        local status = string.format("[%s] F:%d PC:%s Mode:%s/%s VDP:%s r2000:%s frm:%s",
            rom_name or "?", i, hex(pc,6), hex(mode), hex(sub), hex(reg1), hex(r2000), hex(frmcnt))
        gui.drawText(0, 0, status, 0xFFFFFFFF, 0xCC000000, 10)

        -- Screenshots
        if screenshot_set[i] then
            local fname = "zelda_diag_f" .. string.format("%03d", i) .. ".png"
            client.screenshot(fname)
            screenshots_taken[#screenshots_taken+1] = fname
        end

        emu.frameadvance()
    end

    -- ── POST-RUN: VRAM / CRAM ──
    if SAMPLE_VRAM then
        vram_nonzero = 0
        local vram_regions = {}
        for addr = 0, 65535, 2 do
            local val = memory.read_u16_be(addr, "VRAM")
            if val ~= 0 then
                vram_nonzero = vram_nonzero + 1
                local block = math.floor(addr / 1024)
                vram_regions[block] = (vram_regions[block] or 0) + 1
            end
        end
        ram_changes.vram_regions = vram_regions
    end

    if SAMPLE_CRAM then
        cram_data = {}
        for addr = 0, 127, 2 do
            cram_data[#cram_data+1] = memory.read_u16_be(addr, "CRAM")
        end
    end

    -- ── GENERATE REPORT ──
    log("================================================================")
    log("  ZELDA GENESIS PORT - DIAGNOSTIC REPORT  v4")
    log("  ROM: " .. (rom_name or "(unknown)"))
    log("  Frames: " .. NUM_FRAMES .. "  (~" .. string.format("%.1f", NUM_FRAMES/60.0) .. "s)")
    log("================================================================")

    -- Executive Summary
    log_sep("EXECUTIVE SUMMARY")
    local checks = {}

    -- NMI enabled check (use correct address $00FF!)
    local final_r2000 = read_ram(0x00FF, 1)
    if ms_nmi_enabled then
        checks[#checks+1] = "PASS  NMI enabled (ram_for_2000 had bit7=1)"
    elseif final_r2000 ~= 0 then
        checks[#checks+1] = "WARN  NMI partially set (ram_for_2000=" .. hex(final_r2000) .. " bit7=0)"
    else
        checks[#checks+1] = "FAIL  NMI never enabled (ram_for_2000 at $FF00FF=" .. hex(final_r2000) .. " always 0)"
    end

    -- NMI completed check (frame counter)
    if ms_nmi_completed then
        checks[#checks+1] = "PASS  NMI handler ran to completion (" .. nmi_run_count .. " times, frm_cnt=" .. hex(read_ram(0x0015,1)) .. ")"
    else
        checks[#checks+1] = "FAIL  NMI handler never reached loc_E573 (ram_frm_cnt=0, CPU stuck?)"
    end

    -- PPU_WRITE_2000 with non-zero
    if ms_ppuctrl_set then
        checks[#checks+1] = "PASS  PPU_WRITE_2000 called with non-zero value (PPUCTRL_SHADOW=" .. hex(read_ram(0xEF00,1)) .. ")"
    else
        checks[#checks+1] = "FAIL  PPU_WRITE_2000 never called with non-zero (loc_E440 PPU_WRITE_2000($A0) didn't run?)"
    end

    -- VDP VINT
    if ms_vdp_vint then
        checks[#checks+1] = "PASS  VDP VINT enabled at some point"
    else
        checks[#checks+1] = "FAIL  VDP VINT never enabled (VDP_REG1=" .. hex(read_ram(0xEF0A,1)) .. ")"
    end

    -- VDP display
    if ms_vdp_disp then
        checks[#checks+1] = "PASS  VDP display enabled"
    else
        checks[#checks+1] = "FAIL  VDP display never enabled"
    end

    -- VRAM
    if vram_nonzero > 0 then
        checks[#checks+1] = "PASS  VRAM has " .. vram_nonzero .. " nonzero words"
    else
        checks[#checks+1] = "FAIL  VRAM completely empty"
    end

    -- CRAM
    local palette_nonzero = 0
    for _, v in ipairs(cram_data) do
        if v ~= 0 then palette_nonzero = palette_nonzero + 1 end
    end
    if palette_nonzero > 0 then
        checks[#checks+1] = "PASS  CRAM has " .. palette_nonzero .. " nonzero colors"
    else
        checks[#checks+1] = "FAIL  CRAM empty"
    end

    -- PPU buffer
    if ms_buf_written then
        checks[#checks+1] = "PASS  PPU buffer write completed"
    else
        checks[#checks+1] = "FAIL  PPU buffer write never completed (ppu_buf_0=" .. hex(read_ram(0x0302,1)) .. ")"
    end

    -- CPU stuck
    if stuck_pc then
        checks[#checks+1] = "FAIL  CPU STUCK at PC=" .. hex(stuck_pc,6) .. " for 30+ frames"
    else
        checks[#checks+1] = "PASS  CPU not stuck in a single location"
    end

    -- Render enabled
    if ms_render_on then
        checks[#checks+1] = "PASS  Rendering enabled (ram_for_2001=" .. hex(read_ram(0x00FE,1)) .. ")"
    else
        checks[#checks+1] = "WARN  Rendering never enabled"
    end

    -- Game mode changed
    local unique_modes = 0
    for _ in pairs(mode_seen) do unique_modes = unique_modes + 1 end
    if unique_modes > 1 then
        checks[#checks+1] = "PASS  Game mode changed (" .. unique_modes .. " states seen)"
    else
        checks[#checks+1] = "WARN  Game mode never changed (stuck in mode " .. hex(read_ram(0x0010,1)) .. ")"
    end

    local crash_magic = read_ram(0xEE00, 2)
    local crash_pc = read_ram(0xEE0A, 4)
    if crash_magic == 0xBEEF then
        log_sep("CRASH INFO - EXCEPTION_HANDLER TRIGGERED")
        log("  CRASH_MAGIC: " .. hex(crash_magic, 4))
        log("  CRASH_PC: " .. hex(crash_pc, 8))
        log("  CRASH_SR: " .. hex(read_ram(0xEE08, 2), 4))
        log("  CRASH_SP: " .. hex(read_ram(0xEE04, 4), 8))
        log("  Raw frame at $FFEE10:")
        for i = 0, 15 do
            local off = 0xEE10 + i*2
            log(string.format("    +%02X = %s", i*2, hex(memory.read_u16_be(off, "68K RAM"), 4)))
        end
        checks[#checks+1] = "FAIL  EXCEPTION_HANDLER hit! See CRASH INFO above"
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

    -- Milestones
    log_sep("MILESTONES (chronological)")
    if #milestones == 0 then
        log("  (none detected)")
    else
        table.sort(milestones, function(a,b) return (a.frame or 9999) < (b.frame or 9999) end)
        for _, m in ipairs(milestones) do
            if m.frame then
                log("  Frame " .. string.format("%4d", m.frame) .. ": " .. m.event)
            end
        end
    end

    -- RAM Watch Summary
    log_sep("RAM WATCH SUMMARY")
    log(string.format("  %-20s  %-8s  %-8s  %-8s  %-8s  %s",
        "Name", "Final", "Changes", "Min", "Max", "Description"))
    log("  " .. string.rep("-", 85))
    for _, w in ipairs(WATCHES) do
        local info   = ram_changes[w.addr]
        local digits = w.sz == 2 and 4 or 2
        log(string.format("  %-20s  %-8s  %-8d  %-8s  %-8s  %s",
            w.name,
            hex(info.last_val, digits),
            info.count,
            hex(info.min_val, digits),
            hex(info.max_val, digits),
            w.desc))
    end

    -- RAM Change History (all changes for key vars)
    log_sep("RAM CHANGE HISTORY (all key vars with any change)")
    for _, w in ipairs(WATCHES) do
        local info = ram_changes[w.addr]
        if info.count > 0 and #info.history > 0 then
            local digits = w.sz == 2 and 4 or 2
            log("  " .. w.name .. " [" .. hex(w.addr, 4) .. "] - " .. info.count .. " changes:")
            local show = math.min(#info.history, 20)
            for j = 1, show do
                local h = info.history[j]
                log("    Frame " .. string.format("%4d", h.frame) .. ": "
                    .. hex(h.old, digits) .. " -> " .. hex(h.new, digits))
            end
            if #info.history > 20 then
                log("    ... (" .. (#info.history - 20) .. " more)")
            end
        end
    end

    -- VRAM Content
    if SAMPLE_VRAM then
        log_sep("VRAM CONTENT")
        log("  Nonzero words: " .. vram_nonzero .. " / 32768")
        if vram_nonzero == 0 then
            log("  ** VRAM IS COMPLETELY EMPTY **")
        else
            local blocks = {}
            for k, v in pairs(ram_changes.vram_regions or {}) do
                blocks[#blocks+1] = {block=k, count=v}
            end
            table.sort(blocks, function(a,b) return a.block < b.block end)
            for _, b in ipairs(blocks) do
                local base = b.block * 1024
                log(string.format("    VRAM $%04X-$%04X: %d nonzero words", base, base+1023, b.count))
            end
        end
    end

    -- CRAM / Palette
    if SAMPLE_CRAM then
        log_sep("CRAM / PALETTE")
        if palette_nonzero == 0 then
            log("  ** NO PALETTE LOADED (all black) **")
        else
            log("  Nonzero entries: " .. palette_nonzero .. " / 64")
            for pal = 0, 3 do
                local pline = "  Palette " .. pal .. ":"
                for c = 0, 15 do
                    local idx = pal * 16 + c + 1
                    pline = pline .. " " .. hex(cram_data[idx] or 0, 4)
                end
                log(pline)
            end
        end
    end

    -- PC Hotspots
    log_sep("PC HOTSPOTS (sampled once/frame)")
    log("  PC range this run: " .. hex(pc_min,6) .. " - " .. hex(pc_max,6))
    local pc_sorted = {}
    for pc_val, count in pairs(pc_histogram) do
        pc_sorted[#pc_sorted+1] = {pc=pc_val, count=count}
    end
    table.sort(pc_sorted, function(a,b) return a.count > b.count end)
    for idx = 1, math.min(#pc_sorted, 25) do
        local p = pc_sorted[idx]
        log(string.format("  %s: %4d frames (%.1f%%)", hex(p.pc,6), p.count, p.count/NUM_FRAMES*100))
    end

    -- Final CPU State
    log_sep("FINAL CPU STATE")
    local regs = emu.getregisters()
    local reg_names = {"M68K D0","M68K D1","M68K D2","M68K D3","M68K D4","M68K D5","M68K D6","M68K D7",
                       "M68K A0","M68K A1","M68K A2","M68K A3","M68K A4","M68K A5","M68K A6","M68K A7",
                       "M68K PC","M68K SR"}
    for _, rn in ipairs(reg_names) do
        local val = regs[rn]
        if val then log(string.format("  %-10s = %s", rn, hex(val,8))) end
    end
    if not regs["M68K D0"] then
        for k, v in pairs(regs) do
            log(string.format("  %-10s = %s", k, hex(v,8)))
        end
    end

    -- Extended RAM Dumps
    log_sep("RAM DUMP: $FF0000-$FF001F (ZP $00-$1F)")
    for row = 0, 1 do
        local dline = string.format("  $FF%04X:", row * 16)
        for col = 0, 15 do
            dline = dline .. " " .. hex(memory.readbyte(row*16+col, "68K RAM"))
        end
        log(dline)
    end

    log_sep("RAM DUMP: $FF00E0-$FF010F (PPU ctrl / scroll / for_2000 region)")
    for row = 0, 3 do
        local base = 0x00E0 + row * 16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do
            dline = dline .. " " .. hex(memory.readbyte(base+col, "68K RAM"))
        end
        log(dline)
    end

    log_sep("RAM DUMP: $FF0300-$FF031F (PPU buffer)")
    for row = 0, 1 do
        local base = 0x0300 + row * 16
        local dline = string.format("  $FF%04X:", base)
        for col = 0, 15 do
            dline = dline .. " " .. hex(memory.readbyte(base+col, "68K RAM"))
        end
        log(dline)
    end

    log_sep("RAM DUMP: $FFEF00-$FFEF0F (VDP shadow regs)")
    do
        local dline = "  $FFEF00:"
        for col = 0, 15 do
            dline = dline .. " " .. hex(memory.readbyte(0xEF00+col, "68K RAM"))
        end
        log(dline)
    end

    log_sep("RAM DUMP: $FF0200-$FF020F (OAM sprite 0)")
    do
        local dline = "  $FF0200:"
        for col = 0, 15 do
            dline = dline .. " " .. hex(memory.readbyte(0x0200+col, "68K RAM"))
        end
        log(dline)
    end

    -- Screenshots
    log_sep("SCREENSHOTS")
    for _, s in ipairs(screenshots_taken) do log("  " .. s) end

    log("")
    log("================================================================")
    log("  END OF DIAGNOSTIC REPORT")
    log("================================================================")

    -- Write report
    local f = io.open(REPORT_PATH, "w")
    if f then
        for _, line_text in ipairs(report) do f:write(line_text .. "\n") end
        f:close()
        console.log("Report written: " .. REPORT_PATH)
    else
        console.log("ERROR writing report!")
        for _, line_text in ipairs(report) do console.log(line_text) end
    end

    return pass_count, fail_count
end


-- ============================================================
--  MAIN: run diagnostics, then watch for new ROMs forever
-- ============================================================
console.clear()
console.log("=== ZELDA GENESIS DIAGNOSTIC v3 ===")
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

-- ── WATCH LOOP ──
local poll_frames  = POLL_SECONDS * 60
local idle_counter = 0

while true do
    gui.drawText(0, 0,
        string.format("IDLE - watching for new ROM (last: %s  %dP/%dF)",
            current_rom or "?", pass, fail),
        0xFF00FF00, 0xCC000000, 10)

    emu.frameadvance()
    idle_counter = idle_counter + 1

    if idle_counter >= poll_frames then
        idle_counter = 0
        local latest = get_latest_rom()

        if latest and latest ~= current_rom then
            console.log("")
            console.log("*** NEW ROM DETECTED: " .. latest .. " ***")
            console.log("Loading and running diagnostics...")

            local rom_path = ROM_DIR .. latest
            client.openrom(rom_path)

            for settle = 1, 10 do emu.frameadvance() end

            current_rom = latest
            pass, fail = run_diagnostics(current_rom)
            console.log(string.format("Done! %d PASS / %d FAIL", pass, fail))
            console.log("Watching for next build...")
        end
    end
end
