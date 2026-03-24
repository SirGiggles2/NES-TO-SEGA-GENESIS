#!/usr/bin/env python3
"""
fix_byte_directives.py - Convert commented .BYTE directives to real DC.B data.

The translator outputs data tables as comments like:
    ; [DIRECTIVE] .BYTE $24, $24, $24  -- needs manual handling  ; orig: ...
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: ...

This script converts them to actual assembler directives:
    DC.B $24,$24,$24  ; data (was .BYTE)
    DC.B $FF  ; data (was .BYTE)

Also handles:
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling
    -> DC.B $00+$00+$20  ; data (expression)

And .DBYT (16-bit big-endian values) marked as:
    ; !! UNKNOWN: .DBYT $23C0
    -> DC.B $23,$C0  ; data (was .DBYT $23C0)

IMPORTANT: Only converts simple numeric .BYTE directives. Leaves alone:
    - .BYTE with symbolic names (con_*, ram_*, etc.) that need special handling
    - .WORD directives (different semantics)
"""

import re
import glob
import os

# Match: ; [DIRECTIVE] .BYTE <values>  -- needs manual handling  ; orig: ...
BYTE_DIRECTIVE = re.compile(
    r'^(\s*); \[DIRECTIVE\] \.BYTE (.+?)\s+-- needs manual handling\s*(;.*)?$'
)

# Match: ; !! UNKNOWN: .DBYT $XXXX  ; orig: ...
DBYT_DIRECTIVE = re.compile(
    r'^(\s*); !! UNKNOWN: \.DBYT \$([0-9A-Fa-f]{4})\s*(;.*)?$'
)

# Check if a .BYTE value is purely numeric (hex or expression of hex)
def is_numeric_byte_values(val_str):
    """Check if all values in a .BYTE directive are numeric constants or expressions."""
    # Split by comma
    parts = [p.strip() for p in val_str.split(',')]
    for part in parts:
        # Allow hex values like $FF
        # Allow expressions like $00 + $00 + $20
        # Allow decimal constants
        # Disallow symbolic names (con_*, ram_*, etc.)
        cleaned = part.replace('+', ' ').replace('-', ' ').strip()
        tokens = cleaned.split()
        for tok in tokens:
            tok = tok.strip()
            if not tok:
                continue
            if tok.startswith('$'):
                # Hex value - OK
                try:
                    int(tok[1:], 16)
                except ValueError:
                    return False
            elif tok.isdigit():
                # Decimal - OK
                pass
            else:
                # Symbolic name - skip this directive
                return False
    return True

def format_dc_b(val_str):
    """Format values for DC.B directive."""
    parts = [p.strip() for p in val_str.split(',')]
    formatted = []
    for part in parts:
        part = part.strip()
        if '+' in part or '-' in part:
            # Expression - keep as-is but remove spaces for compactness
            formatted.append(part.replace(' ', ''))
        else:
            formatted.append(part)
    return ','.join(formatted)

def fix_byte_directives(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    fixes = 0

    for line in lines:
        # Try .BYTE directive
        m = BYTE_DIRECTIVE.match(line)
        if m:
            indent = m.group(1)
            values = m.group(2).strip()
            orig_comment = m.group(3) or ''

            if is_numeric_byte_values(values):
                formatted = format_dc_b(values)
                new_lines.append(f"{indent}DC.B {formatted}  ; data (was .BYTE) {orig_comment}\n")
                fixes += 1
                continue

        # Try .DBYT directive
        m2 = DBYT_DIRECTIVE.match(line)
        if m2:
            indent = m2.group(1)
            hex_val = m2.group(2)
            orig_comment = m2.group(3) or ''
            hi = hex_val[:2]
            lo = hex_val[2:]
            new_lines.append(f"{indent}DC.B ${hi},${lo}  ; data (was .DBYT ${hex_val}) {orig_comment}\n")
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
        n = fix_byte_directives(f)
        if n > 0:
            print(f"  {os.path.basename(f)}: {n} .BYTE/.DBYT -> DC.B fixes")
            total += n

    print(f"\nTotal data directive fixes: {total}")
