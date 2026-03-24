#!/usr/bin/env python3
"""
fix_even_alignment.py - Insert EVEN directives after DC.B data before code labels.

On the Motorola 68000, instructions must be word-aligned (even address).
If DC.B data with an odd total byte count precedes a code label, the CPU
will crash with an Address Error when it tries to fetch the instruction.

This script:
1. Tracks running byte count from consecutive DC.B lines
2. When a code label or instruction follows and the byte count is odd,
   inserts an EVEN directive
3. Only inserts EVEN if not already present
"""

import re
import glob
import os

# Match DC.B data line
DC_B_LINE = re.compile(r'^\s*DC\.B\s+(.+?)(?:\s*;.*)?$')

# Match a label (word followed by colon at start or with indent)
LABEL_LINE = re.compile(r'^(\s*)(\w+):')

# Match an instruction (indented, starts with a 68K mnemonic)
INSTR_LINE = re.compile(
    r'^\s+(MOVE|MOVEA|MOVEQ|ADD|ADDI|ADDQ|ADDA|SUB|SUBI|SUBQ|SUBA|'
    r'AND|ANDI|OR|ORI|EOR|EORI|NOT|NEG|CLR|CMP|CMPI|TST|'
    r'BRA|BEQ|BNE|BPL|BMI|BCC|BCS|BHI|BLS|BGE|BGT|BLE|BLT|BVC|BVS|'
    r'BSR|JSR|JMP|RTS|RTE|RTR|'
    r'LSL|LSR|ASL|ASR|ROL|ROR|ROXL|ROXR|'
    r'LEA|PEA|LINK|UNLK|'
    r'BTST|BSET|BCLR|BCHG|'
    r'SWAP|EXT|EXG|'
    r'MULU|MULS|DIVU|DIVS|'
    r'TRAP|NOP|STOP|RESET|'
    r'DBRA|DBF|DBEQ|DBNE)\b',
    re.IGNORECASE
)

# Match EVEN directive already present
EVEN_LINE = re.compile(r'^\s*EVEN\b', re.IGNORECASE)

# Match blank or comment-only lines
BLANK_OR_COMMENT = re.compile(r'^\s*$|^\s*;')

def count_dc_b_bytes(value_str):
    """Count how many bytes a DC.B line emits."""
    # Remove comments
    val = value_str.split(';')[0].strip()
    if not val:
        return 0
    parts = [p.strip() for p in val.split(',')]
    return len(parts)

def fix_even_alignment(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    fixes = 0
    byte_count = 0  # running count of DC.B bytes
    in_data_block = False
    pending_blanks = []  # blank/comment lines between data and code

    for i, line in enumerate(lines):
        # Check for DC.B
        m_dcb = DC_B_LINE.match(line)
        if m_dcb:
            # Flush any pending blanks
            new_lines.extend(pending_blanks)
            pending_blanks = []

            byte_count += count_dc_b_bytes(m_dcb.group(1))
            in_data_block = True
            new_lines.append(line)
            continue

        # Check for EVEN already present
        if EVEN_LINE.match(line):
            new_lines.extend(pending_blanks)
            pending_blanks = []
            byte_count = 0
            in_data_block = False
            new_lines.append(line)
            continue

        # Blank or comment line - buffer it
        if BLANK_OR_COMMENT.match(line):
            if in_data_block:
                pending_blanks.append(line)
                continue
            else:
                new_lines.append(line)
                continue

        # If we're in a data block and hit a label or instruction
        if in_data_block and (byte_count % 2 == 1):
            is_code = False
            # Check if this is a label followed by code, or an instruction
            if LABEL_LINE.match(line) or INSTR_LINE.match(line):
                is_code = True

            if is_code:
                # Insert EVEN before the pending blanks and label/instruction
                new_lines.append("    EVEN  ; FIX: alignment after odd-byte data\n")
                fixes += 1

        # Flush pending blanks
        new_lines.extend(pending_blanks)
        pending_blanks = []

        # Reset data tracking on non-data lines
        byte_count = 0
        in_data_block = False
        new_lines.append(line)

    # Flush any remaining
    new_lines.extend(pending_blanks)

    if fixes > 0:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.writelines(new_lines)

    return fixes

if __name__ == '__main__':
    total = 0
    bank_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'src', 'banks', 'generated')
    bank_dir = os.path.normpath(bank_dir)

    for f in sorted(glob.glob(os.path.join(bank_dir, 'bank_*_gen68k.asm'))):
        n = fix_even_alignment(f)
        if n > 0:
            print(f"  {os.path.basename(f)}: {n} EVEN directives inserted")
            total += n

    print(f"\nTotal EVEN alignment fixes: {total}")
