#!/usr/bin/env python3
"""
report.py - Scans all translated _gen68k.asm files and writes a summary report.txt
Run from the same folder as your translated files:
    python report.py
"""

import glob
import re
import os

output_lines = []
total_translated = 0
total_warnings = 0
total_unknown = 0
all_issues = []

files = sorted(glob.glob("*_gen68k.asm"))

if not files:
    print("No *_gen68k.asm files found! Make sure you ran the translator first.")
    exit(1)

output_lines.append("=" * 60)
output_lines.append("  NES -> GENESIS TRANSLATION REPORT")
output_lines.append("  Legend of Zelda")
output_lines.append("=" * 60)
output_lines.append("")

for filepath in files:
    filename = os.path.basename(filepath)
    translated = 0
    warnings = 0
    unknown = 0
    issues = []

    with open(filepath, 'r', encoding='utf-8') as f:
        for lineno, line in enumerate(f, 1):
            # Grab stats
            m = re.search(r'Translated:\s+(\d+)', line)
            if m:
                translated = int(m.group(1))
            m = re.search(r'Warnings:\s+(\d+)', line)
            if m:
                warnings = int(m.group(1))
            m = re.search(r'Unknown:\s+(\d+)', line)
            if m:
                unknown = int(m.group(1))

            # Grab any !! lines
            if '!!' in line:
                issues.append(f"  Line {lineno:4d}: {line.rstrip()}")

    total_translated += translated
    total_warnings += warnings
    total_unknown += unknown

    output_lines.append(f"FILE: {filename}")
    output_lines.append(f"  Translated:  {translated}")
    output_lines.append(f"  Warnings:    {warnings}")
    output_lines.append(f"  Unknown:     {unknown}")

    if issues:
        output_lines.append(f"  Issues ({len(issues)}):")
        for iss in issues[:20]:  # cap at 20 per file to keep it readable
            output_lines.append(iss)
        if len(issues) > 20:
            output_lines.append(f"  ... and {len(issues)-20} more")
    else:
        output_lines.append("  Issues: none!")

    output_lines.append("")

output_lines.append("=" * 60)
output_lines.append("TOTALS")
output_lines.append("=" * 60)
output_lines.append(f"  Files processed: {len(files)}")
output_lines.append(f"  Total translated instructions: {total_translated}")
output_lines.append(f"  Total warnings:  {total_warnings}")
output_lines.append(f"  Total unknown:   {total_unknown}")
output_lines.append("")
output_lines.append("Next step: review issues above and send to Claude for Phase 2!")

report_text = '\n'.join(output_lines)
print(report_text)

with open("report.txt", 'w', encoding='utf-8') as f:
    f.write(report_text)

print("\n(report also saved to report.txt)")
