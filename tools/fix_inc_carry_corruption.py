#!/usr/bin/env python3
"""Fix NES INC/DEC -> 68K ADDQ/SUBQ carry corruption.

NES INC/DEC only affect N and Z flags, NOT carry.
68K ADDQ/SUBQ affect ALL flags including carry and X.

Fix: Wrap ADDQ/SUBQ with MOVE SR,D6 / MOVE D6,CCR to preserve carry.
Only fixes cases where a carry-using instruction follows within a few lines.
"""
import re, sys, glob, os

def get_files():
    if len(sys.argv) > 1:
        return [sys.argv[1]]
    script_dir = os.path.dirname(os.path.abspath(__file__))
    vdp_dir = os.path.join(script_dir, '..', 'src', 'banks', 'generated_vdp')
    return sorted(glob.glob(os.path.join(vdp_dir, '*.asm')))

inc_dec_pattern = re.compile(r'^(\s+)(ADDQ\.B\s+#1,|SUBQ\.B\s+#1,)', re.IGNORECASE)
inc_dec_orig = re.compile(r'INC\s|DEC\s|INX|INY|DEX|DEY')
carry_users = re.compile(r'^\s+(ADD\.B\s+#\$00|ADDX\.B|BCC\s|BCS\s)', re.IGNORECASE)
carry_setters = re.compile(r'^\s+(CMPI?\.B|CMP\.B|ADDI\.B|ADD\.B|ASL\.B|LSR\.B)', re.IGNORECASE)

# Find groups of consecutive INC/DEC that need protection
total_fixed = 0
for filepath in get_files():
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    fname = os.path.basename(filepath)
    fixed = 0
    i = 0
    while i < len(lines):
        if not inc_dec_pattern.match(lines[i]) or not inc_dec_orig.search(lines[i]):
            i += 1
            continue

        # Already fixed?
        if i > 0 and 'MOVE    SR,D6' in lines[i-1]:
            i += 1
            continue

        # Find the end of consecutive INC/DEC operations
        group_start = i
        group_end = i
        while group_end + 1 < len(lines):
            next_line = lines[group_end + 1]
            if inc_dec_pattern.match(next_line) and inc_dec_orig.search(next_line):
                group_end += 1
            else:
                break

        # Look forward from group_end for carry user
        carry_user_found = False
        for j in range(group_end + 1, min(len(lines), group_end + 6)):
            pline = lines[j].strip()
            if not pline or pline.endswith(':') or pline.startswith(';'):
                continue
            if carry_users.match(lines[j]):
                carry_user_found = True
                break
            if carry_setters.match(lines[j]):
                break  # carry reset, no corruption

        if not carry_user_found:
            i = group_end + 1
            continue

        # Look backward for carry setter
        carry_setter_found = False
        for j in range(group_start - 1, max(-1, group_start - 8), -1):
            pline = lines[j].strip()
            if not pline or pline.endswith(':') or pline.startswith(';'):
                continue
            if carry_setters.match(lines[j]) or re.match(r'^\s+B(CC|CS)\s', lines[j]):
                carry_setter_found = True
                break

        if not carry_setter_found:
            i = group_end + 1
            continue

        # Apply fix: insert MOVE SR,D6 before group and MOVE D6,CCR after group
        indent = inc_dec_pattern.match(lines[group_start]).group(1)

        # Insert before the first INC/DEC
        save_line = '{}MOVE    SR,D6           ; FIX: save carry (NES INC/DEC preserves carry)\n'.format(indent)
        lines.insert(group_start, save_line)
        group_end += 1  # adjust for insertion

        # Find the carry user after the group and insert restore before it
        for j in range(group_end + 1, min(len(lines), group_end + 8)):
            pline = lines[j].strip()
            if not pline or pline.endswith(':') or pline.startswith(';'):
                continue
            if carry_users.match(lines[j]):
                restore_line = '{}MOVE    D6,CCR          ; FIX: restore carry for branch below\n'.format(indent)
                lines.insert(j, restore_line)
                break
            if carry_setters.match(lines[j]):
                break

        fixed += 1
        print('  {} lines {}-{}: protected INC/DEC group'.format(fname, group_start + 1, group_end + 1))
        i = group_end + 2  # skip past the group

    if fixed:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.writelines(lines)
    total_fixed += fixed

print('\nTotal: {} INC/DEC groups protected'.format(total_fixed))
