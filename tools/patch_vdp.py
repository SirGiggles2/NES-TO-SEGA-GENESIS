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

        if 'PPU_REG_$' in line or 'PPU REGISTER' in line:
            new_line, changed = patch_line(line)
            if changed:
                if 'UNHANDLED' in new_line:
                    stats['unhandled'] += 1
                else:
                    stats['patched'] += 1
                patched_lines.append(new_line)
            else:
                patched_lines.append(line)
        else:
            patched_lines.append(line)

    # Write patched file
    out_path = filepath.replace('_gen68k.asm', '_gen68k_vdp.asm')
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
        print(f"\nFILE: {f}")
        print(f"  PPU stubs replaced: {stats['patched']}")
        print(f"  Unhandled:          {stats['unhandled']}")
        print(f"  Output:             {stats['out_path']}")

    print(f"\n{'=' * 55}")
    print(f"TOTAL PPU stubs replaced: {total_patched}")
    print(f"TOTAL unhandled:          {total_unhandled}")
    print(f"\nNext: build with vdp_layer.asm included!")
    print(f"      assemble with: asmx or vasm (68000 mode)")
