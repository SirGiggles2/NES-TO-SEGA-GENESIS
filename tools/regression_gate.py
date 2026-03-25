#!/usr/bin/env python3
"""
regression_gate.py - Compare a new build against the v597 baseline.

Checks smoke test output, optional gameplay probe output, and the static score
to detect regressions. Returns exit code 0 if the build passes the gate, 1 if
it regresses.

Usage:
    python regression_gate.py
    python regression_gate.py --smoke path/to/smoke.json --score 85
    python regression_gate.py --version 600 --require-gameplay
    python regression_gate.py --gameplay path/to/gameplay_probe.txt --require-gameplay
"""

import argparse
import json
import os
import re
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)
REPORTS_DIR = os.path.join(PROJECT_ROOT, "diag", "reports")

# v597 baseline thresholds — the minimum acceptable values
BASELINE = {
    "version": 597,
    "min_static_score": 50,   # score below this is a regression
    "require_boot": True,      # must boot without crash
    "require_vram": True,      # must have VRAM data
    "min_max_script": 0,       # smoke now validates boot/readiness, not script progression
    "max_gameplay_entry_frame": 1200,
}


def find_latest_report(pattern):
    """Find the highest-version report matching a regex pattern."""
    if not os.path.isdir(REPORTS_DIR):
        return None, 0
    best_ver = -1
    best_path = None
    for name in os.listdir(REPORTS_DIR):
        m = re.match(pattern, name)
        if m:
            ver = int(m.group(1))
            if ver > best_ver:
                best_ver = ver
                best_path = os.path.join(REPORTS_DIR, name)
    return best_path, best_ver


def find_latest_smoke():
    """Find the most recent smoke test report."""
    return find_latest_report(r'smoke_test_zelda_v(\d+)\.json$')


def find_latest_gameplay():
    """Find the most recent gameplay probe report."""
    return find_latest_report(r'gameplay_probe_zelda_v(\d+)\.txt$')


def load_smoke(path):
    """Load and validate smoke test JSON."""
    if not path or not os.path.isfile(path):
        return None
    with open(path, 'r', encoding='utf-8') as f:
        return json.load(f)


def load_gameplay(path):
    """Load summary key/value lines from a gameplay probe report."""
    if not path or not os.path.isfile(path):
        return None

    data = {}
    with open(path, 'r', encoding='utf-8') as f:
        for raw_line in f:
            line = raw_line.strip()
            if not line or '=' not in line:
                continue
            key, value = line.split('=', 1)
            data[key.strip()] = value.strip()
    return data


def parse_version(text):
    """Extract a Zelda build version from text like zelda_v600."""
    if not text:
        return 0
    match = re.search(r'v(\d+)', text)
    return int(match.group(1)) if match else 0


def parse_int(value):
    """Convert a report field to int, returning None for missing values."""
    if value is None:
        return None
    value = str(value).strip()
    if not value or value.lower() == 'nil':
        return None
    try:
        return int(value)
    except ValueError:
        return None


def gate_check(smoke_data, static_score=None, gameplay_data=None,
               require_gameplay=False, max_gameplay_entry_frame=None):
    """Run regression gate checks. Returns (pass, issues_list, version)."""
    issues = []
    version = 0

    if smoke_data:
        version = parse_version(smoke_data.get('rom', 'v0'))

        if BASELINE["require_boot"] and smoke_data.get("crash", False):
            issues.append(f"FAIL: Crash detected - {smoke_data.get('crash_reason', 'unknown')}")

        if BASELINE["require_vram"] and not smoke_data.get("pass_vram", False):
            issues.append("FAIL: No VRAM data rendered")

        max_script = smoke_data.get("max_script", 0)
        if max_script < BASELINE["min_max_script"]:
            issues.append(f"FAIL: max_script={max_script}, need >={BASELINE['min_max_script']}")

        if not smoke_data.get("pass", False):
            issues.append("FAIL: Smoke test overall FAIL")
    else:
        issues.append("WARN: No smoke test data available (run zelda_smoke_test.lua first)")

    if gameplay_data:
        if version == 0:
            version = parse_version(gameplay_data.get('rom'))

        final_phase = gameplay_data.get("final_phase")
        gameplay_entry_frame = parse_int(gameplay_data.get("gameplay_entry_frame"))
        entry_budget = max_gameplay_entry_frame or BASELINE["max_gameplay_entry_frame"]

        if final_phase != "capture_gameplay":
            issues.append(f"FAIL: final_phase={final_phase}, expected capture_gameplay")

        if gameplay_entry_frame is None:
            issues.append("FAIL: gameplay_entry_frame missing")
        elif gameplay_entry_frame > entry_budget:
            issues.append(
                f"FAIL: gameplay_entry_frame={gameplay_entry_frame}, "
                f"above maximum {entry_budget}"
            )
    elif require_gameplay:
        issues.append("FAIL: No gameplay probe data available")

    if static_score is not None:
        if static_score < BASELINE["min_static_score"]:
            issues.append(f"FAIL: static_score={static_score}, "
                         f"below minimum {BASELINE['min_static_score']}")

    passed = all(not i.startswith("FAIL") for i in issues)
    return passed, issues, version


def main():
    parser = argparse.ArgumentParser(description="Regression gate check")
    parser.add_argument('--smoke', help='Path to smoke test JSON')
    parser.add_argument('--gameplay', help='Path to gameplay probe report')
    parser.add_argument('--score', type=int, help='Static score to check')
    parser.add_argument('--version', type=int, help='Version number to check')
    parser.add_argument('--require-gameplay', action='store_true',
                        help='Fail if gameplay probe data is missing or invalid')
    parser.add_argument('--max-entry-frame', type=int,
                        help='Maximum allowed gameplay entry frame')
    args = parser.parse_args()

    # Find smoke test data
    if args.smoke:
        smoke_path = args.smoke
    elif args.version:
        smoke_path = os.path.join(REPORTS_DIR,
                                   f"smoke_test_zelda_v{args.version}.json")
    else:
        smoke_path, _ = find_latest_smoke()

    # Find gameplay test data
    if args.gameplay:
        gameplay_path = args.gameplay
    elif args.version:
        gameplay_path = os.path.join(REPORTS_DIR,
                                     f"gameplay_probe_zelda_v{args.version}.txt")
    else:
        gameplay_path, _ = find_latest_gameplay()

    smoke_data = load_smoke(smoke_path)
    gameplay_data = load_gameplay(gameplay_path)

    if gameplay_data is not None and 'rom' not in gameplay_data:
        gameplay_data['rom'] = os.path.basename(gameplay_path)

    # Run gate
    passed, issues, version = gate_check(
        smoke_data,
        static_score=args.score,
        gameplay_data=gameplay_data,
        require_gameplay=args.require_gameplay,
        max_gameplay_entry_frame=args.max_entry_frame,
    )

    # Output
    print(f"=== Regression Gate: v{version or '???'} ===")
    print(f"Baseline: v{BASELINE['version']}")
    print()

    if not issues:
        print("  All checks passed.")
    else:
        for issue in issues:
            print(f"  {issue}")

    print()
    result = "GATE PASSED" if passed else "GATE FAILED"
    print(f"  Result: {result}")
    print()

    sys.exit(0 if passed else 1)


if __name__ == "__main__":
    main()
