#!/usr/bin/env python3
"""
trace_analyzer.py — Zelda NES→Genesis Trace Log Analyzer
Parses BizHawk/BlastEm 68K trace logs and provides:
  1. PC hotspots (most-executed addresses)
  2. Loop detection (repeated PC sequences)
  3. BSR/JSR/RTS call stack reconstruction
  4. Address→label mapping from .asm source files
  5. Register tracking for specific addresses
  6. "Stuck point" detection (where execution spends most time)

Usage: python trace_analyzer.py <trace_log> [options]
"""

import sys
import re
import os
import io
from collections import Counter, defaultdict

# Force UTF-8 output on Windows
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')
sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding='utf-8', errors='replace')

# ── Config ──
PROJECT_DIR = os.path.dirname(os.path.abspath(__file__))
ASM_FILES = [
    "main.asm",
    "vdp_layer.asm",
    "bank_FF_gen68k_vdp.asm",
    "bank___BF50_BFF9_gen68k_vdp.asm",
    "bank_00_gen68k_vdp.asm",
    "bank_01_gen68k_vdp.asm",
    "bank_02_gen68k_vdp.asm",
    "bank_03_gen68k_vdp.asm",
    "bank_04_gen68k_vdp.asm",
    "bank_05_gen68k_vdp.asm",
    "bank_06_gen68k_vdp.asm",
    "bank_s1_gen68k_vdp.asm",
    "bank_s2_gen68k_vdp.asm",
]

# ── Trace line parser ──
# Format: "013CF4:  6502  bcs     $13CF8   A0:01FE5000 A1:..."
TRACE_RE = re.compile(
    r'^([0-9A-Fa-f]{6}):\s+([0-9A-Fa-f]+)\s+(\S+)\s*(.*?)\s+'
    r'A0:([0-9A-Fa-f]+)\s+A1:([0-9A-Fa-f]+)\s+A2:([0-9A-Fa-f]+)\s+'
    r'A3:([0-9A-Fa-f]+)\s+A4:([0-9A-Fa-f]+)\s+A5:([0-9A-Fa-f]+)\s+'
    r'A6:([0-9A-Fa-f]+)\s+A7:([0-9A-Fa-f]+)\s+'
    r'D0:([0-9A-Fa-f]+)\s+D1:([0-9A-Fa-f]+)\s+D2:([0-9A-Fa-f]+)\s+'
    r'D3:([0-9A-Fa-f]+)\s+D4:([0-9A-Fa-f]+)\s+D5:([0-9A-Fa-f]+)\s+'
    r'D6:([0-9A-Fa-f]+)\s+D7:([0-9A-Fa-f]+)\s+'
    r'SR:([0-9A-Fa-f]+)'
)

def parse_trace_line(line):
    """Parse a single trace line, return dict or None"""
    m = TRACE_RE.match(line)
    if not m:
        return None
    g = m.groups()
    return {
        'pc': int(g[0], 16),
        'opcode': g[1],
        'mnemonic': g[2].lower(),
        'operands': g[3].strip(),
        'A': [int(g[4+i], 16) for i in range(8)],
        'D': [int(g[12+i], 16) for i in range(8)],
        'SR': int(g[20], 16),
        'raw': line.rstrip(),
    }


def build_label_map():
    """
    Scan all .asm files for labels and build a rough PC→label index.
    Since we don't have a listing file, we extract labels and estimate their
    ROM addresses by simulating ORG directives and counting instructions.

    Returns dict: label_name → estimated_address (or None if unknown)
    Also returns list of (label_name, asm_file, line_number)
    """
    labels = []
    label_re = re.compile(r'^([A-Za-z_][A-Za-z0-9_]*):')

    for fname in ASM_FILES:
        path = os.path.join(PROJECT_DIR, fname)
        if not os.path.exists(path):
            continue
        with open(path, 'r', errors='replace') as f:
            for lineno, line in enumerate(f, 1):
                m = label_re.match(line)
                if m:
                    lname = m.group(1)
                    labels.append((lname, fname, lineno))

    return labels


def build_label_map_from_rom(rom_path):
    """
    Build PC→label map by searching the ROM for known label references.
    Uses the orig address comments in _vdp.asm files.

    Returns dict: pc_hex → label_name (nearest label at or before that address)
    """
    # Parse orig address comments from _vdp.asm files
    # Format: "; orig: ... 0x013CF4 ..." or label line like "sub_E5E2_jump..."
    addr_to_label = {}

    # Method 1: Extract sub_0x* labels which contain the original NES address
    sub_re = re.compile(r'^(sub_0x([0-9A-Fa-f]+)\S*|ofs_0x([0-9A-Fa-f]+)\S*|vec_0x([0-9A-Fa-f]+)\S*):')

    for fname in ASM_FILES:
        path = os.path.join(PROJECT_DIR, fname)
        if not os.path.exists(path):
            continue
        with open(path, 'r', errors='replace') as f:
            for line in f:
                m = sub_re.match(line)
                if m:
                    label = m.group(0).rstrip(':')
                    # Extract hex address from the label name
                    hex_match = re.search(r'0x([0-9A-Fa-f]+)', label)
                    if hex_match:
                        addr = int(hex_match.group(1), 16)
                        addr_to_label[addr] = label

    return addr_to_label


def find_label_for_pc(pc, addr_to_label):
    """Find the nearest label at or before the given PC address"""
    if pc in addr_to_label:
        return addr_to_label[pc]

    # Find nearest label before this PC
    best_addr = None
    best_label = None
    for addr, label in addr_to_label.items():
        if addr <= pc:
            if best_addr is None or addr > best_addr:
                best_addr = addr
                best_label = label

    if best_label and (pc - best_addr) < 0x200:  # within ~512 bytes
        return f"{best_label}+${pc - best_addr:X}"

    return f"$_{pc:06X}"


def analyze_trace(log_path, max_lines=None):
    """Main analysis function"""
    print(f"═══════════════════════════════════════════════════════")
    print(f"  ZELDA GENESIS TRACE ANALYZER")
    print(f"  Log: {log_path}")
    print(f"═══════════════════════════════════════════════════════\n")

    # ── Parse all lines ──
    entries = []
    line_count = 0
    with open(log_path, 'r', errors='replace') as f:
        for line in f:
            line_count += 1
            if line_count == 1 and line.startswith('M68K:'):
                continue  # skip header
            if max_lines and len(entries) >= max_lines:
                break
            entry = parse_trace_line(line)
            if entry:
                entries.append(entry)

    total = len(entries)
    print(f"Parsed {total:,} trace entries from {line_count:,} lines\n")

    if total == 0:
        print("ERROR: No valid trace entries found!")
        return

    # ── 1. PC Hotspot Analysis ──
    print("═══ TOP 20 PC HOTSPOTS (most-executed addresses) ═══")
    pc_counts = Counter(e['pc'] for e in entries)
    top_pcs = pc_counts.most_common(20)

    addr_labels = build_label_map_from_rom(None)

    for pc, count in top_pcs:
        pct = 100.0 * count / total
        label = find_label_for_pc(pc, addr_labels)
        # Get the mnemonic at this PC
        for e in entries:
            if e['pc'] == pc:
                mnem = f"{e['mnemonic']} {e['operands']}"
                break
        print(f"  ${pc:06X}: {count:>6}x ({pct:5.1f}%) | {mnem:<30s} | {label}")

    # ── 2. Function Call Analysis (BSR/JSR/RTS) ──
    print(f"\n═══ FUNCTION CALL ANALYSIS ═══")
    call_targets = Counter()
    call_stack = []
    max_depth = 0

    for e in entries:
        if e['mnemonic'] in ('bsr', 'jsr'):
            # Extract target address from operands
            ops = e['operands']
            target_match = re.search(r'\$([0-9A-Fa-f]+)', ops)
            if target_match:
                target = int(target_match.group(1), 16)
                call_targets[target] += 1
                call_stack.append(target)
                if len(call_stack) > max_depth:
                    max_depth = len(call_stack)
        elif e['mnemonic'] == 'rts' and call_stack:
            call_stack.pop()

    print(f"  Max call depth: {max_depth}")
    print(f"\n  Top 15 called functions:")
    for target, count in call_targets.most_common(15):
        label = find_label_for_pc(target, addr_labels)
        print(f"    ${target:06X}: {count:>5}x calls | {label}")

    # ── 3. Loop Detection ──
    print(f"\n═══ LOOP DETECTION ═══")
    # Find backward branches (loops)
    backward_branches = Counter()
    for e in entries:
        if e['mnemonic'].startswith('b') and e['mnemonic'] not in ('bsr', 'btst', 'bclr', 'bset', 'bchg'):
            ops = e['operands']
            target_match = re.search(r'\$([0-9A-Fa-f]+)', ops)
            if target_match:
                target = int(target_match.group(1), 16)
                if target <= e['pc']:  # backward branch = loop
                    backward_branches[(e['pc'], target)] += 1

    print(f"  Backward branches (loops) found: {len(backward_branches)}")
    print(f"\n  Top 10 hottest loops:")
    for (branch_pc, target_pc), count in backward_branches.most_common(10):
        span = branch_pc - target_pc
        label = find_label_for_pc(target_pc, addr_labels)
        print(f"    ${branch_pc:06X} → ${target_pc:06X} ({span} bytes): {count:>5}x | {label}")

    # ── 4. Execution Flow Summary ──
    print(f"\n═══ EXECUTION FLOW ═══")
    # Show unique PC ranges visited (what sections of ROM were executed)
    all_pcs = sorted(set(e['pc'] for e in entries))

    # Group into contiguous ranges
    ranges = []
    if all_pcs:
        start = all_pcs[0]
        end = all_pcs[0]
        for pc in all_pcs[1:]:
            if pc - end <= 8:  # within 8 bytes = same block
                end = pc
            else:
                ranges.append((start, end))
                start = pc
                end = pc
        ranges.append((start, end))

    print(f"  Unique PCs visited: {len(all_pcs)}")
    print(f"  Code regions executed: {len(ranges)}")
    for start, end in ranges:
        size = end - start
        label = find_label_for_pc(start, addr_labels)
        # Count how many trace entries are in this range
        range_count = sum(1 for e in entries if start <= e['pc'] <= end)
        pct = 100.0 * range_count / total
        print(f"    ${start:06X}-${end:06X} ({size:>5} bytes): {range_count:>6} entries ({pct:5.1f}%) | {label}")

    # ── 5. Stuck Point Detection ──
    print(f"\n═══ STUCK POINT ANALYSIS ═══")
    # Look at the last 10% of the trace to see what's repeating
    tail_start = int(total * 0.9)
    tail = entries[tail_start:]
    tail_pcs = Counter(e['pc'] for e in tail)

    print(f"  Last 10% of trace ({len(tail)} entries):")
    for pc, count in tail_pcs.most_common(10):
        pct = 100.0 * count / len(tail)
        label = find_label_for_pc(pc, addr_labels)
        for e in tail:
            if e['pc'] == pc:
                mnem = f"{e['mnemonic']} {e['operands']}"
                break
        print(f"    ${pc:06X}: {count:>5}x ({pct:5.1f}%) | {mnem:<30s} | {label}")

    # ── 6. Register Value Tracking at Key Points ──
    print(f"\n═══ REGISTER TRACKING AT LOOP HEAD ═══")
    # Find the most common loop head and track registers there
    if backward_branches:
        hottest_loop = backward_branches.most_common(1)[0]
        (branch_pc, loop_head), _ = hottest_loop

        print(f"  Tracking registers at loop head ${loop_head:06X}:")
        d1_vals = []
        d2_vals = []
        a0_vals = []

        for e in entries:
            if e['pc'] == loop_head:
                d1_vals.append(e['D'][1])
                d2_vals.append(e['D'][2])
                a0_vals.append(e['A'][0])

        if d1_vals:
            print(f"  D1 (counter): first={d1_vals[0]:08X}, last={d1_vals[-1]:08X}, "
                  f"min={min(d1_vals):08X}, max={max(d1_vals):08X}, samples={len(d1_vals)}")
            # Show if it's counting down
            if len(d1_vals) > 1:
                if all(d1_vals[i] >= d1_vals[i+1] for i in range(min(20, len(d1_vals)-1))):
                    print(f"    → D1 is COUNTING DOWN (will reach 0 after {d1_vals[0] & 0xFF} more iterations)")
                elif all(d1_vals[i] <= d1_vals[i+1] for i in range(min(20, len(d1_vals)-1))):
                    print(f"    → D1 is COUNTING UP")
                else:
                    print(f"    → D1 is non-monotonic (resets in outer loop)")
                    # Show unique D1 values to understand the pattern
                    unique_d1 = sorted(set(d1_vals))
                    if len(unique_d1) <= 30:
                        print(f"    → Unique D1 values: {[f'${v:02X}' for v in unique_d1]}")

        if d2_vals:
            print(f"  D2 (index):   first={d2_vals[0]:08X}, last={d2_vals[-1]:08X}, "
                  f"min={min(d2_vals):08X}, max={max(d2_vals):08X}")

        if a0_vals:
            unique_a0 = sorted(set(a0_vals))
            print(f"  A0 (pointer): {len(unique_a0)} unique values")
            for v in unique_a0[:10]:
                print(f"    ${v:08X}")

    # ── 7. First/Last trace entry ──
    print(f"\n═══ FIRST AND LAST ENTRIES ═══")
    print(f"  FIRST: PC=${entries[0]['pc']:06X} | {entries[0]['mnemonic']} {entries[0]['operands']}")
    print(f"  LAST:  PC=${entries[-1]['pc']:06X} | {entries[-1]['mnemonic']} {entries[-1]['operands']}")
    print(f"  A7 (SP) at end: ${entries[-1]['A'][7]:08X}")
    print(f"  SR at end: ${entries[-1]['SR']:04X}")

    # ── 8. VDP Write Analysis ──
    print(f"\n═══ VDP WRITE ANALYSIS ═══")
    vdp_data_writes = 0
    vdp_ctrl_writes = 0
    vdp_data_values = Counter()

    for e in entries:
        if 'move' in e['mnemonic'] and '$C00000' in e['operands']:
            if '($C00000)' in e['operands'] and e['operands'].index('($C00000)') > 0:
                # Write TO VDP data port: "move.w D3, ($C00000)"
                vdp_data_writes += 1
                vdp_data_values[e['D'][3] & 0xFFFF] += 1
        if 'move' in e['mnemonic'] and '$C00004' in e['operands']:
            if '($C00004)' in e['operands'] and e['operands'].index('($C00004)') > 0:
                vdp_ctrl_writes += 1

    print(f"  VDP data port writes ($C00000): {vdp_data_writes}")
    print(f"  VDP control port writes ($C00004): {vdp_ctrl_writes}")
    if vdp_data_values:
        print(f"  Top data values written:")
        for val, count in vdp_data_values.most_common(10):
            print(f"    ${val:04X}: {count}x")

    # ── 9. VDP Control Port Commands ──
    if vdp_ctrl_writes > 0:
        print(f"\n═══ VDP CONTROL COMMANDS ═══")
        ctrl_values = []
        for e in entries:
            if 'move' in e['mnemonic'] and '$C00004' in e['operands']:
                ops = e['operands']
                if '($C00004)' in ops and ops.index('($C00004)') > 0:
                    # The value being written is typically from D3 or an immediate
                    # Let's track what was written
                    ctrl_values.append(e['D'][3] & 0xFFFF)

        ctrl_counter = Counter(ctrl_values)
        print(f"  Unique control values: {len(ctrl_counter)}")
        for val, count in ctrl_counter.most_common(20):
            # Decode VDP command
            if val >= 0x8000:
                reg = (val >> 8) & 0x1F
                data = val & 0xFF
                print(f"    ${val:04X}: reg {reg:2d} = ${data:02X} ({count}x)")
            else:
                print(f"    ${val:04X}: VRAM cmd ({count}x)")

    # ── 10. Chronological Flow (first occurrence of each unique PC) ──
    print(f"\n═══ EXECUTION ORDER (first visit to each PC range) ═══")
    seen_ranges = []
    seen_pcs = set()
    current_range_start = None
    current_range_end = None

    for e in entries[:5000]:  # First 5000 entries
        pc = e['pc']
        if pc not in seen_pcs:
            seen_pcs.add(pc)
            if current_range_start is None:
                current_range_start = pc
                current_range_end = pc
            elif abs(pc - current_range_end) <= 16:
                current_range_end = max(current_range_end, pc)
            else:
                seen_ranges.append((current_range_start, current_range_end))
                current_range_start = pc
                current_range_end = pc

    if current_range_start is not None:
        seen_ranges.append((current_range_start, current_range_end))

    print(f"  Code regions visited in order (first 5000 entries):")
    for i, (start, end) in enumerate(seen_ranges[:30]):
        label = find_label_for_pc(start, addr_labels)
        print(f"    {i+1:3d}. ${start:06X}-${end:06X} | {label}")

    print(f"\n═══ ANALYSIS COMPLETE ═══")


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python trace_analyzer.py <trace_log.log>")
        print("       python trace_analyzer.py <trace_log.log> --max-lines 10000")
        sys.exit(1)

    log_path = sys.argv[1]
    max_lines = None

    if '--max-lines' in sys.argv:
        idx = sys.argv.index('--max-lines')
        if idx + 1 < len(sys.argv):
            max_lines = int(sys.argv[idx + 1])

    if not os.path.exists(log_path):
        print(f"ERROR: Log file not found: {log_path}")
        sys.exit(1)

    analyze_trace(log_path, max_lines)
