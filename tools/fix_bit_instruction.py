#!/usr/bin/env python3
"""fix_bit_instruction.py - Fix NES BIT instruction translation.

NES BIT mem:
  - temp = A AND mem
  - Z = (temp == 0)
  - N = bit 7 of mem
  - V = bit 6 of mem

The auto-translator incorrectly used:
  BTST  D0,mem    ; tests bit NUMBER D0 in mem (wrong!)

Correct translation for BIT followed by BEQ/BNE (Z flag test):
  MOVE.B  D0,D3    ; save A
  AND.B   mem,D3   ; D3 = A AND mem, Z set correctly

For BIT followed by BMI/BPL (N flag test):
  MOVE.B  mem,D3   ; copy mem to temp, N set from bit 7

Only fixes lines with "; BIT abs" or "; BIT " comment marker.
Skips BTST with immediate operand (BTST #N,reg).
"""

import re
import glob
import os

def fix_bit_instructions(filepath):
    with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
        lines = f.readlines()

    fixes = 0
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]

        # Match: BTST    D0,mem  ; BIT abs  ; orig: ...
        # or:    BTST    D0,mem  ; BIT abs  ; orig: ... BIT ...
        m = re.match(
            r'^(\s+)BTST\s+(D\d+),(\S+)\s+;\s+BIT\s+abs\s+;\s+orig:\s*(.*)',
            line
        )
        if m:
            indent = m.group(1)
            reg = m.group(2)        # D0 typically
            mem = m.group(3)        # ram_xxxx or ($FFxxxx).l
            orig = m.group(4).rstrip()

            # Check what branch follows to determine which flag matters
            next_line = lines[i + 1] if i + 1 < len(lines) else ''
            next_stripped = next_line.strip()

            if re.match(r'B(EQ|NE)\s', next_stripped):
                # Z flag test: need AND
                new_lines.append(
                    f'{indent}MOVE.B  {reg},D3     ; FIX: BIT - save A for AND test\n'
                )
                new_lines.append(
                    f'{indent}AND.B   {mem},D3   ; Z = (A AND mem) == 0  ; orig: {orig}\n'
                )
                fixes += 1
            elif re.match(r'B(MI|PL)\s', next_stripped):
                # N flag test: need to check bit 7 of mem
                new_lines.append(
                    f'{indent}MOVE.B  {mem},D3   ; FIX: BIT - N from bit7 of mem  ; orig: {orig}\n'
                )
                # BMI/BPL will check N flag from MOVE.B result
                fixes += 1
            elif re.match(r'B(VS|VC)\s', next_stripped):
                # V flag test: complex - need BTST #6 of mem
                new_lines.append(
                    f'{indent}BTST    #6,{mem}   ; FIX: BIT - V from bit6 of mem  ; orig: {orig}\n'
                )
                # BTST sets Z = !bit6, but BVS/BVC checks V...
                # This case is rare and may need manual review
                new_lines.append(
                    f'{indent}; !! WARNING: BIT+BVS/BVC needs manual review\n'
                )
                fixes += 1
            else:
                # Unknown branch pattern - keep original but add warning
                new_lines.append(line)
                # Don't count as fix
            i += 1
            continue

        new_lines.append(line)
        i += 1

    if fixes > 0:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.writelines(new_lines)
        print(f"  {os.path.basename(filepath)}: {fixes} BIT fixes")

    return fixes

def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    root = os.path.dirname(script_dir)
    vdp_dir = os.path.join(root, 'src', 'banks', 'generated_vdp')

    total = 0
    for f in sorted(glob.glob(os.path.join(vdp_dir, '*.asm'))):
        total += fix_bit_instructions(f)

    print(f"\nTotal BIT fixes: {total}")

if __name__ == '__main__':
    main()
