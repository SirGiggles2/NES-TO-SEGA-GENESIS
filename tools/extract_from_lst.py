#!/usr/bin/env python3
"""Extract source files from a vasm .lst listing file."""
import re, os, sys

lst_path = sys.argv[1]
out_dir = sys.argv[2]
os.makedirs(out_dir, exist_ok=True)

with open(lst_path, 'r', encoding='utf-8', errors='replace') as f:
    lines = f.readlines()

current_file = None
file_lines = {}
source_re = re.compile(r'^Source:\s+"(.+?)"')
# Match: optional hex address, then TAB, then spaces, line number, colon, content
# e.g.: "02:00004938 4E71            \t  5906:     NOP"
# or:   "                            \t     5: "
line_re = re.compile(r'.*\t\s*(\d+):\s?(.*)')

for raw in lines:
    m_src = source_re.match(raw)
    if m_src:
        current_file = m_src.group(1)
        if current_file not in file_lines:
            file_lines[current_file] = {}
        continue
    if current_file:
        m_line = line_re.match(raw)
        if m_line:
            line_num = int(m_line.group(1))
            source = m_line.group(2)
            file_lines[current_file][line_num] = source

for fname, lines_dict in file_lines.items():
    if not lines_dict:
        continue
    max_line = max(lines_dict.keys())
    out_lines = []
    for i in range(1, max_line + 1):
        out_lines.append(lines_dict.get(i, '') + '\n')

    safe_name = os.path.basename(fname)
    out_path = os.path.join(out_dir, safe_name)
    with open(out_path, 'w', encoding='utf-8') as f:
        f.writelines(out_lines)
    print(f'  {safe_name}: {max_line} lines ({len(lines_dict)} non-empty)')

print(f'\nExtracted {len(file_lines)} files')
