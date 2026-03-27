#!/usr/bin/env python3
"""
record_probe_result.py - Update score ledgers from runtime probe outputs.

This helper records both:
  - artifacts/accuracy_ledger.csv
  - artifacts/score_ledger.csv

It supports either:
  1. the normal frontend/gameplay probe pair, or
  2. the gameplay interaction probe used during Gate 2 debugging.
"""

from __future__ import annotations

import argparse
import datetime as dt
import json
import os
import re
import subprocess
import sys
from typing import Dict, List, Optional, Tuple

import accuracy_tracker as at
import show_scores as score_ledger


SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PROJECT_ROOT = os.path.dirname(SCRIPT_DIR)
BUILD_DIR = os.path.join(PROJECT_ROOT, "build")
DEFAULT_ACCURACY_LEDGER = os.path.join(PROJECT_ROOT, "artifacts", "accuracy_ledger.csv")
STATIC_SCORE_SCRIPT = os.path.join(SCRIPT_DIR, "static_score.py")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Record build/probe results into both ledgers")
    parser.add_argument("--version", type=int, help="Build version number")
    parser.add_argument("--static-score", type=int, help="Static score (auto-computed if omitted)")
    parser.add_argument("--lst", help="Listing path to use for static score auto-compute")
    parser.add_argument("--frontend", help="Frontend probe report path")
    parser.add_argument("--gameplay", help="Gameplay probe report path")
    parser.add_argument("--interaction", help="Gameplay interaction probe report path")
    parser.add_argument("--accuracy-ledger", default=DEFAULT_ACCURACY_LEDGER,
                        help="Accuracy ledger CSV path")
    parser.add_argument("--notes", default="", help="Extra note text to append")
    parser.add_argument("--fail-on-regression", action="store_true",
                        help="Exit non-zero if the recorded accuracy regresses versus the previous row")
    return parser.parse_args()


def parse_kv_text(text: str) -> Dict[str, str]:
    data: Dict[str, str] = {}
    for raw in text.splitlines():
        line = raw.strip()
        if not line or "=" not in line:
            continue
        for match in at.KV_TOKEN_RE.finditer(line):
            data[match.group(1).strip()] = match.group(2).strip()
    return data


def parse_bool(value: Optional[str]) -> Optional[bool]:
    if value is None:
        return None
    text = str(value).strip().lower()
    if text == "true":
        return True
    if text == "false":
        return False
    return None


def parse_version_from_text(text: str) -> Optional[int]:
    match = re.search(r"v(\d+)", text or "")
    if not match:
        return None
    return int(match.group(1))


def resolve_version(args: argparse.Namespace) -> int:
    if args.version is not None:
        return args.version

    for candidate in (args.interaction, args.frontend, args.gameplay, args.lst):
        if not candidate:
            continue
        version = parse_version_from_text(os.path.basename(candidate))
        if version is not None:
            return version

    raise SystemExit("Version is required when it cannot be inferred from the input path")


def compute_static_score(version: int, args: argparse.Namespace) -> int:
    if args.static_score is not None:
        return args.static_score

    lst_path = args.lst or os.path.join(BUILD_DIR, f"zelda_v{version}.lst")
    if not os.path.isfile(lst_path):
        raise SystemExit(f"Listing file not found for v{version}: {lst_path}")

    result = subprocess.run(
        [sys.executable, STATIC_SCORE_SCRIPT, "--lst", lst_path, "--json"],
        capture_output=True,
        text=True,
        cwd=PROJECT_ROOT,
        check=False,
    )
    if result.returncode != 0:
        raise SystemExit(
            f"static_score.py failed for v{version} (exit {result.returncode}):\n{result.stderr}"
        )

    try:
        parsed = json.loads(result.stdout)
    except json.JSONDecodeError as exc:
        raise SystemExit(f"Could not parse static_score.py output for v{version}: {exc}") from exc

    return int(parsed["static_score"])


def extract_min_branch(text: str) -> Tuple[Optional[int], Optional[int]]:
    matches = re.findall(r"branch_frame=(\d+)\s+branch_script=(\d+)", text)
    if not matches:
        return None, None
    pairs = [(int(frame), int(script)) for frame, script in matches]
    frame, script = min(pairs, key=lambda item: item[0])
    return frame, script


def parse_interaction_report(path: str) -> Dict[str, object]:
    if not os.path.isfile(path):
        raise SystemExit(f"Interaction report not found: {path}")

    with open(path, "r", encoding="utf-8") as f:
        text = f.read()

    summary_text = text.split("=== SUMMARY ===", 1)[1] if "=== SUMMARY ===" in text else text
    summary = parse_kv_text(summary_text)

    branch_frame, frontend_branch_script = extract_min_branch(text)

    title_match = re.search(r"title_ready_frame=(\d+)", text)
    file_select_match = re.search(r"file_select_ready_frame=(\d+)", text)

    return {
        "title_ready_frame": int(title_match.group(1)) if title_match else None,
        "file_select_ready_frame": int(file_select_match.group(1)) if file_select_match else None,
        "branch_frame": branch_frame,
        "frontend_branch_script": frontend_branch_script,
        "gameplay_entry_frame": at.parse_int(summary.get("gameplay_entry_frame")),
        "final_phase": summary.get("final_phase"),
        "recover_with_select_count": text.count("action=recover_with_select"),
        "movement_pass": parse_bool(summary.get("movement_pass")),
        "pause_pass": parse_bool(summary.get("pause_pass")),
        "room_transition_pass": parse_bool(summary.get("room_transition_pass")),
        "interaction_core_pass": parse_bool(summary.get("interaction_core_pass")),
        "interaction_overall_pass": parse_bool(summary.get("interaction_overall_pass")),
        "room_transition_final_trace_last": summary.get("room_transition_final_trace_last"),
    }


def parse_standard_reports(frontend_path: str, gameplay_path: str) -> Dict[str, object]:
    if not frontend_path or not gameplay_path:
        raise SystemExit("Standard mode requires both --frontend and --gameplay")

    frontend = at.parse_kv_report(frontend_path)
    gameplay = at.parse_kv_report(gameplay_path)

    return {
        "title_ready_frame": at.parse_int(frontend.get("title_ready_frame")),
        "file_select_ready_frame": at.parse_int(frontend.get("file_select_ready_frame")),
        "branch_frame": at.parse_int(frontend.get("branch_frame")),
        "frontend_branch_script": at.parse_int(frontend.get("branch_script")),
        "gameplay_entry_frame": at.parse_int(gameplay.get("gameplay_entry_frame")),
        "final_phase": gameplay.get("final_phase"),
        "recover_with_select_count": at.count_occurrences(frontend_path, "action=recover_with_select"),
        "movement_pass": None,
        "pause_pass": None,
        "room_transition_pass": None,
        "interaction_core_pass": None,
        "interaction_overall_pass": None,
        "room_transition_final_trace_last": None,
    }


def build_note(data: Dict[str, object], extra_notes: str) -> str:
    parts: List[str] = []

    movement_pass = data.get("movement_pass")
    pause_pass = data.get("pause_pass")
    room_transition_pass = data.get("room_transition_pass")
    final_phase = data.get("final_phase")
    trace_last = data.get("room_transition_final_trace_last")
    interaction_core_pass = data.get("interaction_core_pass")

    if movement_pass is not None:
        parts.append("movement PASS" if movement_pass else "movement FAIL")
    if pause_pass is not None:
        parts.append("pause PASS" if pause_pass else "pause FAIL")
    if room_transition_pass is not None:
        if room_transition_pass:
            parts.append("room transition PASS")
        else:
            trace_suffix = f" trace={trace_last}" if trace_last else ""
            parts.append(f"room transition FAIL{trace_suffix}")
    if interaction_core_pass is False:
        parts.append("interaction core FAIL")
    if final_phase:
        parts.append(f"phase={final_phase}")
    if extra_notes:
        parts.append(extra_notes)

    return "; ".join(parts) if parts else "ok"


def compute_regression_issues(
    rows: List[Dict[str, str]],
    version: int,
    accuracy: int,
    gameplay_entry_frame: Optional[int],
    title_ready_frame: Optional[int],
    file_select_ready_frame: Optional[int],
    branch_frame: Optional[int],
    entry_regression_tolerance: int = 30,
    timing_regression_tolerance: int = 20,
) -> List[str]:
    prev = at.previous_row(rows, version)
    if prev is None:
        return []

    regression_issues: List[str] = []
    prev_accuracy = at.parse_int(prev.get("accuracy_score"))
    prev_entry = at.parse_int(prev.get("gameplay_entry_frame"))
    prev_title = at.parse_int(prev.get("title_ready_frame"))
    prev_file_select = at.parse_int(prev.get("file_select_ready_frame"))
    prev_branch = at.parse_int(prev.get("branch_frame"))

    if prev_accuracy is not None and accuracy < prev_accuracy:
        regression_issues.append(f"accuracy_score regressed: {accuracy} < {prev_accuracy}")

    if prev_entry is not None and gameplay_entry_frame is not None:
        limit = prev_entry + entry_regression_tolerance
        if gameplay_entry_frame > limit:
            regression_issues.append(f"gameplay_entry_frame regressed: {gameplay_entry_frame} > {limit}")

    for name, current_value, prev_value in (
        ("title_ready_frame", title_ready_frame, prev_title),
        ("file_select_ready_frame", file_select_ready_frame, prev_file_select),
        ("branch_frame", branch_frame, prev_branch),
    ):
        if prev_value is None or current_value is None:
            continue
        limit = prev_value + timing_regression_tolerance
        if current_value > limit:
            regression_issues.append(f"{name} regressed: {current_value} > {limit}")

    return regression_issues


def latest_prior_row_matching(
    rows: List[Dict[str, str]],
    version: int,
    predicate,
) -> Optional[Dict[str, str]]:
    best: Optional[Dict[str, str]] = None
    best_ver = -1
    for row in rows:
        row_version = at.parse_int(row.get("version"))
        if row_version is None or row_version >= version:
            continue
        if not predicate(row):
            continue
        if row_version > best_ver:
            best_ver = row_version
            best = row
    return best


def compute_milestone_guard_issues(
    rows: List[Dict[str, str]],
    version: int,
    gameplay_entry_frame: Optional[int],
    entry_regression_tolerance: int = 30,
) -> List[str]:
    baseline = latest_prior_row_matching(
        rows,
        version,
        lambda row: at.parse_int(row.get("gameplay_entry_frame")) is not None,
    )
    if baseline is None:
        return []

    baseline_version = at.parse_int(baseline.get("version"))
    baseline_entry = at.parse_int(baseline.get("gameplay_entry_frame"))
    if baseline_version is None or baseline_entry is None:
        return []

    issues: List[str] = []
    if gameplay_entry_frame is None:
        issues.append(
            f"lost gameplay-entry baseline from v{baseline_version} (entry={baseline_entry})"
        )
        return issues

    limit = baseline_entry + entry_regression_tolerance
    if gameplay_entry_frame > limit:
        issues.append(
            f"gameplay-entry baseline regressed vs v{baseline_version}: {gameplay_entry_frame} > {limit}"
        )

    return issues


def update_score_ledger(version: int, static_score: int, notes: str) -> None:
    score_ledger.add_entry(version, static_score, notes)


def main() -> int:
    args = parse_args()
    if bool(args.interaction) == bool(args.frontend or args.gameplay):
        raise SystemExit("Use either --interaction or the --frontend/--gameplay pair")

    version = resolve_version(args)
    static_score = compute_static_score(version, args)

    if args.interaction:
        data = parse_interaction_report(args.interaction)
    else:
        data = parse_standard_reports(args.frontend, args.gameplay)

    title_ready_frame = data["title_ready_frame"]
    file_select_ready_frame = data["file_select_ready_frame"]
    branch_frame = data["branch_frame"]
    frontend_branch_script = data["frontend_branch_script"]
    gameplay_entry_frame = data["gameplay_entry_frame"]
    final_phase = data["final_phase"]
    recover_with_select_count = int(data["recover_with_select_count"])

    timing_score = at.compute_timing_score(
        title_ready_frame=title_ready_frame,
        file_select_ready_frame=file_select_ready_frame,
        branch_frame=branch_frame,
        gameplay_entry_frame=gameplay_entry_frame,
    )

    frontend_ok = at.frontend_pass(frontend_branch_script)
    gameplay_ok = at.gameplay_pass(final_phase, gameplay_entry_frame)
    accuracy = at.compute_accuracy_score(
        static_score=static_score,
        frontend_ok=frontend_ok,
        gameplay_ok=gameplay_ok,
        gameplay_entry_frame=gameplay_entry_frame,
        timing_score=timing_score,
        recover_with_select_count=recover_with_select_count,
    )

    issues: List[str] = []
    if not frontend_ok:
        issues.append(f"frontend branch unexpected ({frontend_branch_script})")
    if not gameplay_ok:
        issues.append(f"gameplay not captured (final_phase={final_phase}, entry={gameplay_entry_frame})")
    if recover_with_select_count > 0:
        issues.append(f"recover_with_select_count={recover_with_select_count}")

    if data.get("movement_pass") is False:
        issues.append("movement failed")
    if data.get("pause_pass") is False:
        issues.append("pause failed")
    if data.get("room_transition_pass") is False:
        trace_last = data.get("room_transition_final_trace_last")
        if trace_last:
            issues.append(f"room transition failed (trace={trace_last})")
        else:
            issues.append("room transition failed")

    rows = at.read_ledger(args.accuracy_ledger)
    regression_issues = compute_regression_issues(
        rows=rows,
        version=version,
        accuracy=accuracy,
        gameplay_entry_frame=gameplay_entry_frame,
        title_ready_frame=title_ready_frame,
        file_select_ready_frame=file_select_ready_frame,
        branch_frame=branch_frame,
    )
    milestone_guard_issues = compute_milestone_guard_issues(
        rows=rows,
        version=version,
        gameplay_entry_frame=gameplay_entry_frame,
    )
    all_regression_issues = regression_issues + [
        issue for issue in milestone_guard_issues if issue not in regression_issues
    ]

    status = "PASS"
    if issues or all_regression_issues:
        status = "WARN"
    if data.get("interaction_core_pass") is False:
        status = "FAIL"
    if args.fail_on_regression and all_regression_issues:
        status = "FAIL"

    note_text = build_note(data, args.notes)
    if all_regression_issues:
        note_text = "; ".join([note_text] + all_regression_issues) if note_text else "; ".join(all_regression_issues)

    accuracy_row = {
        "version": str(version),
        "date": dt.date.today().isoformat(),
        "static_score": str(static_score),
        "frontend_branch_script": "" if frontend_branch_script is None else str(frontend_branch_script),
        "title_ready_frame": "" if title_ready_frame is None else str(title_ready_frame),
        "file_select_ready_frame": "" if file_select_ready_frame is None else str(file_select_ready_frame),
        "branch_frame": "" if branch_frame is None else str(branch_frame),
        "gameplay_entry_frame": "" if gameplay_entry_frame is None else str(gameplay_entry_frame),
        "recover_with_select_count": str(recover_with_select_count),
        "timing_score": str(timing_score),
        "final_phase": final_phase or "",
        "accuracy_score": str(accuracy),
        "next_milestone": at.next_milestone(accuracy),
        "status": status,
        "notes": note_text or "ok",
    }

    rows = at.upsert_row(rows, accuracy_row)
    at.write_ledger(args.accuracy_ledger, rows)
    update_score_ledger(version, static_score, note_text or "ok")

    print(f"recorded_version={version}")
    print(f"static_score={static_score}")
    print(f"accuracy_score={accuracy}")
    print(f"status={status}")
    print(f"notes={note_text or 'ok'}")

    if status == "FAIL":
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
