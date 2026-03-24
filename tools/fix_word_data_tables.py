#!/usr/bin/env python3
"""
fix_word_data_tables.py - Convert commented .WORD data table entries to DC.B byte pairs.

NES data tables use .WORD to store 16-bit little-endian addresses that are read
byte-by-byte at runtime. These were commented out by the translator.

Format: ; [DIRECTIVE] .WORD <symbol>  -- needs manual handling  ; orig: ... XX YY ...
The actual bytes XX YY are extracted from the orig comment (NES ROM bytes).
Output: DC.B $XX,$YY  ; data (was .WORD <symbol>)

This ONLY converts .WORD entries that have raw bytes in the orig comment.
Dispatch table .WORD entries (after BSR to jump_to_pointers) are already handled
by fix_word_dispatch_tables.py and produce DC.L.
"""

import re
import glob
import os

# Match: ; [DIRECTIVE] .WORD <symbol>  -- needs manual handling  ; orig: ... XX:YYYY: HH LL ...
WORD_DIRECTIVE = re.compile(
    r'^(\s*); \[DIRECTIVE\] \.WORD (\S+)\s+-- needs manual handling\s*; orig:.*\d+:\s*([0-9A-Fa-f]{2})\s+([0-9A-Fa-f]{2})\s'
)

# Alternative format where bytes are at a different position
WORD_DIRECTIVE_ALT = re.compile(
    r'^(\s*); \[DIRECTIVE\] \.WORD (\S+)\s+-- needs manual handling\s*; orig:.*[0-9A-Fa-f]{4}:\s*([0-9A-Fa-f]{2})\s+([0-9A-Fa-f]{2})\s'
)

def fix_word_data_tables(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    fixes = 0

    for line in lines:
        m = WORD_DIRECTIVE.match(line)
        if not m:
            m = WORD_DIRECTIVE_ALT.match(line)
        if m:
            indent = m.group(1)
            symbol = m.group(2)
            lo_byte = m.group(3)  # First byte in ROM (low byte in NES little-endian)
            hi_byte = m.group(4)  # Second byte in ROM (high byte)
            new_lines.append(f"{indent}DC.B ${lo_byte},${hi_byte}  ; data (was .WORD {symbol})\n")
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
        n = fix_word_data_tables(f)
        if n > 0:
            print(f"  {os.path.basename(f)}: {n} .WORD -> DC.B data fixes")
            total += n

    print(f"\nTotal .WORD data table fixes: {total}")
