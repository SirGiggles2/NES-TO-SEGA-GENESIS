#!/usr/bin/env python3
"""Find places where 68K ADDQ/SUBQ (NES INC/DEC) corrupts carry
that a subsequent ADC/SBC/BCC/BCS relies on.

NES INC/DEC only affect N and Z flags, NOT carry.
68K ADDQ/SUBQ affect ALL flags including carry and X.

This can corrupt:
1. ADC that follows INC (carry from prior ADD/ADC/CMP lost)
2. BCC/BCS that follows INC (carry from prior CMP lost)
"""
import re, sys

filepath = sys.argv[1]
with open(filepath, 'r', encoding='utf-8') as f:
    lines = f.readlines()

# NES INC/DEC translated to 68K ADDQ/SUBQ
inc_dec_pattern = re.compile(
    r'^\s+ADDQ\.B\s+#1,|^\s+SUBQ\.B\s+#1,',
    re.IGNORECASE
)

# Instructions that USE carry (and would be affected)
carry_users = re.compile(
    r'^\s+(ADD\.B\s+#\$00|ADDX\.B|BCC\s|BCS\s)',
    re.IGNORECASE
)

# Instructions that SET carry (the source that INC would corrupt)
carry_setters = re.compile(
    r'^\s+(CMPI?\.B|CMP\.B|ADDI\.B|ADD\.B|ASL\.B|LSR\.B)',
    re.IGNORECASE
)

# Check for orig comment indicating INC or DEC
inc_dec_orig = re.compile(r'INC\s|DEC\s|INX|INY|DEX|DEY')

found = 0
for i in range(len(lines)):
    if not inc_dec_pattern.match(lines[i]):
        continue
    # Verify it's a NES INC/DEC (not a genuine 68K add)
    if not inc_dec_orig.search(lines[i]):
        continue

    # Look forward up to 5 lines for a carry user
    carry_user_line = -1
    for j in range(i+1, min(len(lines), i+6)):
        pline = lines[j].strip()
        if not pline or pline.endswith(':') or pline.startswith(';'):
            continue
        if carry_users.match(lines[j]):
            carry_user_line = j
            break
        # If we hit another carry-setter, it resets carry, no corruption
        if carry_setters.match(lines[j]):
            break

    if carry_user_line < 0:
        continue

    # Look backward from the INC for a carry setter
    carry_setter_line = -1
    for j in range(i-1, max(-1, i-8), -1):
        pline = lines[j].strip()
        if not pline or pline.endswith(':') or pline.startswith(';'):
            continue
        if carry_setters.match(lines[j]):
            carry_setter_line = j
            break
        # BCC/BCS also imply carry was from something before
        if re.match(r'^\s+B(CC|CS)\s', lines[j]):
            carry_setter_line = j
            break

    if carry_setter_line < 0:
        continue

    # Skip if already has a FIX comment or MOVE SR,D6 on preceding line
    if 'FIX:' in lines[i] or 'CARRY-FIX' in lines[i]:
        continue
    if i > 0 and 'MOVE    SR,D6' in lines[i-1]:
        continue

    found += 1
    print('  Line {}: INC/DEC may corrupt carry'.format(i+1))
    print('    Setter at {}: {}'.format(carry_setter_line+1, lines[carry_setter_line].strip()[:80]))
    print('    INC/DEC at {}: {}'.format(i+1, lines[i].strip()[:80]))
    print('    User at   {}: {}'.format(carry_user_line+1, lines[carry_user_line].strip()[:80]))
    print()

print('Total: {} potential INC/DEC carry corruption sites'.format(found))
