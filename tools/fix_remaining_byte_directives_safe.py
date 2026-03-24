#!/usr/bin/env python3
"""Convert remaining commented .BYTE directives to DC.B,
but ONLY if they're not already covered by an AUTO-RESTORED block above.

Strategy: Track whether we're inside a region that already has data
(between AUTO-RESTORED BEGIN/END). If a .BYTE comment follows an
AUTO-RESTORED block with the same data, skip it (it's a duplicate).
If it's in a region with NO AUTO-RESTORED block, convert it.
"""
import re, sys

filepath = sys.argv[1]
with open(filepath, 'r', encoding='utf-8') as f:
    lines = f.readlines()

byte_pat = re.compile(
    r'^(\s*); \[DIRECTIVE\] \.BYTE ([\$0-9A-Fa-f,\s\+]+)\s+-- needs manual handling'
)

# First pass: identify which .BYTE directives are duplicates of AUTO-RESTORED blocks
# An AUTO-RESTORED block is followed by the same data as commented .BYTE lines
# We detect this by checking if a .BYTE comment appears after AUTO-RESTORED END

in_auto_restored = False
after_auto_restored = False
auto_restored_end_line = -1
fixed = 0
skipped = 0
out_lines = []

for i, line in enumerate(lines):
    if 'AUTO-RESTORED' in line and 'BEGIN' in line:
        in_auto_restored = True
        out_lines.append(line)
        continue
    if 'AUTO-RESTORED' in line and 'END' in line:
        in_auto_restored = False
        after_auto_restored = True
        auto_restored_end_line = i
        out_lines.append(line)
        continue

    m = byte_pat.match(line)
    if m:
        # If we're right after an AUTO-RESTORED block (within ~5 lines of blank/comment)
        # this is a duplicate - skip it
        if after_auto_restored and (i - auto_restored_end_line) < 200:
            # Keep as comment (it's a duplicate)
            out_lines.append(line)
            skipped += 1
            continue

        # Otherwise, this is genuinely missing data - convert it
        indent = m.group(1)
        raw_vals = m.group(2)
        if '+' in raw_vals:
            parts = raw_vals.split('+')
            total = 0
            for p in parts:
                p = p.strip().replace('$', '')
                if p:
                    total += int(p, 16)
            total &= 0xFF
            out_lines.append(f'{indent}DC.B ${total:02X}\n')
            fixed += 1
        else:
            hex_vals = re.findall(r'\$[0-9A-Fa-f]+', raw_vals)
            if hex_vals:
                dc_line = f'{indent}DC.B ' + ','.join(hex_vals) + '\n'
                out_lines.append(dc_line)
                fixed += 1
            else:
                out_lines.append(line)
    else:
        # Reset after_auto_restored if we hit a non-comment, non-blank line
        # that's not a .BYTE directive (i.e., actual code or a label)
        stripped = line.strip()
        if stripped and not stripped.startswith(';') and not stripped.startswith('DC.') and ':' in stripped:
            after_auto_restored = False
        out_lines.append(line)

with open(filepath, 'w', encoding='utf-8') as f:
    f.writelines(out_lines)

print(f'  {filepath.split("/")[-1].split(chr(92))[-1]}: fixed {fixed}, skipped {skipped} duplicates')
