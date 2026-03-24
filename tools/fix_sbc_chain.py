#!/usr/bin/env python3
"""Fix 16-bit SBC carry chain bugs.

Pattern: SEC + SBC #$XX (low byte) + LDA high + SBC #$00 (high byte)
The high-byte SBC needs borrow from the low-byte SBC.
68K SUB.B ignores X flag, so SBC #$00 becomes a no-op.
Fix: Replace SUB.B #$00,D0 with MOVEQ #0,D3 / SUBX.B D3,D0

Also catches SBC #$00 after BSR/JSR (carry from subroutine).
"""
import re, sys, glob, os

def get_files():
    if len(sys.argv) > 1:
        return [sys.argv[1]]
    script_dir = os.path.dirname(os.path.abspath(__file__))
    vdp_dir = os.path.join(script_dir, '..', 'src', 'banks', 'generated_vdp')
    return sorted(glob.glob(os.path.join(vdp_dir, '*.asm')))

# Pattern: SUB.B #$00,D0 with SBC comment
sbc_zero = re.compile(r'^(\s+)SUB\.B\s+#\$00,D0\s+;\s+SBC imm', re.IGNORECASE)

# Preceding SBC/SUB pattern (low byte)
low_sbc = re.compile(r'^\s+(SUB\.B\s+#\$|SUBI\.B\s+#\$)', re.IGNORECASE)

# SEC pattern
sec_pattern = re.compile(r'^\s+ORI\s+#\$0001,SR\s+;\s+SEC', re.IGNORECASE)

# BSR/JSR (carry from subroutine)
bsr_pattern = re.compile(r'^\s+(BSR|JSR)\s', re.IGNORECASE)

# PHP/PLP pattern
plp_pattern = re.compile(r'^\s+MOVE\s+\(A7\)\+,SR', re.IGNORECASE)

total_fixed = 0
for filepath in get_files():
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    fname = os.path.basename(filepath)
    fixed = 0
    i = 0
    while i < len(lines):
        m = sbc_zero.match(lines[i])
        if not m:
            i += 1
            continue

        indent = m.group(1)

        # Already fixed?
        if 'SUBX' in lines[i] or 'FIX' in lines[i]:
            i += 1
            continue

        # Look backward for carry source
        found_source = False
        source_desc = 'unknown'
        for j in range(i - 1, max(-1, i - 8), -1):
            pline = lines[j].strip()
            if not pline or pline.startswith(';'):
                continue
            if low_sbc.match(lines[j]) and 'SBC' in lines[j]:
                # Check for SEC before the low-byte SBC
                for k in range(j - 1, max(-1, j - 4), -1):
                    if sec_pattern.match(lines[k]):
                        found_source = True
                        source_desc = 'low byte'
                        break
                break
            if bsr_pattern.match(lines[j]):
                found_source = True
                source_desc = 'subroutine'
                break
            if plp_pattern.match(lines[j]):
                found_source = True
                source_desc = 'PHP/PLP'
                break

        if not found_source:
            i += 1
            continue

        # Replace with MOVEQ #0,D3 / SUBX.B D3,D0
        new_lines = '{}MOVEQ   #0,D3             ; FIX: SBC #$00 = subtract borrow from {}\n'.format(indent, source_desc)
        new_lines += '{}SUBX.B  D3,D0             ; D0 -= 0 + X_flag  ; orig: SBC #$00\n'.format(indent)

        lines[i] = new_lines
        fixed += 1
        print('  {} line {}: SUB.B #$00,D0 -> SUBX.B (borrow from {})'.format(fname, i + 1, source_desc))
        i += 1

    if fixed:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.writelines(lines)
    total_fixed += fixed

print('\nTotal: {} SBC carry chain fixes applied'.format(total_fixed))
