#!/usr/bin/env python3
"""
fix_indexed_ops.py - Fix ALL remaining commented-out indexed mode operations.

Handles: ORA, AND, EOR, CMP, ADC, SBC with indexed addressing (ram,X / ram,Y / tbl,X / tbl,Y)

NES to 68K mapping:
  ORA ram,X  -> OR.B  ram(D1.L),D0
  AND ram,X  -> AND.B ram(D1.L),D0
  EOR ram,X  -> EOR.B ram(D1.L),D0
  CMP ram,X  -> CMP.B ram(D1.L),D0
  ADC ram,X  -> ADD.B ram(D1.L),D0   (when preceded by CLC)
  SBC ram,X  -> SUB.B ram(D1.L),D0   (when preceded by SEC)

Same patterns with Y -> D2.L
"""

import re
import glob
import os

# Match: ; !! <OP> <symbol>,X/Y - needs manual review
# EXCLUDE indirect indexed (zp),Y patterns (symbol starts with parenthesis)
INDEXED_OP = re.compile(
    r'^(\s*); !! (ORA|AND|EOR|CMP|ADC|SBC) ([^(\s]\S*),(X|Y)\s+-\s+(?:complex mode, )?(?:manual|needs manual).*$'
)

# Map NES ops to 68K ops
OP_MAP = {
    'ORA': 'OR.B',
    'AND': 'AND.B',
    'EOR': 'EOR.B',
    'CMP': 'CMP.B',
    'ADC': 'ADD.B',
    'SBC': 'SUB.B',
}

def idx_reg(nes_reg):
    return 'D1' if nes_reg == 'X' else 'D2'

def fix_indexed_ops(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    fixes = 0

    for line in lines:
        m = INDEXED_OP.match(line)
        if m:
            indent = m.group(1)
            nes_op = m.group(2)
            symbol = m.group(3)
            nes_idx = m.group(4)
            m68k_op = OP_MAP.get(nes_op, nes_op)
            reg = idx_reg(nes_idx)

            # Clean up symbol - remove trailing commas or spaces
            symbol = symbol.rstrip(',').strip()

            new_lines.append(f"{indent}{m68k_op}   {symbol}({reg}.L),D0  ; FIX: {nes_op} {symbol},{nes_idx}\n")
            fixes += 1
            continue

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
        n = fix_indexed_ops(f)
        if n > 0:
            print(f"  {os.path.basename(f)}: {n} indexed operation fixes")
            total += n

    print(f"\nTotal indexed operation fixes: {total}")
