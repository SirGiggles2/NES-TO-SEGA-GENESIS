#!/usr/bin/env python3
"""
audit_banks.py - Static analysis of translated 68K code
=========================================================
Scans all bank_*_gen68k.asm source files for:
  1. Empty translations (categorized by NES instruction type)
  2. The subroutine they live in
  3. The original NES addressing mode (to suggest fixes)
  4. Summary stats by bank and by instruction type

Usage: python audit_banks.py
Output: audit_report.txt  (drop onto Claude for batch-fix planning)
"""

import re, os, sys, io, glob

# Windows console encoding fix
if sys.platform == 'win32':
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')

PROJ = os.path.dirname(os.path.abspath(__file__))
REPORT = os.path.join(PROJ, "audit_report.txt")

# ─── Patterns ───────────────────────────────────────────────
RE_EMPTY = re.compile(r';\s*\(empty translation for (\w+)\)\s*;?\s*orig:.*?(\S+)\s*$')
RE_SUB   = re.compile(r'^(sub_\S+|vec_\S+|ofs_\S+):')
RE_LABEL = re.compile(r'^([a-zA-Z_]\w*):')
RE_BSR   = re.compile(r'BSR\s+(sub_\S+|vec_\S+)', re.IGNORECASE)
RE_JSR   = re.compile(r'JSR\s+(sub_\S+|vec_\S+)', re.IGNORECASE)
# Match the original NES instruction from the comment
RE_ORIG  = re.compile(r'orig:.*?([A-Z]{3})\s+(.+?)(?:\s{2,}|$)')

# ─── NMI critical path subroutines (known from tracing) ────
# These are called during NMI / init and MUST work for the game to boot
NMI_CRITICAL = {
    'vec_0x01E494_NMI',
    'sub_0x01E4A1',
    'sub_0x01E504_dec_timers_and_update_rng',
    'sub_0x01E5E2_jump_to_pointers_after_JSR',  # rewritten
    'sub_0x01E607_hide_all_sprites',
    'sub_0x01E618_clear_memory',
    'sub_0x01E635_disable_rendering_and_nmi',
    'sub_0x01E689',
    'sub_0x01E827',
    'sub_0x01E86A_get_enemy_id_from_current_map_location',
    'sub_0x01E872_bomb_blasts_breakable_wall',
    'sub_0x01E8E8',
    'sub_0x01E8F8_main_script_handler_1',
    'sub_0x01E90E_main_script_handler_2',
    'sub_0x01EA3B_set_tunic_color',
    'sub_0x01EBB3_clear_subscript',
    'sub_A0F6_write_to_ppu',
    'sub_0x01A090_write_buffer_to_ppu',
}

# ─── Scan ───────────────────────────────────────────────────
def scan_file(filepath):
    """Scan a single .asm file for empty translations and other issues."""
    basename = os.path.basename(filepath)
    results = []
    current_sub = "(top-level)"

    with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
        lines = f.readlines()

    for lineno, line in enumerate(lines, 1):
        # Track current subroutine
        m_sub = RE_SUB.match(line.strip())
        if m_sub:
            current_sub = m_sub.group(0).rstrip(':')
        elif RE_LABEL.match(line.strip()) and not line.strip().startswith(';'):
            lbl = RE_LABEL.match(line.strip()).group(1)
            if lbl.startswith('sub_') or lbl.startswith('vec_'):
                current_sub = lbl

        # Find empty translations
        m_empty = RE_EMPTY.search(line)
        if m_empty:
            nes_instr = m_empty.group(1)  # LDA, STA, DEC, etc.

            # Extract original NES instruction and addressing mode
            m_orig = RE_ORIG.search(line)
            orig_full = ""
            addr_mode = "unknown"
            if m_orig:
                orig_full = m_orig.group(1) + " " + m_orig.group(2).strip()
                operand = m_orig.group(2).strip()
                # Classify addressing mode
                if ',X' in operand or ',Y' in operand:
                    if operand.startswith('(') and ',X)' in operand:
                        addr_mode = "(indirect,X)"
                    elif operand.startswith('(') and '),Y' in operand:
                        addr_mode = "(indirect),Y"
                    elif re.match(r'^[\$#]?\w+,\s*[XY]', operand):
                        # Check if zero-page or absolute
                        base = operand.split(',')[0].strip()
                        if base.startswith('$') and len(base) <= 4:  # $xx
                            addr_mode = "zp," + operand[-1]
                        else:
                            addr_mode = "abs," + operand[-1]
                    else:
                        addr_mode = "indexed"
                elif operand.startswith('('):
                    addr_mode = "indirect"
                elif operand.startswith('#'):
                    addr_mode = "immediate"
                elif operand.startswith('$') and len(operand) <= 4:
                    addr_mode = "zp"
                else:
                    addr_mode = "absolute"

            is_critical = current_sub in NMI_CRITICAL

            results.append({
                'file': basename,
                'line': lineno,
                'sub': current_sub,
                'nes_instr': nes_instr,
                'addr_mode': addr_mode,
                'orig': orig_full,
                'critical': is_critical,
                'raw': line.rstrip(),
            })

    return results

# ─── Main ───────────────────────────────────────────────────
def main():
    # Find all source bank files (not _vdp.asm)
    pattern = os.path.join(PROJ, "bank_*_gen68k.asm")
    files = sorted(glob.glob(pattern))

    if not files:
        print("No bank_*_gen68k.asm files found in", PROJ)
        return

    all_results = []
    for f in files:
        results = scan_file(f)
        all_results.extend(results)

    # ─── Build report ───────────────────────────────────────
    out = []
    def w(s=""): out.append(s)

    w("=" * 70)
    w("  ZELDA GENESIS PORT - STATIC AUDIT REPORT")
    w("  Generated by audit_banks.py")
    w("  Total empty translations found: %d" % len(all_results))
    w("=" * 70)

    # ─── Summary by bank ────────────────────────────────────
    w()
    w("=== SUMMARY BY BANK " + "=" * 49)
    bank_counts = {}
    for r in all_results:
        bank_counts[r['file']] = bank_counts.get(r['file'], 0) + 1
    for fname in sorted(bank_counts.keys()):
        crit = sum(1 for r in all_results if r['file'] == fname and r['critical'])
        w("  %-40s %4d empty  (%d on critical path)" % (fname, bank_counts[fname], crit))

    # ─── Summary by NES instruction ─────────────────────────
    w()
    w("=== SUMMARY BY NES INSTRUCTION " + "=" * 39)
    instr_counts = {}
    for r in all_results:
        instr_counts[r['nes_instr']] = instr_counts.get(r['nes_instr'], 0) + 1
    for instr in sorted(instr_counts.keys(), key=lambda x: -instr_counts[x]):
        w("  %-6s %4d" % (instr, instr_counts[instr]))

    # ─── Summary by addressing mode ─────────────────────────
    w()
    w("=== SUMMARY BY ADDRESSING MODE " + "=" * 39)
    mode_counts = {}
    for r in all_results:
        mode_counts[r['addr_mode']] = mode_counts.get(r['addr_mode'], 0) + 1
    for mode in sorted(mode_counts.keys(), key=lambda x: -mode_counts[x]):
        # Show example
        example = next(r for r in all_results if r['addr_mode'] == mode)
        w("  %-20s %4d  (e.g. %s)" % (mode, mode_counts[mode], example['orig'][:40]))

    # ─── CRITICAL PATH empties (highest priority) ──────────
    w()
    w("=== CRITICAL PATH EMPTY TRANSLATIONS " + "=" * 33)
    w("  These are in subroutines called during NMI/init.")
    w("  Fixing these is the TOP PRIORITY.")
    w()
    critical = [r for r in all_results if r['critical']]
    if not critical:
        w("  (none found on known critical path)")
    else:
        current_sub = None
        for r in sorted(critical, key=lambda x: (x['sub'], x['line'])):
            if r['sub'] != current_sub:
                current_sub = r['sub']
                w()
                w("  --- %s ---" % current_sub)
            w("    Line %5d: %-6s %-20s  |  %s" % (
                r['line'], r['nes_instr'], r['addr_mode'], r['orig'][:50]))

    # ─── By subroutine (all banks) ──────────────────────────
    w()
    w("=== EMPTY TRANSLATIONS BY SUBROUTINE " + "=" * 33)
    sub_groups = {}
    for r in all_results:
        key = r['file'] + ":" + r['sub']
        if key not in sub_groups:
            sub_groups[key] = []
        sub_groups[key].append(r)

    # Sort by count descending
    for key in sorted(sub_groups.keys(), key=lambda k: -len(sub_groups[k])):
        items = sub_groups[key]
        crit_tag = " ** CRITICAL **" if items[0]['critical'] else ""
        w()
        w("  %s (%d empties)%s" % (key, len(items), crit_tag))
        for r in items[:15]:  # show first 15
            w("    Line %5d: %-6s %-20s  |  %s" % (
                r['line'], r['nes_instr'], r['addr_mode'], r['orig'][:50]))
        if len(items) > 15:
            w("    ... (%d more)" % (len(items) - 15))

    # ─── Fixability analysis ────────────────────────────────
    w()
    w("=== FIXABILITY ANALYSIS " + "=" * 46)
    w("  Which empty translations can be auto-fixed by pattern?")
    w()

    # Group by (instruction, addressing mode) and count
    fix_groups = {}
    for r in all_results:
        key = (r['nes_instr'], r['addr_mode'])
        if key not in fix_groups:
            fix_groups[key] = []
        fix_groups[key].append(r)

    for key in sorted(fix_groups.keys(), key=lambda k: -len(fix_groups[k])):
        instr, mode = key
        items = fix_groups[key]

        # Suggest fix approach
        if instr in ('LDA', 'LDX', 'LDY') and mode.startswith('abs,'):
            fix = "FIXABLE: MOVE.B label(Dn.L),D0  (indexed load)"
        elif instr in ('STA', 'STX', 'STY') and mode.startswith('abs,'):
            fix = "FIXABLE: MOVE.B D0,label(Dn.L)  (indexed store)"
        elif instr in ('LDA', 'LDX', 'LDY') and mode.startswith('zp,'):
            fix = "FIXABLE: MOVE.B ($FF0000+zp)(Dn.L),D0"
        elif instr in ('STA', 'STX', 'STY') and mode.startswith('zp,'):
            fix = "FIXABLE: MOVE.B D0,($FF0000+zp)(Dn.L)"
        elif instr in ('INC', 'DEC') and ',' in mode:
            fix = "FIXABLE: load-modify-store pattern with indexed addr"
        elif instr in ('ROL', 'ROR', 'ASL', 'LSR') and ',' in mode:
            fix = "FIXABLE: load-shift-store pattern with indexed addr"
        elif instr in ('ORA', 'AND', 'EOR', 'ADC', 'SBC') and ',' in mode:
            fix = "FIXABLE: load-op-store pattern with indexed addr"
        elif instr in ('CMP', 'CPX', 'CPY') and ',' in mode:
            fix = "FIXABLE: CMP with indexed → CMPI or CMP with indexed load"
        else:
            fix = "MANUAL: needs case-by-case review"

        w("  %-6s %-20s  %4d occurrences  |  %s" % (instr, mode, len(items), fix))

    # ─── Write report ───────────────────────────────────────
    w()
    w("=" * 70)
    w("  END OF AUDIT REPORT")
    w("=" * 70)

    report_text = "\n".join(out)

    with open(REPORT, 'w', encoding='utf-8') as f:
        f.write(report_text)

    print(report_text)
    print()
    print("Report written to:", REPORT)

if __name__ == '__main__':
    main()
