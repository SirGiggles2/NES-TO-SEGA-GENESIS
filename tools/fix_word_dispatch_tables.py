#!/usr/bin/env python3
"""
fix_word_dispatch_tables.py - Convert .WORD dispatch table entries to DC.L
ONLY when they follow a BSR to sub_0x01E5F2_jump_to_pointers_after_JSR.

This is the NES-to-68K jump table dispatcher. On the NES, the JSR leaves
a 16-bit return address on stack; on 68K, the BSR leaves a 32-bit return
address. The dispatcher reads DC.L entries from the table.
"""

import re
import glob
import os

DISPATCH_PATTERN = re.compile(r'sub_0x01E5F2_jump_to_pointers_after_JSR')
WORD_DIRECTIVE = re.compile(
    r'^(\s*); \[DIRECTIVE\] \.WORD (\S+)\s+-- needs manual handling\s*; orig:.*$'
)

def fix_dispatch_tables(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    fixes = 0
    in_dispatch = False

    for line in lines:
        # Check if this line calls the dispatch function
        if DISPATCH_PATTERN.search(line):
            in_dispatch = True
            new_lines.append(line)
            continue

        if in_dispatch:
            m = WORD_DIRECTIVE.match(line)
            if m:
                indent = m.group(1)
                label = m.group(2)
                new_lines.append(f"{indent}DC.L {label}  ; FIX v448: dispatch table (was .WORD)\n")
                fixes += 1
                continue
            else:
                # Non-.WORD line - end of dispatch table
                in_dispatch = False

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
        n = fix_dispatch_tables(f)
        if n > 0:
            print(f"  {os.path.basename(f)}: {n} .WORD -> DC.L dispatch fixes")
            total += n

    print(f"\nTotal dispatch table fixes: {total}")
