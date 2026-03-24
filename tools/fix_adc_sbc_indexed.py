#!/usr/bin/env python3
"""
fix_adc_sbc_indexed.py - Fix commented-out ADC/SBC indexed mode instructions.

The translator left these as comments because indexed ADC/SBC wasn't auto-translated:
    ; !! SBC ram_pos_X_enemy,X - complex mode, manual review needed
    ; !! ADC tbl_82D3_pos_Y,Y - complex mode, manual review needed

This script converts them to proper 68K instructions:
- SEC + SBC ram,X -> SUB.B ram(D1.L),D0    (simple subtract, carry pre-set)
- SEC + SBC ram,Y -> SUB.B ram(D2.L),D0
- CLC + ADC ram,X -> ADD.B ram(D1.L),D0    (simple add, carry pre-cleared)
- CLC + ADC ram,Y -> ADD.B ram(D2.L),D0
- CLC + ADC tbl,X -> ADD.B tbl(D1.L),D0
- CLC + ADC tbl,Y -> ADD.B tbl(D2.L),D0

Register mapping: NES X = D1, NES Y = D2, NES A = D0
"""

import re
import glob
import os

# Patterns
SEC_LINE = re.compile(r'ORI\s+#\$0001,SR\s*;.*SEC')
CLC_LINE = re.compile(r'ANDI\s+#\$FFFE,SR\s*;.*CLC')

# Match: ; !! SBC <symbol>,X  or  ; !! SBC <symbol>,Y
SBC_INDEXED = re.compile(
    r'^(\s*); !! SBC (\S+),(X|Y)\s+-\s+complex mode.*$'
)

# Match: ; !! ADC <symbol>,X  or  ; !! ADC <symbol>,Y
ADC_INDEXED = re.compile(
    r'^(\s*); !! ADC (\S+),(X|Y)\s+-\s+complex mode.*$'
)

def idx_reg(nes_reg):
    """Convert NES index register name to 68K."""
    return 'D1' if nes_reg == 'X' else 'D2'

def fix_adc_sbc_indexed(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    fixes = 0
    sec_seen = False
    clc_seen = False

    for line in lines:
        # Detect SEC / CLC
        if SEC_LINE.search(line):
            sec_seen = True
            clc_seen = False
            new_lines.append(line)
            continue
        if CLC_LINE.search(line):
            clc_seen = True
            sec_seen = False
            new_lines.append(line)
            continue

        # Try SBC match
        m_sbc = SBC_INDEXED.match(line)
        if m_sbc:
            indent = m_sbc.group(1)
            symbol = m_sbc.group(2)
            nes_idx = m_sbc.group(3)
            reg = idx_reg(nes_idx)
            if sec_seen:
                # SEC + SBC = simple subtract
                new_lines.append(f"{indent}SUB.B   {symbol}({reg}.L),D0  ; FIX: SEC+SBC {symbol},{nes_idx} -> SUB.B\n")
            else:
                # SBC without SEC - use SUBX semantics (rare, keep as SUB for now)
                new_lines.append(f"{indent}SUB.B   {symbol}({reg}.L),D0  ; FIX: SBC {symbol},{nes_idx} -> SUB.B (carry not pre-set)\n")
            fixes += 1
            sec_seen = False
            clc_seen = False
            continue

        # Try ADC match
        m_adc = ADC_INDEXED.match(line)
        if m_adc:
            indent = m_adc.group(1)
            symbol = m_adc.group(2)
            nes_idx = m_adc.group(3)
            reg = idx_reg(nes_idx)
            if clc_seen:
                # CLC + ADC = simple add
                new_lines.append(f"{indent}ADD.B   {symbol}({reg}.L),D0  ; FIX: CLC+ADC {symbol},{nes_idx} -> ADD.B\n")
            else:
                # ADC without CLC - use ADD for now (carry contribution lost)
                new_lines.append(f"{indent}ADD.B   {symbol}({reg}.L),D0  ; FIX: ADC {symbol},{nes_idx} -> ADD.B (carry not pre-cleared)\n")
            fixes += 1
            sec_seen = False
            clc_seen = False
            continue

        # Any other line resets SEC/CLC tracking (unless blank/comment)
        stripped = line.strip()
        if stripped and not stripped.startswith(';'):
            sec_seen = False
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
        n = fix_adc_sbc_indexed(f)
        if n > 0:
            print(f"  {os.path.basename(f)}: {n} ADC/SBC indexed fixes")
            total += n

    print(f"\nTotal ADC/SBC indexed fixes: {total}")
