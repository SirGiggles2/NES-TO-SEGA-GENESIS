#!/usr/bin/env python3
"""Fix 16-bit ADC carry chain bugs.

Pattern: CLC + ADC #$XX (low byte) + LDA high + ADC #$00 (high byte)
The high-byte ADC needs carry from the low-byte ADC.
68K ADD.B ignores X flag, so ADC #$00 becomes a no-op.
Fix: Replace ADD.B #$00,D0 with MOVEQ #0,D3 / ADDX.B D3,D0
"""
import re, sys, glob, os

def get_files():
    if len(sys.argv) > 1:
        return [sys.argv[1]]
    script_dir = os.path.dirname(os.path.abspath(__file__))
    vdp_dir = os.path.join(script_dir, '..', 'src', 'banks', 'generated_vdp')
    return sorted(glob.glob(os.path.join(vdp_dir, '*.asm')))

# Pattern: ADD.B #$00,D0 with ADC comment (high byte of 16-bit add)
adc_zero = re.compile(r'^(\s+)ADD\.B\s+#\$00,D0\s+;\s+ADC imm', re.IGNORECASE)

# Also match non-zero high byte ADC in chains
adc_any = re.compile(r'^(\s+)ADD\.B\s+#\$([0-9A-Fa-f]+),D0\s+;\s+ADC imm', re.IGNORECASE)

# Preceding ADC pattern (low byte) - look for ADD.B or ADDI.B with ADC comment
low_adc = re.compile(r'^\s+(ADD\.B\s+#\$|ADDI\.B\s+#\$)', re.IGNORECASE)

# CLC pattern
clc_pattern = re.compile(r'^\s+ANDI\s+#\$FFFE,SR\s+;\s+CLC', re.IGNORECASE)

total_fixed = 0
for filepath in get_files():
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    fname = os.path.basename(filepath)
    fixed = 0
    i = 0
    while i < len(lines):
        m = adc_zero.match(lines[i])
        if not m:
            i += 1
            continue

        indent = m.group(1)

        # Already fixed?
        if 'ADDX' in lines[i] or 'FIX' in lines[i]:
            i += 1
            continue

        # Look backward for the low-byte ADC (should be within ~6 lines)
        found_low_adc = False
        found_clc = False
        for j in range(i - 1, max(-1, i - 8), -1):
            pline = lines[j].strip()
            if not pline or pline.startswith(';'):
                continue
            if low_adc.match(lines[j]) and 'ADC' in lines[j]:
                found_low_adc = True
                # Now look back further for the CLC
                for k in range(j - 1, max(-1, j - 4), -1):
                    if clc_pattern.match(lines[k]):
                        found_clc = True
                        break
                break

        if not found_low_adc or not found_clc:
            i += 1
            continue

        # Replace with MOVEQ #0,D3 / ADDX.B D3,D0
        new_lines = '{}MOVEQ   #0,D3             ; FIX: ADC #$00 = add carry from low byte\n'.format(indent)
        new_lines += '{}ADDX.B  D3,D0             ; D0 += 0 + X_flag  ; orig: ADC #$00\n'.format(indent)

        lines[i] = new_lines
        fixed += 1
        print('  {} line {}: ADD.B #$00,D0 -> ADDX.B (16-bit carry chain)'.format(fname, i + 1))
        i += 1

    if fixed:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.writelines(lines)
    total_fixed += fixed

print('\nTotal: {} ADC carry chain fixes applied'.format(total_fixed))
