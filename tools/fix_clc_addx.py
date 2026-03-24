#!/usr/bin/env python3
"""
fix_clc_addx.py - Fix CLC + ADDX.B patterns in generated 68K assembly.

NES pattern: CLC; ADC #imm = simple add (clear carry, then add with carry = add without carry)
Bad 68K translation: ANDI #$FFFE,SR (clears C flag); ADDX.B #imm,Dn (uses X flag, NOT C flag!)
Fix: Replace ADDX.B #imm,Dn with ADDI.B #imm,Dn when preceded by CLC (ANDI #$FFFE,SR)

This is safe because CLC+ADC on 6502 means "add without carry" which is just ADDI on 68K.
ADDX without preceding CLC is left alone (it may need the carry from a previous op).
"""

import re
import glob
import os

CLC_PATTERN = re.compile(r'ANDI\s+#\$FFFE,SR\s*;.*CLC')
ADDX_IMM_PATTERN = re.compile(
    r'^(\s*)ADDX\.B\s+#(\$[0-9A-Fa-f]+),(D[0-7])\s*(;.*ADC imm.*)$'
)
# Match previously broken output (ADDI.B without # prefix on immediate)
BROKEN_ADDI_PATTERN = re.compile(
    r'^(\s*)ADDI\.B\s+(\$[0-9A-Fa-f]+),(D[0-7])\s*(;.*FIX: CLC\+ADC.*)$'
)

def fix_clc_addx(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    fixes = 0
    clc_seen = False

    for line in lines:
        # First: fix any previously broken ADDI.B output (missing # prefix)
        m_broken = BROKEN_ADDI_PATTERN.match(line)
        if m_broken:
            indent = m_broken.group(1)
            imm = m_broken.group(2)
            reg = m_broken.group(3)
            comment = m_broken.group(4)
            new_lines.append(f"{indent}ADDI.B  #{imm},{reg}       {comment}\n")
            fixes += 1
            clc_seen = False
            continue

        # Check if this line is a CLC (ANDI #$FFFE,SR)
        if CLC_PATTERN.search(line):
            clc_seen = True
            new_lines.append(line)
            continue

        if clc_seen:
            # Skip blank lines and comments between CLC and ADDX
            stripped = line.strip()
            if stripped == '' or (stripped.startswith(';') and 'ADDX' not in stripped):
                new_lines.append(line)
                continue

            m = ADDX_IMM_PATTERN.match(line)
            if m:
                indent = m.group(1)
                imm = m.group(2)
                reg = m.group(3)
                comment = m.group(4)
                # Replace ADDX.B with ADDI.B (with # prefix!)
                new_line = f"{indent}ADDI.B  #{imm},{reg}       {comment.replace('ADC imm (uses X flag for carry)', 'FIX: CLC+ADC = ADDI (was ADDX)')}\n"
                new_lines.append(new_line)
                fixes += 1
                clc_seen = False
                continue
            else:
                # Non-ADDX line after CLC - reset
                clc_seen = False

        new_lines.append(line)

    if fixes > 0:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.writelines(new_lines)

    return fixes

if __name__ == '__main__':
    total = 0
    bank_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'src', 'banks', 'generated')
    bank_dir = os.path.normpath(bank_dir)

    for f in sorted(glob.glob(os.path.join(bank_dir, 'bank_*_gen68k.asm'))):
        n = fix_clc_addx(f)
        if n > 0:
            print(f"  {os.path.basename(f)}: {n} CLC+ADDX/ADDI fixes")
            total += n

    print(f"\nTotal CLC+ADDX fixes: {total}")
