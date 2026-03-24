#!/usr/bin/env python3
"""Convert remaining commented .BYTE directives to DC.B in a specific file."""
import re, sys

filepath = sys.argv[1]
with open(filepath, 'r', encoding='utf-8') as f:
    lines = f.readlines()

# Pattern: commented .BYTE with hex values
# e.g.: "    ; [DIRECTIVE] .BYTE $36, $0F, $00, $10  -- needs manual handling  ; orig: ..."
byte_pat = re.compile(
    r'^(\s*); \[DIRECTIVE\] \.BYTE ([\$0-9A-Fa-f,\s\+]+)\s+-- needs manual handling'
)

fixed = 0
out_lines = []
for line in lines:
    m = byte_pat.match(line)
    if m:
        indent = m.group(1)
        raw_vals = m.group(2)
        # Handle .BYTE $80 + $00 + $00 format (evaluate sums)
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
            # Handle .BYTE $36, $0F, $00, $10 format
            hex_vals = re.findall(r'\$[0-9A-Fa-f]+', raw_vals)
            if hex_vals:
                dc_line = f'{indent}DC.B ' + ','.join(hex_vals) + '\n'
                out_lines.append(dc_line)
                fixed += 1
            else:
                out_lines.append(line)
    else:
        out_lines.append(line)

with open(filepath, 'w', encoding='utf-8') as f:
    f.writelines(out_lines)

print(f'Fixed {fixed} .BYTE directives in {filepath}')
