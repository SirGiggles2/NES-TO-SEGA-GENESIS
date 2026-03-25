#!/usr/bin/env python3
"""
check_register_safety.py - Static analysis for 68000 register clobbering bugs
in src/bridge/vdp_layer.asm

Targeted safety net for the #1 recurring bug class: overwriting a register
that a caller depends on.

Checks:
  A. D3 clobber before PPU_NORMALIZE_NAMETABLE_ADDR calls
  B. High-risk D3/D4 writes from memory in dispatch chain functions
  C. movem.l push/pop balance
  D. Guard comment audit on critical workarounds
"""

import re
import sys
import os

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)
TARGET_FILE = os.path.join(PROJECT_ROOT, "src", "bridge", "vdp_layer.asm")
DISPLAY_PATH = "src/bridge/vdp_layer.asm"

# ---------------------------------------------------------------------------
# Known register contracts
# ---------------------------------------------------------------------------
DISPATCH_CHAIN_FUNCS = {
    "PPU_WRITE_NAMETABLE_BYTE",
    "PPU_WRITE_PATTERN_BYTE",
    "PPU_NORMALIZE_NAMETABLE_ADDR",
    "PPU_RENDER_NAMETABLE_CELL",
}

LIVE_REGISTERS = {
    "PPU_WRITE_NAMETABLE_BYTE": {"D3"},
    "PPU_WRITE_PATTERN_BYTE": {"D3"},
    "PPU_NORMALIZE_NAMETABLE_ADDR": {"D3"},
    "PPU_RENDER_NAMETABLE_CELL": {"D4"},
}

NORMALIZE_CALLERS = {"PPU_WRITE_NAMETABLE_BYTE", "PPU_BUFFER_NAMETABLE_READ"}

REQUIRED_GUARDS = [
    {
        "id": "tile-artifact-replace",
        "desc": "tile artifact replacement (00/08 -> $24)",
        "code_re": re.compile(r'#\$24,D0', re.IGNORECASE),
        "comment_keywords": ["GUARD", "artifact", "file_select_replace",
                             "file-select", "stale tile", "00/08"],
    },
    {
        "id": "sprite-y-hide",
        "desc": "sprite Y-hiding ($EF-$FF range)",
        "code_re": re.compile(r'#\$EF,D3', re.IGNORECASE),
        "comment_keywords": ["GUARD", "hide", "sprite", "EF", "offscreen"],
    },
    {
        "id": "h40-overflow-clear",
        "desc": "H40 overflow column clear (columns 32-39)",
        "code_re": re.compile(r'clear_overflow', re.IGNORECASE),
        "comment_keywords": ["GUARD", "H40", "overflow", "column 32",
                             "columns 32"],
    },
    {
        "id": "v490-sprite-pixel-pair",
        "desc": "v490 sprite pixel pair table",
        "code_re": re.compile(r'PPU_SPRITE_PIXEL_PAIR_TABLE', re.IGNORECASE),
        "comment_keywords": ["GUARD", "v490", "sprite.*pixel.*pair",
                             "shifted.*4"],
    },
]

# ---------------------------------------------------------------------------
# Regex patterns
# ---------------------------------------------------------------------------
RE_LABEL = re.compile(r'^([A-Za-z_]\w*)\s*:', re.IGNORECASE)
RE_LOCAL_LABEL = re.compile(r'^\.[A-Za-z_]\w*\s*:', re.IGNORECASE)
RE_BSR = re.compile(r'\b(?:bsr|jsr)\s+(\w+)', re.IGNORECASE)
RE_MOVEM_PUSH = re.compile(
    r'\bmovem\.l\s+([\w\-/]+)\s*,\s*-\(A7\)', re.IGNORECASE
)
RE_MOVEM_POP = re.compile(
    r'\bmovem\.l\s+\(A7\)\+\s*,\s*([\w\-/]+)', re.IGNORECASE
)
RE_RTS = re.compile(r'\b(rts|rte)\b', re.IGNORECASE)
RE_MOVE_FROM_MEM_DX = re.compile(
    r'\bmove\.[bwl]\s+\([^)]+\)(?:\.l)?\s*,\s*D([0-7])\b', re.IGNORECASE
)
RE_DC = re.compile(r'^\s+dc\.[bwl]\s', re.IGNORECASE)
RE_COMMENT_ONLY = re.compile(r'^\s*;')
RE_BLANK = re.compile(r'^\s*$')


def strip_comment(line):
    idx = line.find(';')
    return line[:idx] if idx >= 0 else line


def normalize_reglist(s):
    """Normalize a movem register list to a canonical sorted form."""
    regs = set()
    for part in s.strip().upper().split('/'):
        part = part.strip()
        if '-' in part:
            lo, hi = part.split('-', 1)
            prefix = lo[0]
            try:
                for i in range(int(lo[1:]), int(hi[1:]) + 1):
                    regs.add((prefix, i))
            except (ValueError, IndexError):
                regs.add(('?', 0))
        else:
            if len(part) >= 2 and part[1:].isdigit():
                regs.add((part[0], int(part[1:])))
    return '/'.join(f"{p}{n}" for p, n in sorted(regs))


def parse_functions(lines):
    """Return dict of {label: (start_0based, end_0based)}."""
    labels = []
    for i, line in enumerate(lines):
        if RE_LOCAL_LABEL.match(line):
            continue
        m = RE_LABEL.match(line)
        if m:
            labels.append((m.group(1), i))
    funcs = {}
    for idx, (name, start) in enumerate(labels):
        end = labels[idx + 1][1] - 1 if idx + 1 < len(labels) else len(lines) - 1
        funcs[name] = (start, end)
    return funcs


# ---------------------------------------------------------------------------
# Check A: D3 clobber before PPU_NORMALIZE_NAMETABLE_ADDR
# ---------------------------------------------------------------------------
def check_d3_clobber_before_normalize(lines, funcs):
    issues = []

    for func_name in NORMALIZE_CALLERS:
        if func_name not in funcs:
            continue
        start, end = funcs[func_name]

        # Find first BSR PPU_NORMALIZE_NAMETABLE_ADDR
        first_norm = None
        for i in range(start + 1, end + 1):
            instr = strip_comment(lines[i])
            m = RE_BSR.search(instr)
            if m and m.group(1).upper() == "PPU_NORMALIZE_NAMETABLE_ADDR":
                first_norm = i
                break

        if first_norm is None:
            continue

        # Scan entry to first normalize for D3 writes from memory
        for i in range(start + 1, first_norm):
            instr = strip_comment(lines[i]).strip()
            if not instr:
                continue
            m = RE_MOVE_FROM_MEM_DX.search(instr)
            if m and m.group(1) == '3':
                issues.append(("FAIL", i + 1, lines[i].strip(),
                               f"Inside {func_name}, D3 is LIVE (VRAM address) "
                               f"-- clobbered before PPU_NORMALIZE_NAMETABLE_ADDR "
                               f"call at line {first_norm + 1}"))

    return issues


# ---------------------------------------------------------------------------
# Check B: High-risk D3/D4 writes in dispatch chain
# ---------------------------------------------------------------------------
def check_high_risk_writes(lines, funcs):
    issues = []

    for func_name in DISPATCH_CHAIN_FUNCS:
        if func_name not in funcs:
            continue
        live = LIVE_REGISTERS.get(func_name, set())
        if not live:
            continue
        start, end = funcs[func_name]

        for i in range(start + 1, end + 1):
            raw = lines[i]
            if RE_DC.match(raw) or RE_COMMENT_ONLY.match(raw) or RE_BLANK.match(raw):
                continue
            instr = strip_comment(raw).strip()
            if not instr:
                continue
            m = RE_MOVE_FROM_MEM_DX.search(instr)
            if m:
                reg = f"D{m.group(1)}"
                if reg in live:
                    issues.append(("WARN", i + 1, raw.strip(),
                                   f"High-risk write to {reg} from memory "
                                   f"inside {func_name} (dispatch chain)"))

    return issues


# ---------------------------------------------------------------------------
# Check C: MOVEM balance
# ---------------------------------------------------------------------------
def check_movem_balance(lines, funcs):
    issues = []
    checked = 0

    for func_name, (start, end) in sorted(funcs.items(), key=lambda x: x[1][0]):
        pushes = []
        pops = []

        for i in range(start + 1, end + 1):
            instr = strip_comment(lines[i])
            mp = RE_MOVEM_PUSH.search(instr)
            if mp:
                pushes.append((i, normalize_reglist(mp.group(1))))
            mq = RE_MOVEM_POP.search(instr)
            if mq:
                pops.append((i, normalize_reglist(mq.group(1))))

        if not pushes and not pops:
            continue
        checked += 1

        # Pairing: match pushes to pops by register list.
        # Allow multiple pops per push (multi-exit functions).
        push_matched = [False] * len(pushes)
        pop_matched = [False] * len(pops)

        for pi, (pline, pregs) in enumerate(pushes):
            for qi, (qline, qregs) in enumerate(pops):
                if pregs == qregs and qline > pline:
                    push_matched[pi] = True
                    pop_matched[qi] = True

        for pi, matched in enumerate(push_matched):
            if not matched:
                pline, pregs = pushes[pi]
                issues.append(("FAIL", pline + 1, lines[pline].strip(),
                               f"In {func_name}: movem.l push of {pregs} "
                               f"has no matching pop"))

        for qi, matched in enumerate(pop_matched):
            if not matched:
                qline, qregs = pops[qi]
                issues.append(("FAIL", qline + 1, lines[qline].strip(),
                               f"In {func_name}: movem.l pop of {qregs} "
                               f"has no matching push"))

    return checked, issues


# ---------------------------------------------------------------------------
# Check D: Guard comment audit
# ---------------------------------------------------------------------------
def check_guard_comments(lines):
    issues = []

    for guard in REQUIRED_GUARDS:
        # Find the code implementing this workaround
        code_line = None
        for i, line in enumerate(lines):
            if guard["code_re"].search(strip_comment(line)):
                code_line = i
                break

        if code_line is None:
            issues.append(("WARN", None, "",
                           f"Missing workaround code for: {guard['desc']}"))
            continue

        # Check +/- 5 lines for a comment containing relevant keywords
        ctx_start = max(0, code_line - 5)
        ctx_end = min(len(lines), code_line + 6)
        context = '\n'.join(lines[ctx_start:ctx_end])

        has_guard = any(
            re.search(kw, context, re.IGNORECASE)
            for kw in guard["comment_keywords"]
        )

        if not has_guard:
            issues.append(("WARN", code_line + 1, lines[code_line].strip(),
                           f"Missing guard comment near {guard['desc']}"))

    return issues


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
def main():
    if not os.path.isfile(TARGET_FILE):
        print(f"ERROR: Cannot find {TARGET_FILE}")
        print("Run this script from the project's tools/ directory.")
        sys.exit(2)

    with open(TARGET_FILE, 'r', encoding='utf-8', errors='replace') as f:
        lines = f.read().splitlines()

    funcs = parse_functions(lines)

    # Collect all issues
    d3_issues = check_d3_clobber_before_normalize(lines, funcs)
    hr_issues = check_high_risk_writes(lines, funcs)
    movem_checked, movem_issues = check_movem_balance(lines, funcs)
    guard_issues = check_guard_comments(lines)

    # --- Output ---
    print("=== Register Safety Check ===")
    print(f"File: {DISPLAY_PATH}")
    print(f"Functions parsed: {len(funcs)}")
    print()

    # MOVEM balance
    if not movem_issues:
        print(f"[PASS] MOVEM balance: {movem_checked} functions checked, all balanced")
    else:
        for sev, line, text, detail in movem_issues:
            print(f"[{sev}] MOVEM issue at line {line}: {text}")
            print(f"       \u21b3 {detail}")

    # D3 clobber
    if not d3_issues:
        print("[PASS] D3 clobber check: no writes to D3 before normalize calls")
    for sev, line, text, detail in d3_issues:
        print(f"[{sev}] D3 clobber risk at line {line}: {text}")
        print(f"       \u21b3 {detail}")

    # High-risk writes
    if not hr_issues:
        print("[PASS] High-risk register writes: no suspicious D3/D4 writes "
              "in dispatch chain")
    for sev, line, text, detail in hr_issues:
        print(f"[{sev}] at line {line}: {text}")
        print(f"       \u21b3 {detail}")

    # Guard comments
    if not guard_issues:
        print("[PASS] Guard comments: all critical workarounds have "
              "nearby comments")
    for sev, line, text, detail in guard_issues:
        loc = f" at line {line}" if line else ""
        print(f"[{sev}] Missing guard comment{loc}")
        print(f"       \u21b3 {detail}")

    # Summary
    all_issues = d3_issues + hr_issues + movem_issues + guard_issues
    fail_count = sum(1 for i in all_issues if i[0] == "FAIL")
    warn_count = sum(1 for i in all_issues if i[0] == "WARN")
    print()
    print(f"Summary: {fail_count} failure(s), {warn_count} warning(s)")

    sys.exit(1 if fail_count > 0 else 0)


if __name__ == "__main__":
    main()
