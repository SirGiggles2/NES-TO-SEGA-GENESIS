#!/usr/bin/env python3
"""
accuracy_tracker.py - Runtime + static fidelity tracker with optional regression gate.

This script computes a compact "accuracy score" from static and runtime probe outputs,
then appends/updates artifacts/accuracy_ledger.csv so progress is measurable per build.

Usage examples:
  python tools/accuracy_tracker.py --version 601 --static-score 105 \
      --frontend diag/reports/frontend_probe_zelda_v601.txt \
      --gameplay diag/reports/gameplay_probe_zelda_v601.txt

  python tools/accuracy_tracker.py --version 602 --static-score 106 \
      --frontend diag/reports/frontend_probe_zelda_v602.txt \
      --gameplay diag/reports/gameplay_probe_zelda_v602.txt \
      --update-ledger --fail-on-regression
"""

from __future__ import annotations

import argparse
import csv
import datetime as dt
import os
import re
import sys
from typing import Dict, List, Optional


SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)
DEFAULT_LEDGER = os.path.join(PROJECT_ROOT, "artifacts", "accuracy_ledger.csv")

EXPECTED_FRONTEND_BRANCHES = {13, 14, 15}
KV_TOKEN_RE = re.compile(r"([A-Za-z0-9_]+)=([^\s]+)")

REFERENCE_TIMING = {
    "title_ready_frame": 130,
    "file_select_ready_frame": 432,
    "branch_frame": 479,
    "gameplay_entry_frame": 893,
}

MILESTONES = [
    (145, "Frontend parity stabilized"),
    (150, "Gameplay entry parity tightening"),
    (155, "Near-parity runtime behavior"),
]


def parse_kv_report(path: str) -> Dict[str, str]:
    data: Dict[str, str] = {}
    if not path or not os.path.isfile(path):
        return data
    with open(path, "r", encoding="utf-8") as f:
        for raw in f:
            line = raw.strip()
            if not line or "=" not in line:
                continue
            for match in KV_TOKEN_RE.finditer(line):
                key = match.group(1).strip()
                value = match.group(2).strip()
                data[key] = value
    return data


def count_occurrences(path: str, token: str) -> int:
    if not path or not os.path.isfile(path):
        return 0
    count = 0
    with open(path, "r", encoding="utf-8") as f:
        for raw in f:
            if token in raw:
                count += 1
    return count


def parse_int(value: Optional[str]) -> Optional[int]:
    if value is None:
        return None
    text = str(value).strip()
    if not text:
        return None
    try:
        return int(text)
    except ValueError:
        return None


def frontend_pass(branch_script: Optional[int]) -> bool:
    if branch_script is None:
        return False
    return branch_script >= 5 or branch_script in EXPECTED_FRONTEND_BRANCHES


def gameplay_pass(final_phase: Optional[str], gameplay_entry_frame: Optional[int]) -> bool:
    return final_phase == "capture_gameplay" and gameplay_entry_frame is not None


def timing_component(actual: Optional[int], reference: int) -> int:
    if actual is None:
        return 0
    delta = abs(actual - reference)
    if delta <= 10:
        return 4
    if delta <= 20:
        return 3
    if delta <= 40:
        return 2
    if delta <= 80:
        return 1
    return 0


def compute_timing_score(
    title_ready_frame: Optional[int],
    file_select_ready_frame: Optional[int],
    branch_frame: Optional[int],
    gameplay_entry_frame: Optional[int],
) -> int:
    return (
        timing_component(title_ready_frame, REFERENCE_TIMING["title_ready_frame"])
        + timing_component(file_select_ready_frame, REFERENCE_TIMING["file_select_ready_frame"])
        + timing_component(branch_frame, REFERENCE_TIMING["branch_frame"])
        + timing_component(gameplay_entry_frame, REFERENCE_TIMING["gameplay_entry_frame"])
    )


def recover_penalty(recover_with_select_count: int) -> int:
    # Penalize recover path usage to reward native progression. Cap at -12.
    return min(recover_with_select_count * 2, 12)


def next_milestone(score: int) -> str:
    for target, label in MILESTONES:
        if score < target:
            return f"{target} ({label})"
    return "ALL_MILESTONES_REACHED"


def compute_accuracy_score(
    static_score: int,
    frontend_ok: bool,
    gameplay_ok: bool,
    gameplay_entry_frame: Optional[int],
    timing_score: int,
    recover_with_select_count: int,
) -> int:
    score = static_score

    if frontend_ok:
        score += 5

    if gameplay_ok:
        score += 20

    if gameplay_entry_frame is not None:
        if gameplay_entry_frame <= 900:
            score += 10
        elif gameplay_entry_frame <= 1000:
            score += 5
        elif gameplay_entry_frame <= 1200:
            score += 2

    score += timing_score
    score -= recover_penalty(recover_with_select_count)

    return score


def ensure_ledger_dir(path: str) -> None:
    folder = os.path.dirname(path)
    if folder:
        os.makedirs(folder, exist_ok=True)


def read_ledger(path: str) -> List[Dict[str, str]]:
    if not os.path.isfile(path):
        return []
    with open(path, "r", encoding="utf-8", newline="") as f:
        return list(csv.DictReader(f))


def write_ledger(path: str, rows: List[Dict[str, str]]) -> None:
    ensure_ledger_dir(path)
    fields = [
        "version",
        "date",
        "static_score",
        "frontend_branch_script",
        "title_ready_frame",
        "file_select_ready_frame",
        "branch_frame",
        "gameplay_entry_frame",
        "recover_with_select_count",
        "timing_score",
        "final_phase",
        "accuracy_score",
        "next_milestone",
        "status",
        "notes",
    ]

    with open(path, "w", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fields)
        writer.writeheader()
        for row in sorted(rows, key=lambda r: int(r["version"])):
            writer.writerow({k: row.get(k, "") for k in fields})


def upsert_row(rows: List[Dict[str, str]], new_row: Dict[str, str]) -> List[Dict[str, str]]:
    out: List[Dict[str, str]] = []
    replaced = False
    for row in rows:
        if row.get("version") == new_row.get("version"):
            out.append(new_row)
            replaced = True
        else:
            out.append(row)
    if not replaced:
        out.append(new_row)
    return out


def previous_row(rows: List[Dict[str, str]], version: int) -> Optional[Dict[str, str]]:
    best: Optional[Dict[str, str]] = None
    best_ver = -1
    for row in rows:
        v = parse_int(row.get("version"))
        if v is None:
            continue
        if v < version and v > best_ver:
            best_ver = v
            best = row
    return best


def main() -> int:
    parser = argparse.ArgumentParser(description="Track and gate accuracy progression")
    parser.add_argument("--version", type=int, required=True, help="Build version number")
    parser.add_argument("--static-score", type=int, required=True, help="Static score")
    parser.add_argument("--frontend", required=True, help="Frontend probe report path")
    parser.add_argument("--gameplay", required=True, help="Gameplay probe report path")
    parser.add_argument("--ledger", default=DEFAULT_LEDGER, help="Ledger CSV path")
    parser.add_argument("--entry-regression-tolerance", type=int, default=30,
                        help="Allowed gameplay entry frame regression vs previous version")
    parser.add_argument("--timing-regression-tolerance", type=int, default=20,
                        help="Allowed transition timing regression per marker vs previous version")
    parser.add_argument("--update-ledger", action="store_true",
                        help="Write results to accuracy ledger")
    parser.add_argument("--fail-on-regression", action="store_true",
                        help="Exit non-zero if score/frame regress versus previous version")
    args = parser.parse_args()

    frontend = parse_kv_report(args.frontend)
    gameplay = parse_kv_report(args.gameplay)

    branch_script = parse_int(frontend.get("branch_script"))
    title_ready_frame = parse_int(frontend.get("title_ready_frame"))
    file_select_ready_frame = parse_int(frontend.get("file_select_ready_frame"))
    branch_frame = parse_int(frontend.get("branch_frame"))
    final_phase = gameplay.get("final_phase")
    gameplay_entry_frame = parse_int(gameplay.get("gameplay_entry_frame"))
    recover_with_select_count = count_occurrences(args.frontend, "action=recover_with_select")

    timing_score = compute_timing_score(
        title_ready_frame=title_ready_frame,
        file_select_ready_frame=file_select_ready_frame,
        branch_frame=branch_frame,
        gameplay_entry_frame=gameplay_entry_frame,
    )

    frontend_ok = frontend_pass(branch_script)
    gameplay_ok = gameplay_pass(final_phase, gameplay_entry_frame)

    accuracy = compute_accuracy_score(
        static_score=args.static_score,
        frontend_ok=frontend_ok,
        gameplay_ok=gameplay_ok,
        gameplay_entry_frame=gameplay_entry_frame,
        timing_score=timing_score,
        recover_with_select_count=recover_with_select_count,
    )

    issues: List[str] = []
    if not frontend_ok:
        issues.append(f"frontend branch unexpected ({branch_script})")
    if not gameplay_ok:
        issues.append(f"gameplay not captured (final_phase={final_phase}, entry={gameplay_entry_frame})")
    if recover_with_select_count > 0:
        issues.append(f"recover_with_select_count={recover_with_select_count}")

    rows = read_ledger(args.ledger)
    prev = previous_row(rows, args.version)
    regression_issues: List[str] = []

    if prev is not None:
        prev_accuracy = parse_int(prev.get("accuracy_score"))
        prev_entry = parse_int(prev.get("gameplay_entry_frame"))
        prev_title = parse_int(prev.get("title_ready_frame"))
        prev_file_select = parse_int(prev.get("file_select_ready_frame"))
        prev_branch_frame = parse_int(prev.get("branch_frame"))

        timing_pairs = [
            ("title_ready_frame", title_ready_frame, prev_title),
            ("file_select_ready_frame", file_select_ready_frame, prev_file_select),
            ("branch_frame", branch_frame, prev_branch_frame),
        ]

        if prev_accuracy is not None and accuracy < prev_accuracy:
            regression_issues.append(
                f"accuracy_score regressed: {accuracy} < {prev_accuracy}"
            )

        if prev_entry is not None and gameplay_entry_frame is not None:
            limit = prev_entry + args.entry_regression_tolerance
            if gameplay_entry_frame > limit:
                regression_issues.append(
                    f"gameplay_entry_frame regressed: {gameplay_entry_frame} > {limit}"
                )

        for name, current_value, prev_value in timing_pairs:
            if prev_value is None or current_value is None:
                continue
            limit = prev_value + args.timing_regression_tolerance
            if current_value > limit:
                regression_issues.append(
                    f"{name} regressed: {current_value} > {limit}"
                )

    status = "PASS"
    if issues or regression_issues:
        status = "WARN"
    if args.fail_on_regression and regression_issues:
        status = "FAIL"

    notes = "; ".join(issues + regression_issues) if (issues or regression_issues) else "ok"

    print(f"=== Accuracy Tracker: v{args.version} ===")
    print(f"static_score={args.static_score}")
    print(f"frontend_branch_script={branch_script}")
    print(f"title_ready_frame={title_ready_frame}")
    print(f"file_select_ready_frame={file_select_ready_frame}")
    print(f"branch_frame={branch_frame}")
    print(f"gameplay_entry_frame={gameplay_entry_frame}")
    print(f"recover_with_select_count={recover_with_select_count}")
    print(f"final_phase={final_phase}")
    print(f"timing_score={timing_score}")
    print(f"accuracy_score={accuracy}")
    print(f"next_milestone={next_milestone(accuracy)}")
    print(f"status={status}")
    if notes:
        print(f"notes={notes}")

    if args.update_ledger:
        row = {
            "version": str(args.version),
            "date": dt.date.today().isoformat(),
            "static_score": str(args.static_score),
            "frontend_branch_script": "" if branch_script is None else str(branch_script),
            "title_ready_frame": "" if title_ready_frame is None else str(title_ready_frame),
            "file_select_ready_frame": "" if file_select_ready_frame is None else str(file_select_ready_frame),
            "branch_frame": "" if branch_frame is None else str(branch_frame),
            "gameplay_entry_frame": "" if gameplay_entry_frame is None else str(gameplay_entry_frame),
            "recover_with_select_count": str(recover_with_select_count),
            "timing_score": str(timing_score),
            "final_phase": final_phase or "",
            "accuracy_score": str(accuracy),
            "next_milestone": next_milestone(accuracy),
            "status": status,
            "notes": notes,
        }
        rows = upsert_row(rows, row)
        write_ledger(args.ledger, rows)

    if args.fail_on_regression and regression_issues:
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
