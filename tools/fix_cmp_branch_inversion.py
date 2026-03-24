#!/usr/bin/env python3
"""
fix_cmp_branch_inversion.py - Fix BCC/BCS inversions after CMPI.B instructions.

NES 6502 CMP semantics:
  CMP sets C=1 if A >= value, C=0 if A < value
  BCC = branch if C=0 = branch if A < value
  BCS = branch if C=1 = branch if A >= value

M68K CMPI semantics (CMPI.B #imm,Dn computes Dn - imm):
  C=0 if Dn >= imm (no borrow)
  C=1 if Dn < imm (borrow)
  BCC = branch if C=0 = branch if Dn >= imm
  BCS = branch if C=1 = branch if Dn < imm

Therefore:
  NES BCC after CMP (A < imm) -> 68K BCS after CMPI
  NES BCS after CMP (A >= imm) -> 68K BCC after CMPI

The translator did NOT invert these. This script fixes all un-inverted instances.
Only fixes lines where the orig comment confirms the NES branch type matches
the current 68K branch type (proving it was directly translated without inversion).
Skips lines that already have "FIX" in the comment.
"""

import re
import glob
import os

# Match CMPI.B #$XX,D[0-7] or CMPI.B #con_xxx,D[0-7] or CMP.B xxx,D[0-7]
# All originate from NES CMP/CPX/CPY which have inverted carry semantics vs 68K
CMPI_PATTERN = re.compile(
    r'^\s*CMP(?:I)?\.B\s+'
)

# Match BCC/BCS with orig comment showing the same branch type (uninverted)
BCC_UNINVERTED = re.compile(
    r'^(\s*)(BCC)\s+(\S+)\s+(;\s*BCC\s*;.*orig:.*BCC.*)$'
)
BCS_UNINVERTED = re.compile(
    r'^(\s*)(BCS)\s+(\S+)\s+(;\s*BCS\s*;.*orig:.*BCS.*)$'
)

# Skip already-fixed lines
FIX_MARKER = re.compile(r'FIX')

def fix_cmp_branch_inversion(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    fixes = 0
    cmpi_seen = False
    gap_count = 0

    for line in lines:
        # Detect CMPI.B line
        if CMPI_PATTERN.search(line):
            cmpi_seen = True
            gap_count = 0
            new_lines.append(line)
            continue

        if cmpi_seen:
            # Allow up to 1 blank/comment line between CMPI and branch
            stripped = line.strip()
            if stripped == '' or stripped.startswith(';'):
                gap_count += 1
                if gap_count <= 1:
                    new_lines.append(line)
                    continue
                else:
                    cmpi_seen = False
                    new_lines.append(line)
                    continue

            # Check for uninverted BCC (should be BCS)
            m_bcc = BCC_UNINVERTED.match(line)
            if m_bcc and not FIX_MARKER.search(line):
                indent = m_bcc.group(1)
                target = m_bcc.group(3)
                comment = m_bcc.group(4)
                new_comment = comment.replace('; BCC ;', '; FIX: BCC->BCS (NES BCC after CMP = 68K BCS) ;', 1)
                new_line = f"{indent}BCS     {target}             {new_comment}\n"
                new_lines.append(new_line)
                fixes += 1
                cmpi_seen = False
                continue

            # Check for uninverted BCS (should be BCC)
            m_bcs = BCS_UNINVERTED.match(line)
            if m_bcs and not FIX_MARKER.search(line):
                indent = m_bcs.group(1)
                target = m_bcs.group(3)
                comment = m_bcs.group(4)
                new_comment = comment.replace('; BCS ;', '; FIX: BCS->BCC (NES BCS after CMP = 68K BCC) ;', 1)
                new_line = f"{indent}BCC     {target}             {new_comment}\n"
                new_lines.append(new_line)
                fixes += 1
                cmpi_seen = False
                continue

            # Not a matching branch - reset
            cmpi_seen = False

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
        n = fix_cmp_branch_inversion(f)
        if n > 0:
            print(f"  {os.path.basename(f)}: {n} BCC/BCS inversions fixed")
            total += n

    print(f"\nTotal CMP branch inversions fixed: {total}")
