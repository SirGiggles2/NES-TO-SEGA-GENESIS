#!/usr/bin/env python3
"""
fix_empty_sta_lda.py - Fix empty STA/LDA/STX/STY/LDX/LDY translations.
Parses the original NES opcode and generates correct 68K code.

NES opcodes handled:
  STA zp (85 zp)       -> MOVE.B D0,$FF00xx
  STA abs (8D lo hi)   -> MOVE.B D0,$FFxxxx
  STA zp,X (95 zp)     -> MOVEA.L #$FF00xx,A0 / MOVE.B D0,(A0,D1.L)
  STA abs,X (9D lo hi) -> MOVEA.L #$FFxxxx,A0 / MOVE.B D0,(A0,D1.L)
  STA abs,Y (99 lo hi) -> MOVEA.L #$FFxxxx,A0 / MOVE.B D0,(A0,D2.L)

  LDA zp (A5 zp)       -> MOVE.B $FF00xx,D0
  LDA abs (AD lo hi)   -> MOVE.B $FFxxxx,D0
  LDA zp,X (B5 zp)     -> MOVEA.L #$FF00xx,A0 / MOVE.B (A0,D1.L),D0
  LDA abs,X (BD lo hi) -> MOVEA.L #$FFxxxx,A0 / MOVE.B (A0,D1.L),D0
  LDA abs,Y (B9 lo hi) -> MOVEA.L #$FFxxxx,A0 / MOVE.B (A0,D2.L),D0

  STX zp (86 zp)       -> MOVE.B D1,$FF00xx
  STX abs (8E lo hi)   -> MOVE.B D1,$FFxxxx
  STY zp (84 zp)       -> MOVE.B D2,$FF00xx
  STY abs (8C lo hi)   -> MOVE.B D2,$FFxxxx

  LDX zp (A6 zp)       -> MOVE.B $FF00xx,D1
  LDX abs (AE lo hi)   -> MOVE.B $FFxxxx,D1
  LDY zp (A4 zp)       -> MOVE.B $FF00xx,D2
  LDY abs (AC lo hi)   -> MOVE.B $FFxxxx,D2
"""

import re
import glob

# Opcode -> (mnemonic, register, is_store, has_index, index_reg, addr_mode)
OPCODE_MAP = {
    # STA variants
    '85': ('STA', 'D0', True,  False, None, 'zp'),
    '8D': ('STA', 'D0', True,  False, None, 'abs'),
    '95': ('STA', 'D0', True,  True,  'D1', 'zp'),
    '9D': ('STA', 'D0', True,  True,  'D1', 'abs'),
    '99': ('STA', 'D0', True,  True,  'D2', 'abs'),
    # LDA variants
    'A5': ('LDA', 'D0', False, False, None, 'zp'),
    'AD': ('LDA', 'D0', False, False, None, 'abs'),
    'B5': ('LDA', 'D0', False, True,  'D1', 'zp'),
    'BD': ('LDA', 'D0', False, True,  'D1', 'abs'),
    'B9': ('LDA', 'D0', False, True,  'D2', 'abs'),
    # STX/LDX
    '86': ('STX', 'D1', True,  False, None, 'zp'),
    '8E': ('STX', 'D1', True,  False, None, 'abs'),
    'A6': ('LDX', 'D1', False, False, None, 'zp'),
    'AE': ('LDX', 'D1', False, False, None, 'abs'),
    # STY/LDY (including indexed)
    '84': ('STY', 'D2', True,  False, None, 'zp'),
    '8C': ('STY', 'D2', True,  False, None, 'abs'),
    '94': ('STY', 'D2', True,  True,  'D1', 'zp'),    # STY zp,X
    'A4': ('LDY', 'D2', False, False, None, 'zp'),
    'AC': ('LDY', 'D2', False, False, None, 'abs'),
    'B4': ('LDY', 'D2', False, True,  'D1', 'zp'),    # LDY zp,X
    'BC': ('LDY', 'D2', False, True,  'D1', 'abs'),   # LDY abs,X
    # STX/LDX indexed
    '96': ('STX', 'D1', True,  True,  'D2', 'zp'),    # STX zp,Y
    'B6': ('LDX', 'D1', False, True,  'D2', 'zp'),    # LDX zp,Y
    'BE': ('LDX', 'D1', False, True,  'D2', 'abs'),   # LDX abs,Y
}

def fix_line(line):
    """Fix an empty STA/LDA/STX/STY/LDX/LDY translation line."""
    # Match pattern: ; (empty translation for XXX)  ; orig: ... OO BB [HH]  XXX ...
    m = re.match(
        r'^(\s*); \(empty translation for (STA|LDA|STX|STY|LDX|LDY)\)\s*; orig: (.+?) ([0-9A-Fa-f]{2}) ([0-9A-Fa-f]{2})\s*([0-9A-Fa-f]{2})?\s+(STA|LDA|STX|STY|LDX|LDY)\s+(.*)$',
        line
    )
    if not m:
        return None

    indent = m.group(1)
    empty_type = m.group(2)
    orig_prefix = m.group(3)
    opcode = m.group(4).upper()
    byte1 = m.group(5).upper()
    byte2 = m.group(6)
    nes_mnemonic = m.group(7)
    operand_text = m.group(8).rstrip()

    if byte2:
        byte2 = byte2.upper()

    info = OPCODE_MAP.get(opcode)
    if not info:
        return None

    mnemonic, reg, is_store, has_index, index_reg, addr_mode = info

    # Compute Genesis address
    if addr_mode == 'zp':
        addr = int(byte1, 16)
        gen_addr = f"$FF00{addr:02X}"
        addr_desc = f"${addr:02X}"
        orig_bytes = f"{opcode} {byte1}"
    else:  # abs
        if byte2 is None:
            return None
        addr = int(byte2, 16) * 256 + int(byte1, 16)
        gen_addr = f"$FF{addr:04X}"
        addr_desc = f"${addr:04X}"
        orig_bytes = f"{opcode} {byte1} {byte2}"

    idx_suffix = f",X" if index_reg == 'D1' else (",Y" if index_reg == 'D2' else "")
    fix_comment = f"; FIX v378: {mnemonic} {addr_desc}{idx_suffix}"
    orig_comment = f"; orig: {orig_prefix} {orig_bytes}  {nes_mnemonic} {operand_text}"

    if has_index:
        # Indexed - need MOVEA.L + indexed access
        if is_store:
            return [
                f"{indent}MOVEA.L #{gen_addr},A0  {fix_comment} base\n",
                f"{indent}MOVE.B  {reg},(A0,{index_reg}.L)  {orig_comment}\n"
            ]
        else:
            return [
                f"{indent}MOVEA.L #{gen_addr},A0  {fix_comment} base\n",
                f"{indent}MOVE.B  (A0,{index_reg}.L),{reg}  {orig_comment}\n"
            ]
    else:
        # Direct - simple MOVE.B
        if is_store:
            return [f"{indent}MOVE.B  {reg},{gen_addr}  {fix_comment}  {orig_comment}\n"]
        else:
            return [f"{indent}MOVE.B  {gen_addr},{reg}  {fix_comment}  {orig_comment}\n"]

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    fixes = 0

    for line in lines:
        if '; (empty translation for ' in line:
            stripped = line.lstrip()
            if stripped.startswith(';') and any(f'for {op})' in line for op in ['STA', 'LDA', 'STX', 'STY', 'LDX', 'LDY']):
                replacement = fix_line(line)
                if replacement:
                    new_lines.extend(replacement)
                    fixes += 1
                    continue
        new_lines.append(line)

    if fixes > 0:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.writelines(new_lines)

    return fixes

if __name__ == '__main__':
    total = 0
    files = sorted(glob.glob("bank_*_gen68k.asm"))
    files = [f for f in files if '_vdp' not in f]

    for f in files:
        n = process_file(f)
        if n > 0:
            print(f"  {f}: {n} fixes")
            total += n

    print(f"\nTotal STA/LDA/STX/STY/LDX/LDY fixes: {total}")
