#!/usr/bin/env python3
"""
fix_symbolic_byte_directives.py - Convert remaining .BYTE directives with symbolic names
to DC.B using the raw byte value from the orig comment.

Format: ; [DIRECTIVE] .BYTE con_xxx + $YY  -- needs manual handling  ; orig: ... XX:YYYY: ZZ ...
The actual byte ZZ is extracted from the orig comment.
Output: DC.B $ZZ  ; data (was .BYTE con_xxx + $YY)
"""

import re
import glob
import os

# Match any remaining .BYTE directive with raw byte in orig comment
# The raw byte is after the NES address (XX:YYYY: BB)
BYTE_SYMBOLIC = re.compile(
    r'^(\s*); \[DIRECTIVE\] \.BYTE (.+?)\s+-- needs manual handling\s*; orig:.*[0-9A-Fa-f]{4}:\s*([0-9A-Fa-f]{2})\s'
)

def fix_symbolic_bytes(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    fixes = 0

    for line in lines:
        m = BYTE_SYMBOLIC.match(line)
        if m:
            indent = m.group(1)
            symbol = m.group(2).strip()
            raw_byte = m.group(3)
            new_lines.append(f"{indent}DC.B ${raw_byte}  ; data (was .BYTE {symbol})\n")
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
        n = fix_symbolic_bytes(f)
        if n > 0:
            print(f"  {os.path.basename(f)}: {n} symbolic .BYTE -> DC.B fixes")
            total += n

    print(f"\nTotal symbolic .BYTE fixes: {total}")
