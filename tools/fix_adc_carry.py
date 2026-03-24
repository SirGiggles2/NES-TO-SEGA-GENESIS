#!/usr/bin/env python3
"""Fix ADC instructions that need carry (X flag) on 68K.

NES ADC adds A + immediate + carry_flag.
68K ADD.B ignores the X flag - only ADDX uses it.

This script finds patterns like:
  ADD.B  #$XX,D0  ; ADC imm (uses X flag for carry)
and converts them to use ADDX where the carry matters.

Cases where carry is provably 0 (after CLC, or after logic ops) are left as ADD.
Only converts when "ADC imm (uses X flag for carry)" appears in the comment
AND the preceding instruction could set carry (ASL, ROL, ADC, SBC, CMP, etc.)

SPECIAL CASE: ADC #$00 (add carry only) is ALWAYS converted to ADDX,
because the only reason to write ADC #$00 is to propagate carry.
"""
import re, sys, glob, os

def get_files():
    if len(sys.argv) > 1:
        return [sys.argv[1]]
    script_dir = os.path.dirname(os.path.abspath(__file__))
    vdp_dir = os.path.join(script_dir, '..', 'src', 'banks', 'generated_vdp')
    return sorted(glob.glob(os.path.join(vdp_dir, '*.asm')))

# Pattern: ADD.B #$XX,D0 with "ADC imm (uses X flag for carry)" comment
adc_pattern = re.compile(
    r'^(\s+)ADD\.B\s+#\$([0-9A-Fa-f]+),D(\d)\s+;\s*ADC imm \(uses X flag for carry\)'
)

# Instructions that clear carry (making ADC = ADD, so no fix needed)
carry_clear_patterns = [
    r'ANDI\s+#\$FFFE,SR',  # CLC specifically
    r'ANDI\.',   # AND clears carry on 68K
]

# Instructions that set/use carry (making the ADC carry significant)
carry_set_patterns = [
    r'ASL\.',     # shift left, carry = bit 7
    r'LSR\.',     # shift right, carry = bit 0
    r'ROL\.',     # rotate left through carry
    r'ROR\.',     # rotate right through carry
    r'ROXL\.',    # rotate through extend
    r'ROXR\.',    # rotate through extend
    r'ADD\.',     # ADD sets carry on overflow
    r'ADDI\.',    # ADDI sets carry
    r'ADDX\.',    # ADDX sets carry
    r'SUB\.',     # SUB sets carry (borrow)
    r'SUBI\.',    # SUBI sets carry
    r'SUBQ\.',    # SUBQ sets carry
    r'CMPI?\.',   # CMP sets carry
    r'BSR\s',     # subroutine may return carry
    r'JSR\s',     # subroutine may return carry
]

total_fixed = 0
for filepath in get_files():
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    fname = os.path.basename(filepath)
    fixed = 0

    for i in range(len(lines)):
        m = adc_pattern.match(lines[i])
        if not m:
            continue

        # Skip if already fixed (ADDX on adjacent line)
        if i > 0 and 'ADDX.B' in lines[i-1]:
            continue

        indent = m.group(1)
        imm_val = m.group(2)
        dreg = m.group(3)

        is_adc_zero = (int(imm_val, 16) == 0)

        # ADC #$00 ALWAYS needs carry - that's its entire purpose
        if is_adc_zero:
            carry_might_be_set = True
            carry_provably_clear = False
        else:
            # Look back to see if carry could be set
            carry_might_be_set = False
            carry_provably_clear = False

            for j in range(i-1, max(-1, i-20), -1):
                if j < 0:
                    break
                pline = lines[j].strip()
                if not pline or pline.endswith(':') or pline.startswith(';'):
                    continue

                # Check for carry-clearing instructions
                for pat in carry_clear_patterns:
                    if re.search(pat, pline):
                        carry_provably_clear = True
                        break
                if carry_provably_clear:
                    break

                # Check for carry-setting instructions
                for pat in carry_set_patterns:
                    if re.search(pat, pline):
                        carry_might_be_set = True
                        break
                if carry_might_be_set:
                    break

                # BCS/BCC: if we fell through BCS, carry is clear; if through BCC, carry is set
                if re.match(r'^\s+BCS\s', pline):
                    carry_provably_clear = True  # we didn't branch, so carry was clear
                    break
                if re.match(r'^\s+BCC\s', pline):
                    carry_might_be_set = True
                    break

                # MOVE/MOVEA/PHP/PLP don't affect carry, keep looking
                if re.match(r'^\s+MOVE', pline):
                    continue

                # Other instructions - be conservative
                break

        if carry_provably_clear:
            continue  # ADD.B is fine

        if not carry_might_be_set:
            continue  # Can't determine, leave as is

        # Fix: replace ADD.B #$XX,Dn with MOVEQ/MOVE.B + ADDX.B
        if int(imm_val, 16) == 0:
            # ADC #$00 = add carry only
            new_lines = '{}MOVEQ   #0,D3             ; FIX: ADC #$00 = add carry only\n'.format(indent)
            new_lines += '{}ADDX.B  D3,D{}             ; D{} += 0 + X_flag  ; orig: ADC #$00\n'.format(indent, dreg, dreg)
        elif int(imm_val, 16) <= 0x7F:
            # Can use MOVEQ for values 0-127
            new_lines = '{}MOVEQ   #${},D3       ; FIX: ADC #{} needs carry\n'.format(indent, imm_val, imm_val)
            new_lines += '{}ADDX.B  D3,D{}         ; D{} += ${} + X_flag  ; orig: ADC #${}\n'.format(indent, dreg, dreg, imm_val, imm_val)
        else:
            # Need MOVE.B for values > 127
            new_lines = '{}MOVE.B  #${},D3       ; FIX: ADC #{} needs carry\n'.format(indent, imm_val, imm_val)
            new_lines += '{}ADDX.B  D3,D{}         ; D{} += ${} + X_flag  ; orig: ADC #${}\n'.format(indent, dreg, dreg, imm_val, imm_val)

        lines[i] = new_lines
        fixed += 1
        print('  {} line {}: ADD.B #${},D{} -> ADDX.B (carry from preceding op)'.format(fname, i+1, imm_val, dreg))

    if fixed:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.writelines(lines)
        total_fixed += fixed

print('\nTotal: {} ADC-with-carry fixes applied'.format(total_fixed))
