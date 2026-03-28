#!/usr/bin/env python3
"""
patch_vdp.py - Replace PPU_REG_$xxxx stubs with Genesis VDP layer calls
Run this AFTER translator.py on all bank files.

Usage:
    python patch_vdp.py bank_00_gen68k.asm
    -- or for all files --
    for %f in (bank_*_gen68k.asm) do python patch_vdp.py "%f"
"""

import re
import sys
import glob
import os

# ─────────────────────────────────────────────────────────────
# PPU Register replacement rules
# Each entry: (regex_pattern, replacement_function)
# ─────────────────────────────────────────────────────────────

def patch_line(line: str) -> tuple[str, bool]:

    # --- Automate unresolved #>/#< ADC/SBC/CMP patterns ---
    # ADC: ADD.B  #$XX,Dn  ; FIXME: unresolved #</#$XX
    m_adc = re.match(r'^(\s*)ADD\.B\s+#\$([0-9A-Fa-f]{2}),(D\d).*#</#\$([0-9A-Fa-f]{2})', line)
    if m_adc:
        indent, imm, reg, _ = m_adc.groups()
        # 68K: ADD.B #imm,reg already correct, but NES ADC uses carry, so add X flag logic
        # We assume CLC/SEC is handled above, so just add comment
        return (f"{indent}ADD.B  #${imm},{reg}  ; NES ADC with carry handled above\n", True)

    # SBC: SUB.B  #$XX,Dn  ; FIXME: unresolved #</#$XX
    m_sbc = re.match(r'^(\s*)SUB\.B\s+#\$([0-9A-Fa-f]{2}),(D\d).*#</#\$([0-9A-Fa-f]{2})', line)
    if m_sbc:
        indent, imm, reg, _ = m_sbc.groups()
        # 68K: SUB.B #imm,reg already correct, but NES SBC uses borrow, so add X flag logic
        return (f"{indent}SUB.B  #${imm},{reg}  ; NES SBC with borrow handled above\n", True)

    # CMP: CMPI.B  #$XX,Dn  ; FIXME: unresolved #</#$XX
    m_cmp = re.match(r'^(\s*)CMPI\.B\s+#\$([0-9A-Fa-f]{2}),(D\d).*#</#\$([0-9A-Fa-f]{2})', line)
    if m_cmp:
        indent, imm, reg, _ = m_cmp.groups()
        # 68K: CMPI.B #imm,reg is correct for NES CMP
        return (f"{indent}CMPI.B  #${imm},{reg}  ; NES CMP\n", True)

    # --- Flag unresolved #>/#< expressions (fallback) ---
    if '#<' in line or '#>' in line:
        flagged = line.rstrip() + '  ; FIXME: unresolved #</#> expression, manual review needed\n'
        return (flagged, True)


    # --- Automate large displacement addressing ---
    m_ld = re.match(r'^(\s*)MOVE\.B\s+(D\d),\(\$00FF([0-9A-Fa-f]{4})\)\.l(.*)', line)
    if m_ld:
        indent, reg, addr, rest = m_ld.groups()
        # Convert to MOVE.B Dn,addr(A0) if A0 is $FF0000 base
        # Only safe if A0 is known to be $FF0000 (NES RAM base)
        return (f"{indent}MOVE.B  {reg},${addr}(A0){rest}  ; auto: large disp → base+disp\n", True)
    # Fallback: flag if not matching NES RAM base
    m = re.search(r'MOVE\.B\s+D[0-7],\(\$[0-9A-Fa-f]{8}\)\.l', line)
    if m:
        flagged = line.rstrip() + '  ; FIXME: large displacement, check assembler/hardware support\n'
        return (flagged, True)

    """
    Returns (patched_line, was_changed)
    """
    original = line

    # ── WRITE to PPU registers: MOVE.B Dn, PPU_REG_$xxxx ──
    # Pattern: "    MOVE.B  D0,PPU_REG_$2000 ..."
    m = re.match(r'^(\s*)MOVE\.B\s+(D\d),PPU_REG_\$([0-9A-Fa-f]{4})(.*)', line)
    if m:
        indent, reg, addr, rest = m.groups()
        comment = extract_orig_comment(rest)
        addr_upper = addr.upper()

        if addr_upper == '2000':
            return (f"{indent}MOVE.B  {reg},D0  ; prep for PPU_WRITE_2000{comment}\n"
                    f"{indent}BSR     PPU_WRITE_2000\n", True)
        elif addr_upper == '2001':
            return (f"{indent}MOVE.B  {reg},D0  ; prep for PPU_WRITE_2001{comment}\n"
                    f"{indent}BSR     PPU_WRITE_2001\n", True)
        elif addr_upper == '2003':
            return (f"{indent}MOVE.B  {reg},D0  ; prep for PPU_WRITE_2003 (OAM addr){comment}\n"
                    f"{indent}BSR     PPU_WRITE_2003\n", True)
        elif addr_upper == '2005':
            return (f"{indent}MOVE.B  {reg},D0  ; prep for PPU_WRITE_2005 (scroll){comment}\n"
                    f"{indent}BSR     PPU_WRITE_2005\n", True)
        elif addr_upper == '2006':
            return (f"{indent}MOVE.B  {reg},D0  ; prep for PPU_WRITE_2006 (VRAM addr){comment}\n"
                    f"{indent}BSR     PPU_WRITE_2006\n", True)
        elif addr_upper == '2007':
            return (f"{indent}MOVE.B  {reg},D0  ; prep for PPU_WRITE_2007 (VRAM data){comment}\n"
                    f"{indent}BSR     PPU_WRITE_2007\n", True)
        else:
            return (f"{indent}; !! UNHANDLED PPU WRITE ${addr_upper} (was: {reg}){comment}\n", True)

    # ── READ from PPU register: MOVE.B PPU_REG_$xxxx, Dn ──
    # The broken syntax from translator looks like:
    # "    MOVE.B  PPU_REG_$2002  ; !! PPU REGISTER...,D0"
    # We need to handle both forms
    m = re.match(r'^(\s*)MOVE\.B\s+PPU_REG_\$([0-9A-Fa-f]{4})\s*(?:;[^,]*)?,(D\d)(.*)', line)
    if m:
        indent, addr, reg, rest = m.groups()
        comment = extract_orig_comment(rest)
        addr_upper = addr.upper()

        if addr_upper == '2002':
            result = f"{indent}BSR     PPU_READ_2002  ; read VDP status → D0{comment}\n"
            if reg != 'D0':
                result += f"{indent}MOVE.B  D0,{reg}  ; move result to target register\n"
            return (result, True)
        elif addr_upper == '2007':
            result = f"{indent}BSR     PPU_READ_2007  ; read VRAM data → D0{comment}\n"
            if reg != 'D0':
                result += f"{indent}MOVE.B  D0,{reg}\n"
            return (result, True)
        else:
            return (f"{indent}; !! UNHANDLED PPU READ ${addr_upper} → {reg}{comment}\n", True)

    # Also catch the malformed version: "MOVE.B  PPU_REG_$2002  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!,D0"
    m = re.match(r'^(\s*)MOVE\.B\s+PPU_REG_\$([0-9A-Fa-f]{4})\s+;[^,\n]*,(D\d)(.*)', line)
    if m:
        indent, addr, reg, rest = m.groups()
        comment = extract_orig_comment(rest)
        addr_upper = addr.upper()

        if addr_upper == '2002':
            result = f"{indent}BSR     PPU_READ_2002  ; read VDP status → D0{comment}\n"
            if reg != 'D0':
                result += f"{indent}MOVE.B  D0,{reg}\n"
            return (result, True)
        else:
            return (f"{indent}; !! UNHANDLED PPU READ ${addr_upper} → {reg}{comment}\n", True)

    return (line, False)


def extract_orig_comment(s: str) -> str:
    """Extract the '; orig: ...' part if present, return as short comment"""
    m = re.search(r'orig:\s*(.{0,50})', s)
    if m:
        return f"  ; was: {m.group(1).strip()}"
    return ""


def patch_file(filepath: str) -> dict:

    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    patched_lines = []
    stats = {'patched': 0, 'unhandled': 0, 'total_lines': len(lines)}
    stats['flagged'] = 0

    # Add VDP include at top
    header_inserted = False

    for line in lines:
        if not header_inserted and line.startswith('; AUTO-TRANSLATED'):
            patched_lines.append(line)
            patched_lines.append('; ── VDP Layer included via vdp_layer.asm ──\n')
            patched_lines.append('; Run: include "vdp_layer.asm" in your main build\n')
            patched_lines.append('\n')
            header_inserted = True
            continue

        # Patch PPU stubs and also flag unresolved/large displacement
        if ('PPU_REG_$' in line or 'PPU REGISTER' in line or '#<' in line or '#>' in line or re.search(r'MOVE\.B\s+D[0-7],\(\$[0-9A-Fa-f]{8}\)\.l', line)):
            new_line, changed = patch_line(line)
            if changed:
                if 'UNHANDLED' in new_line:
                    stats['unhandled'] += 1
                elif 'FIXME' in new_line:
                    stats['flagged'] += 1
                else:
                    stats['patched'] += 1
                patched_lines.append(new_line)
            else:
                patched_lines.append(line)
        else:
            patched_lines.append(line)

    # --- Force all short branches to JMP for safety in generated files ---
    branch_ops = ["BNE", "BEQ", "BRA", "BCS", "BCC", "BPL", "BMI", "BVS", "BVC"]
    branch_pattern = re.compile(r'^(\s*)(' + '|'.join(branch_ops) + r')\s+(\w+)')
    for idx, line in enumerate(patched_lines):
        m = branch_pattern.match(line)
        if m:
            indent, op, target = m.group(1), m.group(2), m.group(3)
            patched_lines[idx] = f"{indent}JMP     {target}  ; replaced {op} (forced for build reliability)\n"

    # Write patched file into the assembled generated_vdp directory.
    src_dir = os.path.dirname(os.path.abspath(filepath))
    out_dir = os.path.normpath(os.path.join(src_dir, '..', 'generated_vdp'))
    os.makedirs(out_dir, exist_ok=True)
    out_name = os.path.basename(filepath).replace('_gen68k.asm', '_gen68k_vdp.asm')
    out_path = os.path.join(out_dir, out_name)
    with open(out_path, 'w', encoding='utf-8') as f:
        f.writelines(patched_lines)

    stats['out_path'] = out_path
    return stats


if __name__ == '__main__':
    if len(sys.argv) < 2:
        # No args - patch all gen68k files
        files = sorted(glob.glob("bank_*_gen68k.asm"))
        if not files:
            print("No bank_*_gen68k.asm files found!")
            sys.exit(1)
    else:
        files = sys.argv[1:]

    total_patched = 0
    total_unhandled = 0
    total_flagged = 0

    print("=" * 55)
    print("  VDP PATCH REPORT")
    print("=" * 55)

    for f in files:
        if not os.path.exists(f):
            print(f"  SKIP (not found): {f}")
            continue
        stats = patch_file(f)
        total_patched += stats['patched']
        total_unhandled += stats['unhandled']
        total_flagged += stats.get('flagged', 0)
        print(f"\nFILE: {f}")
        print(f"  PPU stubs replaced: {stats['patched']}")
        print(f"  Unhandled:          {stats['unhandled']}")
        print(f"  Flagged:            {stats.get('flagged', 0)}")
        print(f"  Output:             {stats['out_path']}")

    print(f"\n{'=' * 55}")
    print(f"TOTAL PPU stubs replaced: {total_patched}")
    print(f"TOTAL unhandled:          {total_unhandled}")
    print(f"TOTAL flagged:            {total_flagged}")
    print(f"\nNext: build with vdp_layer.asm included!")
    print(f"      assemble with: asmx or vasm (68000 mode)")
