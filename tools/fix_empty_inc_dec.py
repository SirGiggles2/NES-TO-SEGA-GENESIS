#!/usr/bin/env python3
"""
fix_empty_inc_dec.py - Fix empty INC/DEC translations in generated bank files.
Parses the original NES opcode from the comment and generates correct 68K code.

NES opcodes handled:
  E6 zp      INC zp         -> ADDQ.B #1,$FF00xx
  F6 zp      INC zp,X       -> MOVEA.L #$FF00xx,A0 / ADDQ.B #1,(A0,D1.L)
  EE lo hi   INC abs        -> ADDQ.B #1,$FFxxxx
  FE lo hi   INC abs,X      -> MOVEA.L #$FFxxxx,A0 / ADDQ.B #1,(A0,D1.L)
  C6 zp      DEC zp         -> SUBQ.B #1,$FF00xx
  D6 zp      DEC zp,X       -> MOVEA.L #$FF00xx,A0 / SUBQ.B #1,(A0,D1.L)
  CE lo hi   DEC abs        -> SUBQ.B #1,$FFxxxx
  DE lo hi   DEC abs,X      -> MOVEA.L #$FFxxxx,A0 / SUBQ.B #1,(A0,D1.L)
"""

import re
import glob
import os

def get_indent(line):
    return re.match(r'^(\s*)', line).group(1)

def fix_line(line):
    """Fix an empty INC/DEC translation line. Returns list of replacement lines."""
    # Match: ; (empty translation for INC|DEC)  ; orig: ... XX XX [XX]  INC|DEC ...
    m = re.match(
        r'^(\s*); \(empty translation for (INC|DEC)\)\s*; orig: (.+?) (E6|F6|EE|FE|C6|D6|CE|DE) ([0-9A-Fa-f]{2})\s*([0-9A-Fa-f]{2})?\s+(INC|DEC)\s+(.*)$',
        line
    )
    if not m:
        return None

    indent = m.group(1)
    op_type = m.group(2)  # INC or DEC
    orig_prefix = m.group(3)
    opcode = m.group(4).upper()
    byte1 = m.group(5).upper()
    byte2 = m.group(6)
    nes_mnemonic = m.group(7)
    operand_text = m.group(8).rstrip()

    if byte2:
        byte2 = byte2.upper()

    # Determine addressing mode and compute Genesis address
    inc_op = "ADDQ.B" if op_type == "INC" else "SUBQ.B"

    if opcode in ('E6', 'C6'):  # INC/DEC zp (zero page, no index)
        addr = int(byte1, 16)
        gen_addr = f"$FF00{addr:02X}"
        orig_comment = f"; orig: {orig_prefix} {opcode} {byte1}     {nes_mnemonic} {operand_text}"
        return [f"{indent}{inc_op}  #1,{gen_addr}  ; FIX v378: {op_type} ${addr:02X}  {orig_comment}\n"]

    elif opcode in ('F6', 'D6'):  # INC/DEC zp,X (zero page indexed)
        addr = int(byte1, 16)
        gen_addr = f"$FF00{addr:02X}"
        orig_comment = f"; orig: {orig_prefix} {opcode} {byte1}     {nes_mnemonic} {operand_text}"
        return [
            f"{indent}MOVEA.L #{gen_addr},A0  ; FIX v378: {op_type} ${addr:02X},X base\n",
            f"{indent}{inc_op}  #1,(A0,D1.L)  {orig_comment}\n"
        ]

    elif opcode in ('EE', 'CE'):  # INC/DEC abs (absolute, no index)
        if byte2 is None:
            return None
        addr = int(byte2, 16) * 256 + int(byte1, 16)  # little-endian
        gen_addr = f"$FF{addr:04X}"
        orig_comment = f"; orig: {orig_prefix} {opcode} {byte1} {byte2}  {nes_mnemonic} {operand_text}"
        return [f"{indent}{inc_op}  #1,{gen_addr}  ; FIX v378: {op_type} ${addr:04X}  {orig_comment}\n"]

    elif opcode in ('FE', 'DE'):  # INC/DEC abs,X (absolute indexed)
        if byte2 is None:
            return None
        addr = int(byte2, 16) * 256 + int(byte1, 16)  # little-endian
        gen_addr = f"$FF{addr:04X}"
        orig_comment = f"; orig: {orig_prefix} {opcode} {byte1} {byte2}  {nes_mnemonic} {operand_text}"
        return [
            f"{indent}MOVEA.L #{gen_addr},A0  ; FIX v378: {op_type} ${addr:04X},X base\n",
            f"{indent}{inc_op}  #1,(A0,D1.L)  {orig_comment}\n"
        ]

    return None

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    fixes = 0

    for line in lines:
        if '; (empty translation for INC)' in line or '; (empty translation for DEC)' in line:
            # Check if already fixed (has "Fix X:" or actual instruction before comment)
            stripped = line.lstrip()
            if stripped.startswith(';'):
                # Truly empty - just a comment
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
    # Only process non-VDP files (VDP files get regenerated)
    files = [f for f in files if '_vdp' not in f]

    for f in files:
        n = process_file(f)
        if n > 0:
            print(f"  {f}: {n} fixes")
            total += n

    print(f"\nTotal INC/DEC fixes: {total}")
