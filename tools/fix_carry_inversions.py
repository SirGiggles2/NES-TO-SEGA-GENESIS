#!/usr/bin/env python3
"""Fix BCC/BCS carry inversions after CMP/CMPI instructions.

NES 6502 vs 68K carry flag after CMP is INVERTED:
  NES: CMP sets C=1 if A >= imm (no borrow)
  68K: CMPI sets C=1 if Dn < imm (borrow occurred)

So: NES BCC ($90, branch if A < imm) -> 68K BCS (branch if carry set = Dn < imm)
    NES BCS ($B0, branch if A >= imm) -> 68K BCC (branch if carry clear = Dn >= imm)

This script fixes BCC/BCS that:
1. Follow a CMP/CMPI instruction (within 5 lines, no intervening shift/BSR/sub)
2. Have an orig comment containing the NES opcode byte (90 or B0)
3. The current 68K instruction MATCHES the NES mnemonic (i.e. NOT yet inverted)
4. Are NOT already marked as fixed (FIX v, CARRY-FIX, etc.)

LSR/ASL/ROL/ROR carry behavior is the same on both, so those are left alone.
BSR/JSR return carry from subroutines - those need case-by-case analysis, skip.
SUB/ADD affect carry differently - skip those too.
"""
import re, sys, glob, os

def get_files():
    if len(sys.argv) > 1:
        return [sys.argv[1]]
    script_dir = os.path.dirname(os.path.abspath(__file__))
    vdp_dir = os.path.join(script_dir, '..', 'src', 'banks', 'generated_vdp')
    return sorted(glob.glob(os.path.join(vdp_dir, '*.asm')))

total_fixed = 0
total_skipped = 0
for filepath in get_files():
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    fname = os.path.basename(filepath)
    fixed = 0
    skipped_already_fixed = 0

# Patterns that set carry DIFFERENTLY than CMP (skip these)
non_cmp_carry_setters = re.compile(
    r'^\s+(LSR|ASL|ROL|ROR|ROXL|ROXR|BSR|JSR|SUB|SUBI|ADD\.|ADDI|ADDX|SUBX|ADDQ|SUBQ|ORI\s+#\$0001)',
    re.IGNORECASE
)
# CMP/CMPI pattern
cmp_pattern = re.compile(
    r'^\s+(CMPI?\.(B|W|L)|CMP\s)',
    re.IGNORECASE
)

for i in range(len(lines)):
    line = lines[i]

    # Skip already-fixed lines
    if 'CARRY-FIX' in line or 'FIX v' in line or 'FIX:' in line or 'FIXED' in line:
        if 'BCC' in line or 'BCS' in line:
            skipped_already_fixed += 1
        continue

    # BROAD match: any BCC or BCS with an orig comment containing 90 or B0 opcode
    # Pattern 1: "BCC label ; BCC ; orig: ... 90 XX BCC"  (comment repeats NES mnemonic)
    # Pattern 2: "BCC label ; orig: ... 90 XX BCC"  (no mnemonic echo)
    # Pattern 3: "BCS label ; BCS ; orig: ... B0 XX BCS"
    # We look for the NES opcode byte (90 or B0) followed by a displacement byte
    # and then the NES mnemonic (BCC or BCS)

    # First check: is this a BCC or BCS line?
    branch_match = re.match(r'^(\s+)(BCC|BCS)\s+(\S+)', line)
    if not branch_match:
        continue

    indent = branch_match.group(1)
    current_inst = branch_match.group(2)
    target = branch_match.group(3)

    # Check for orig comment with NES opcode
    # Look for "90 XX BCC" or "B0 XX BCS" in the orig section
    orig_90 = re.search(r'\b90\s+[0-9A-Fa-f]{2}\s+BCC\b', line)
    orig_b0 = re.search(r'\bB0\s+[0-9A-Fa-f]{2}\s+BCS\b', line)

    if not orig_90 and not orig_b0:
        continue

    nes_opcode = '90' if orig_90 else 'B0'

    # Look back up to 5 lines for a CMP/CMPI, but abort if we hit
    # a non-CMP carry setter first
    has_cmp = False
    has_other_carry = False
    for j in range(i-1, max(-1, i-6), -1):
        if j < 0:
            break
        pline = lines[j]
        # Skip blank lines and labels
        pstripped = pline.strip()
        if not pstripped or pstripped.endswith(':') or pstripped.startswith(';'):
            continue

        if cmp_pattern.match(pline):
            has_cmp = True
            break
        if non_cmp_carry_setters.match(pline):
            has_other_carry = True
            break
        # MOVE/STA don't affect carry on 68K, so keep looking
        # But other instructions might - be conservative after 5 lines

    if not has_cmp or has_other_carry:
        continue

    # Determine correct 68K instruction
    if nes_opcode == '90':  # NES BCC -> 68K BCS
        correct_inst = 'BCS'
    else:  # NES BCS -> 68K BCC
        correct_inst = 'BCC'

    if current_inst == correct_inst:
        # Already correctly inverted
        continue

    # Fix: replace first occurrence of the instruction
    new_line = line.replace(f'{indent}{current_inst}', f'{indent}{correct_inst}', 1)

    # Add fix marker (avoid unicode for Windows console)
    new_line = new_line.rstrip('\n') + '  ; CARRY-FIX: NES ${} -> 68K {}\n'.format(nes_opcode, correct_inst)

    lines[i] = new_line
    fixed += 1
    # Print with safe ASCII
    print('  {} line {}: {} -> {} ({})'.format(fname, i+1, current_inst, correct_inst, target))

    if fixed:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.writelines(lines)
    total_fixed += fixed
    total_skipped += skipped_already_fixed

print('\nTotal: {} carry inversions fixed, {} already fixed'.format(total_fixed, total_skipped))
