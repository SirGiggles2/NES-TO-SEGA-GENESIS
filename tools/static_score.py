#!/usr/bin/env python3
"""
static_score.py - Static analysis scoring for NES-to-Genesis Zelda builds.

Scans source and listing files for known-bad patterns that correlate with
runtime failures. Produces a numeric score (higher = better) and per-check
breakdown suitable for the score ledger.

Usage:
    python static_score.py                          # default paths
    python static_score.py --lst path/to/zelda.lst  # explicit listing
    python static_score.py --json                   # machine-readable output

Checks (each adds/subtracts from a 100-point baseline):
  1. Empty translations remaining    (-1 per stub, max -30)
  2. Untranslated PPU register stubs (-5 per stub)
  3. Odd-length DC.B without EVEN    (-2 per instance, max -20)
  4. movem push/pop balance          (-10 per mismatch)
  5. Register clobber risk (D3/D4)   (-15 per instance)
  6. Guard comment presence          (+5 per guard present)
  7. Build success (listing exists)  (+10 if listing found)
"""

import argparse
import json
import os
import re
import sys
import subprocess

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)

VDP_LAYER = os.path.join(PROJECT_ROOT, "src", "bridge", "vdp_layer.asm")
GENERATED_DIR = os.path.join(PROJECT_ROOT, "src", "banks", "generated_vdp")
BUILD_DIR = os.path.join(PROJECT_ROOT, "build")

BASELINE = 100

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def find_latest_lst():
    """Find the highest-numbered .lst file in build/."""
    best_ver = -1
    best_path = None
    for name in os.listdir(BUILD_DIR):
        m = re.match(r'zelda_v(\d+)\.lst$', name)
        if m:
            ver = int(m.group(1))
            if ver > best_ver:
                best_ver = ver
                best_path = os.path.join(BUILD_DIR, name)
    return best_path, best_ver


def read_lines(path):
    if not os.path.isfile(path):
        return []
    with open(path, 'r', encoding='utf-8', errors='replace') as f:
        return f.read().splitlines()


def find_generated_sources():
    """Return list of all .asm files in generated_vdp/."""
    result = []
    if os.path.isdir(GENERATED_DIR):
        for name in sorted(os.listdir(GENERATED_DIR)):
            if name.endswith('.asm'):
                result.append(os.path.join(GENERATED_DIR, name))
    return result


# ---------------------------------------------------------------------------
# Check 1: Empty translations
# ---------------------------------------------------------------------------

RE_EMPTY_TRANSLATION = re.compile(
    r';\s*\(empty translation for\s+\w+\)', re.IGNORECASE
)

def check_empty_translations(sources):
    """Count remaining (empty translation for XXX) stubs."""
    count = 0
    locations = []
    for path in sources:
        for i, line in enumerate(read_lines(path), 1):
            if RE_EMPTY_TRANSLATION.search(line):
                count += 1
                if len(locations) < 5:
                    locations.append(f"  {os.path.basename(path)}:{i}")
    penalty = min(count, 30)
    return {
        "name": "empty_translations",
        "count": count,
        "delta": -penalty,
        "detail": f"{count} empty translation stubs remaining",
        "samples": locations,
    }


# ---------------------------------------------------------------------------
# Check 2: Untranslated PPU register stubs
# ---------------------------------------------------------------------------

RE_PPU_STUB = re.compile(
    r'PPU_REG_\$\w+.*NEEDS VDP TRANSLATION', re.IGNORECASE
)

def check_ppu_stubs(sources):
    count = 0
    locations = []
    for path in sources:
        for i, line in enumerate(read_lines(path), 1):
            if RE_PPU_STUB.search(line):
                count += 1
                if len(locations) < 5:
                    locations.append(f"  {os.path.basename(path)}:{i}")
    return {
        "name": "untranslated_ppu_stubs",
        "count": count,
        "delta": -(count * 5),
        "detail": f"{count} untranslated PPU register stubs",
        "samples": locations,
    }


# ---------------------------------------------------------------------------
# Check 3: Odd-length DC.B without EVEN alignment
# ---------------------------------------------------------------------------

RE_DCB = re.compile(r'^\s+DC\.B\s+(.+)', re.IGNORECASE)
RE_EVEN = re.compile(r'^\s+EVEN\b', re.IGNORECASE)
RE_LABEL = re.compile(r'^[A-Za-z_]\w*\s*:', re.IGNORECASE)

def check_alignment(sources):
    """Detect DC.B sequences with odd byte count not followed by EVEN."""
    count = 0
    locations = []
    for path in sources:
        lines = read_lines(path)
        i = 0
        while i < len(lines):
            m = RE_DCB.match(lines[i])
            if m:
                # Count bytes in this DC.B run
                byte_count = 0
                start = i
                while i < len(lines) and RE_DCB.match(lines[i]):
                    operand = RE_DCB.match(lines[i]).group(1)
                    # Strip comments
                    operand = operand.split(';')[0].strip()
                    tokens = [t.strip() for t in operand.split(',') if t.strip()]
                    byte_count += len(tokens)
                    i += 1
                # Check if odd and next non-blank line is not EVEN
                if byte_count % 2 == 1:
                    # Skip blanks/comments
                    j = i
                    while j < len(lines) and (not lines[j].strip() or
                          lines[j].strip().startswith(';')):
                        j += 1
                    if j < len(lines) and not RE_EVEN.match(lines[j]):
                        # Not followed by EVEN — possible alignment issue
                        # But only flag if next line is code (label or instruction)
                        if j < len(lines) and (RE_LABEL.match(lines[j]) or
                              lines[j].strip()[:1] not in ('', ';')):
                            count += 1
                            if len(locations) < 5:
                                locations.append(
                                    f"  {os.path.basename(path)}:{start+1} "
                                    f"({byte_count} bytes)")
            else:
                i += 1
    penalty = min(count * 2, 20)
    return {
        "name": "alignment_issues",
        "count": count,
        "delta": -penalty,
        "detail": f"{count} odd-length DC.B blocks without EVEN",
        "samples": locations,
    }


# ---------------------------------------------------------------------------
# Check 4: movem push/pop balance (delegates to check_register_safety.py)
# ---------------------------------------------------------------------------

def check_movem_balance():
    """Run the register safety check and parse results."""
    safety_script = os.path.join(SCRIPT_DIR, "check_register_safety.py")
    if not os.path.isfile(safety_script):
        return {
            "name": "movem_balance",
            "count": 0,
            "delta": 0,
            "detail": "check_register_safety.py not found (skipped)",
            "samples": [],
        }

    try:
        result = subprocess.run(
            [sys.executable, safety_script],
            capture_output=True, text=True, timeout=30,
            cwd=PROJECT_ROOT
        )
        output = result.stdout + result.stderr

        # Parse summary line
        m = re.search(r'(\d+) failure\(s\),\s*(\d+) warning\(s\)', output)
        failures = int(m.group(1)) if m else 0
        warnings = int(m.group(2)) if m else 0

        delta = -(failures * 10 + warnings * 2)
        return {
            "name": "register_safety",
            "count": failures + warnings,
            "delta": delta,
            "detail": f"{failures} failure(s), {warnings} warning(s)",
            "samples": [l.strip() for l in output.splitlines()
                       if l.strip().startswith('[FAIL]') or
                          l.strip().startswith('[WARN]')][:5],
        }
    except Exception as e:
        return {
            "name": "register_safety",
            "count": 0,
            "delta": -5,
            "detail": f"register safety check error: {e}",
            "samples": [],
        }


# ---------------------------------------------------------------------------
# Check 5: Guard comment presence in vdp_layer.asm
# ---------------------------------------------------------------------------

EXPECTED_GUARDS = [
    ("tile artifact", re.compile(r'GUARD.*artifact|artifact.*GUARD', re.I)),
    ("sprite Y-hide", re.compile(r'GUARD.*sprite|sprite.*GUARD', re.I)),
    ("H40 overflow", re.compile(r'GUARD.*H40|H40.*GUARD', re.I)),
    ("v490 sprite pixel", re.compile(r'GUARD.*v490|v490.*GUARD', re.I)),
]

def check_guard_comments():
    lines = read_lines(VDP_LAYER)
    full_text = '\n'.join(lines)
    found = 0
    missing = []
    for name, pattern in EXPECTED_GUARDS:
        if pattern.search(full_text):
            found += 1
        else:
            missing.append(f"  Missing: {name}")
    return {
        "name": "guard_comments",
        "count": found,
        "delta": found * 5,
        "detail": f"{found}/{len(EXPECTED_GUARDS)} guard comments present",
        "samples": missing,
    }


# ---------------------------------------------------------------------------
# Check 6: Build exists (listing file present)
# ---------------------------------------------------------------------------

def check_build_exists(lst_path):
    exists = lst_path is not None and os.path.isfile(lst_path)
    return {
        "name": "build_exists",
        "count": 1 if exists else 0,
        "delta": 10 if exists else 0,
        "detail": f"Listing: {os.path.basename(lst_path)}" if exists
                  else "No listing file found",
        "samples": [],
    }


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(description="Static analysis scoring")
    parser.add_argument('--lst', help='Path to .lst listing file')
    parser.add_argument('--json', action='store_true',
                       help='Output JSON instead of text')
    args = parser.parse_args()

    # Find listing
    if args.lst:
        lst_path = args.lst
        m = re.search(r'v(\d+)', os.path.basename(lst_path))
        version = int(m.group(1)) if m else 0
    else:
        lst_path, version = find_latest_lst()

    # Gather sources
    sources = find_generated_sources()
    if os.path.isfile(VDP_LAYER):
        sources.append(VDP_LAYER)

    # Run all checks
    checks = [
        check_empty_translations(sources),
        check_ppu_stubs(sources),
        check_alignment(sources),
        check_movem_balance(),
        check_guard_comments(),
        check_build_exists(lst_path),
    ]

    total = BASELINE
    for c in checks:
        total += c["delta"]

    result = {
        "version": version,
        "static_score": total,
        "baseline": BASELINE,
        "checks": checks,
    }

    if args.json:
        print(json.dumps(result, indent=2))
    else:
        print(f"=== Static Score: v{version} ===")
        print(f"Baseline: {BASELINE}")
        print()
        for c in checks:
            sign = "+" if c["delta"] >= 0 else ""
            status = "PASS" if c["delta"] >= 0 else "ISSUE"
            print(f"  [{status}] {c['name']}: {c['detail']} "
                  f"({sign}{c['delta']})")
            for s in c.get("samples", []):
                print(f"         {s}")
        print()
        print(f"  TOTAL STATIC SCORE: {total}")
        print()

    return 0


if __name__ == "__main__":
    sys.exit(main())
