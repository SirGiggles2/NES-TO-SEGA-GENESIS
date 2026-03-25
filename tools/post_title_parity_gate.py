from __future__ import annotations

import argparse
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


REPORTS = Path(r"C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS\diag\reports")

SUMMARY_RE = re.compile(
    r"(?:final|summary)\s+frame=(?P<frame>\d+)\s+ready=(?P<ready>\d+)\s+script=(?P<script>\d+)\s+"
    r"sub=(?P<sub>\d+)\s+ppu=0x(?P<ppu>[0-9A-Fa-f]+)\s+slot=(?P<slot>\d+)\s+"
    r"active=\[(?P<active>[0-9A-Fa-f,]+)\]\s+trace=\[(?P<trace_last>[0-9A-Fa-f]+),(?P<trace_seq>[0-9A-Fa-f]+)\]"
)
STABLE_COUNT_RE = re.compile(r"stable_count=(?P<count>\d+)")
STABLE_START_RE = re.compile(r"stable_start_frame=(?P<frame>\d+)")
TITLE_READY_RE = re.compile(r"title_ready_frame=(?P<frame>\d+)")
TITLE_EXIT_RE = re.compile(r"title_exit_detected\s+frame=(?P<frame>\d+)")
FILE_SELECT_ENTER_RE = re.compile(r"file_select_entered\s+frame=(?P<frame>\d+)")
ACTION_RE = re.compile(r"action=hold_start_title\s+frame=(?P<frame>\d+)(?P<extra>.*)")
INPUT_OK_RE = re.compile(r"input_ok=(true|false)")
START_SUMMARY_RE = re.compile(r"Final:\s+script=(?P<script>\d+)\s+subscript=(?P<sub>\d+)")
SCRIPT_CHANGE_RE = re.compile(r"SCRIPT CHANGED AT FRAME\s+(?P<frame>\d+):\s+0\s*->\s*(?P<script>\d+)")


@dataclass
class ProbeSummary:
    path: Path
    frame: int | None = None
    ready: int | None = None
    script: int | None = None
    sub: int | None = None
    ppu: int | None = None
    slot: int | None = None
    active: str | None = None
    stable_count: int = 0
    stable_start_frame: int | None = None
    title_ready_frames: list[int] | None = None
    title_exit_frame: int | None = None
    file_select_entered_frame: int | None = None
    start_action_frame: int | None = None
    input_ok: bool | None = None
    legacy_autostart: bool = False

    def __post_init__(self) -> None:
        if self.title_ready_frames is None:
            self.title_ready_frames = []


@dataclass
class StartSummary:
    path: Path
    final_script: int | None = None
    final_subscript: int | None = None
    script_changed_frame: int | None = None
    script_changed_to: int | None = None


def parse_probe_report(path: Path) -> ProbeSummary:
    text = path.read_text(encoding="utf-8", errors="replace")
    result = ProbeSummary(path=path)
    result.legacy_autostart = "title autostart only" in text.lower()

    for match in TITLE_READY_RE.finditer(text):
        result.title_ready_frames.append(int(match.group("frame")))

    summary = None
    for match in SUMMARY_RE.finditer(text):
        summary = match
    if summary:
        result.frame = int(summary.group("frame"))
        result.ready = int(summary.group("ready"))
        result.script = int(summary.group("script"))
        result.sub = int(summary.group("sub"))
        result.ppu = int(summary.group("ppu"), 16)
        result.slot = int(summary.group("slot"))
        result.active = summary.group("active").upper()

    stable = STABLE_COUNT_RE.search(text)
    if stable:
        result.stable_count = int(stable.group("count"))

    stable_start = STABLE_START_RE.search(text)
    if stable_start:
        result.stable_start_frame = int(stable_start.group("frame"))

    title_exit = TITLE_EXIT_RE.search(text)
    if title_exit:
        result.title_exit_frame = int(title_exit.group("frame"))

    entered = FILE_SELECT_ENTER_RE.search(text)
    if entered:
        result.file_select_entered_frame = int(entered.group("frame"))

    action = ACTION_RE.search(text)
    if action:
        result.start_action_frame = int(action.group("frame"))
        input_ok = INPUT_OK_RE.search(action.group("extra"))
        if input_ok:
            result.input_ok = input_ok.group(1) == "true"

    return result


def parse_start_report(path: Path) -> StartSummary:
    text = path.read_text(encoding="utf-8", errors="replace")
    result = StartSummary(path=path)

    final = START_SUMMARY_RE.search(text)
    if final:
        result.final_script = int(final.group("script"))
        result.final_subscript = int(final.group("sub"))

    changed = SCRIPT_CHANGE_RE.search(text)
    if changed:
        result.script_changed_frame = int(changed.group("frame"))
        result.script_changed_to = int(changed.group("script"))

    return result


def auto_find(pattern: str) -> list[Path]:
    return sorted(REPORTS.glob(pattern), key=lambda item: item.stat().st_mtime)


def find_report(path_arg: str | None, rom: str, patterns: Iterable[str]) -> Path | None:
    if path_arg:
        path = Path(path_arg)
        return path if path.exists() else None
    for pattern in patterns:
        candidate = REPORTS / pattern.format(rom=rom)
        if candidate.exists():
            return candidate
    return None


def check_probe(
    probe: ProbeSummary, expected_slot: int, expected_active: str, min_stable: int
) -> tuple[str, list[str], list[str], list[str]]:
    passed: list[str] = []
    failed: list[str] = []
    warnings: list[str] = []

    if probe.title_ready_frames:
        passed.append(f"title reached ready state at frames {','.join(str(frame) for frame in probe.title_ready_frames)}")
    elif probe.legacy_autostart:
        warnings.append("legacy autostart probe: title-ready milestone was not logged in this report format")
    else:
        failed.append("title never reached a logged ready state")

    if probe.start_action_frame is not None:
        passed.append(f"probe attempted Start pulse at frame {probe.start_action_frame}")
    elif probe.legacy_autostart:
        warnings.append("legacy autostart probe: no deliberate Start pulse was expected in this report format")
    else:
        failed.append("probe never attempted title Start pulse")

    if probe.title_exit_frame is not None:
        passed.append(f"title exit detected at frame {probe.title_exit_frame}")
    elif probe.legacy_autostart and probe.file_select_entered_frame is not None:
        warnings.append("legacy autostart probe: title exit was implied by file-select entry, not logged directly")
    else:
        failed.append("title never exited after Start pulse")

    if probe.file_select_entered_frame is not None:
        passed.append(f"file select entered at frame {probe.file_select_entered_frame}")
    else:
        failed.append("file select entry was never logged")

    if probe.ready == 1 and probe.script == 1 and probe.sub == 0 and probe.ppu == 0:
        passed.append("final state is stable file select (ready=1 script=1 sub=0 ppu=0)")
    else:
        failed.append(
            "final state is not stable file select "
            f"(ready={probe.ready} script={probe.script} sub={probe.sub} ppu={probe.ppu})"
        )

    if probe.stable_count >= min_stable:
        passed.append(f"stable_count={probe.stable_count} meets threshold {min_stable}")
    else:
        failed.append(f"stable_count={probe.stable_count} below threshold {min_stable}")

    if probe.slot == expected_slot:
        passed.append(f"final slot matches expected cursor slot {expected_slot}")
    else:
        failed.append(f"final slot {probe.slot} does not match expected {expected_slot}")

    if probe.active == expected_active:
        passed.append(f"active table matches canonical value [{expected_active}]")
    else:
        failed.append(f"active table [{probe.active}] does not match canonical [{expected_active}]")

    if probe.input_ok is False:
        warnings.append("joypad API did not verify the Start pulse; this run depended on RAM-only injection or unavailable joypad.set")
    if probe.stable_start_frame is None:
        warnings.append("stable_start_frame missing from report")

    status = "PASS" if not failed else "FAIL"
    return status, passed, failed, warnings


def check_start_report(start: StartSummary | None) -> tuple[str, list[str]]:
    if start is None:
        return "MISSING", ["no start-path report provided; gameplay progression not scored"]

    notes: list[str] = []
    if start.script_changed_to is not None:
        notes.append(f"script changed to {start.script_changed_to} at frame {start.script_changed_frame}")
    if start.final_script is not None:
        notes.append(f"final script={start.final_script} subscript={start.final_subscript}")

    if start.final_script is None and start.script_changed_to is None:
        return "UNKNOWN", notes + ["start-path report did not contain a parseable summary"]
    if (start.final_script or 0) >= 5:
        return "GAMEPLAY", notes
    if (start.final_script or 0) >= 1 or (start.script_changed_to or 0) >= 1:
        return "POST_TITLE", notes
    return "TITLE_ONLY", notes


def build_report(
    rom: str,
    probe_path: Path | None,
    state_path: Path | None,
    start_path: Path | None,
    expected_slot: int,
    expected_active: str,
    min_stable: int,
) -> str:
    lines: list[str] = []
    lines.append("=== POST TITLE PARITY GATE ===")
    lines.append(f"ROM: {rom}")
    lines.append("")

    chosen_probe_path = probe_path or state_path
    if chosen_probe_path is None:
        lines.append("Overall: FAIL")
        lines.append("")
        lines.append("No file-select probe report was found.")
        return "\n".join(lines) + "\n"

    probe = parse_probe_report(chosen_probe_path)
    probe_status, probe_passed, probe_failed, probe_warnings = check_probe(
        probe, expected_slot, expected_active, min_stable
    )

    lines.append(f"Primary report: {chosen_probe_path.name}")
    if state_path and state_path != chosen_probe_path:
        lines.append(f"State report present: {state_path.name}")
    if start_path:
        lines.append(f"Start-path report present: {start_path.name}")
    lines.append("")

    lines.append(f"File-select gate: {probe_status}")
    for item in probe_passed:
        lines.append(f"- PASS: {item}")
    for item in probe_failed:
        lines.append(f"- FAIL: {item}")
    for item in probe_warnings:
        lines.append(f"- WARN: {item}")
    lines.append("")

    start_summary = parse_start_report(start_path) if start_path else None
    start_status, start_notes = check_start_report(start_summary)
    lines.append(f"Start/gameplay lane: {start_status}")
    for item in start_notes:
        level = "WARN" if start_status in {"MISSING", "UNKNOWN", "TITLE_ONLY"} else "INFO"
        lines.append(f"- {level}: {item}")
    lines.append("")

    overall = "PASS" if probe_status == "PASS" else "FAIL"
    if overall == "PASS" and start_status not in {"GAMEPLAY", "POST_TITLE"}:
        overall = "PASS_WITHOUT_GAMEPLAY_PROOF"

    lines.append(f"Overall: {overall}")
    lines.append("")
    lines.append("Canonical expectations:")
    lines.append(f"- slot={expected_slot}")
    lines.append(f"- active=[{expected_active}]")
    lines.append(f"- min_stable_count={min_stable}")
    return "\n".join(lines) + "\n"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Score the post-title title->file-select milestone from existing probe reports.")
    parser.add_argument("--rom", required=True, help="ROM label, for example zelda_v437")
    parser.add_argument("--probe-report", help="Path to file_select_probe report")
    parser.add_argument("--state-report", help="Path to file_select_state_probe report")
    parser.add_argument("--start-report", help="Path to start injection or autostart path report")
    parser.add_argument("--expected-slot", type=int, default=3)
    parser.add_argument("--expected-active", default="00,00,00,01,01")
    parser.add_argument("--min-stable", type=int, default=90)
    parser.add_argument("--output", help="Optional output path; defaults to diag/reports/post_title_parity_<rom>.txt")
    return parser.parse_args()


def main() -> None:
    args = parse_args()

    probe_path = find_report(
        args.probe_report,
        args.rom,
        ["file_select_probe_{rom}.txt"],
    )
    state_path = find_report(
        args.state_report,
        args.rom,
        ["file_select_state_probe_{rom}.txt"],
    )
    start_path = find_report(
        args.start_report,
        args.rom,
        ["start_injection_{rom}.txt", "oracle_ram_start_{rom}.txt"],
    )

    report = build_report(
        rom=args.rom,
        probe_path=probe_path,
        state_path=state_path,
        start_path=start_path,
        expected_slot=args.expected_slot,
        expected_active=args.expected_active.upper(),
        min_stable=args.min_stable,
    )

    output_path = Path(args.output) if args.output else REPORTS / f"post_title_parity_{args.rom}.txt"
    output_path.write_text(report, encoding="utf-8")
    print(report, end="")


if __name__ == "__main__":
    main()