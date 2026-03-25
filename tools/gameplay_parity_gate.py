from __future__ import annotations

import argparse
import re
from dataclasses import dataclass
from pathlib import Path


REPORTS = Path(r"C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS\diag\reports")

FINAL_RE = re.compile(
    r"final\s+frame=(?P<frame>\d+)\s+script=(?P<script>\d+)\s+sub=(?P<sub>\d+)\s+ready=(?P<ready>\d+)\s+ppu=0x(?P<ppu>[0-9A-Fa-f]+)"
)
SNAPSHOT_RE = re.compile(
    r"\bframe=(?P<frame>\d+)\s+script=(?P<script>\d+)\s+sub=(?P<sub>\d+)\s+ready=(?P<ready>\d+)\s+ppu=0x(?P<ppu>[0-9A-Fa-f]+)"
)
GAMEPLAY_ENTRY_RE = re.compile(r"gameplay_entry_frame=(?P<entry>\d+|nil)")
ENTRY_LINE_RE = re.compile(r"\bentry\s+frame=(?P<entry>\d+)")
ENTRY_MARK_RE = re.compile(r"\*\*\* GAMEPLAY ENTRY \*\*\*")
MOVE_RE = re.compile(r"^move\s+frame=", re.MULTILINE)
SHOT_RE = re.compile(r"captured=|screenshot=|screenshot:")

ATTR_SCRIPT_RE = re.compile(r"^Script:\s+(?P<script>\d+)", re.MULTILINE)
ATTR_FRAME_RE = re.compile(r"^Frame:\s+(?P<frame>\d+)", re.MULTILINE)


@dataclass
class GameplayReport:
    path: Path
    final_frame: int | None = None
    final_script: int | None = None
    final_sub: int | None = None
    final_ready: int | None = None
    final_ppu: int | None = None
    gameplay_entry_frame: int | None = None
    has_entry_marker: bool = False
    move_events: int = 0
    shots: int = 0


@dataclass
class AttrReport:
    path: Path
    frame: int | None = None
    script: int | None = None


def parse_gameplay_report(path: Path) -> GameplayReport:
    text = path.read_text(encoding="utf-8", errors="replace")
    report = GameplayReport(path=path)

    final = None
    for match in FINAL_RE.finditer(text):
        final = match
    if final:
        report.final_frame = int(final.group("frame"))
        report.final_script = int(final.group("script"))
        report.final_sub = int(final.group("sub"))
        report.final_ready = int(final.group("ready"))
        report.final_ppu = int(final.group("ppu"), 16)
    else:
        # Some probes do not emit a dedicated final line, so infer from the last state snapshot.
        snapshot = None
        for match in SNAPSHOT_RE.finditer(text):
            snapshot = match
        if snapshot:
            report.final_frame = int(snapshot.group("frame"))
            report.final_script = int(snapshot.group("script"))
            report.final_sub = int(snapshot.group("sub"))
            report.final_ready = int(snapshot.group("ready"))
            report.final_ppu = int(snapshot.group("ppu"), 16)

    entry = GAMEPLAY_ENTRY_RE.search(text)
    if entry and entry.group("entry") != "nil":
        report.gameplay_entry_frame = int(entry.group("entry"))
    else:
        entry_line = ENTRY_LINE_RE.search(text)
        if entry_line:
            report.gameplay_entry_frame = int(entry_line.group("entry"))

    report.has_entry_marker = ENTRY_MARK_RE.search(text) is not None
    report.move_events = len(MOVE_RE.findall(text))
    report.shots = len(SHOT_RE.findall(text))
    return report


def parse_attr_report(path: Path) -> AttrReport:
    text = path.read_text(encoding="utf-8", errors="replace")
    report = AttrReport(path=path)

    frame = ATTR_FRAME_RE.search(text)
    if frame:
        report.frame = int(frame.group("frame"))

    script = ATTR_SCRIPT_RE.search(text)
    if script:
        report.script = int(script.group("script"))
    return report


def existing(path_arg: str | None, default_name: str) -> Path | None:
    if path_arg:
        path = Path(path_arg)
        return path if path.exists() else None
    path = REPORTS / default_name
    return path if path.exists() else None


def assess(primary: GameplayReport, secondary: GameplayReport | None, attr: AttrReport | None) -> tuple[str, list[str], list[str]]:
    passed: list[str] = []
    issues: list[str] = []

    if primary.gameplay_entry_frame is not None or primary.has_entry_marker:
        passed.append(f"gameplay entry logged in {primary.path.name}")
    else:
        issues.append(f"gameplay entry was not logged in {primary.path.name}")

    if (primary.final_script or 0) >= 5:
        passed.append(f"final script is gameplay lane (script={primary.final_script})")
    else:
        issues.append(f"final script is below gameplay lane (script={primary.final_script})")

    if primary.gameplay_entry_frame is not None and primary.final_frame is not None:
        stable_window = primary.final_frame - primary.gameplay_entry_frame
        if stable_window >= 120:
            passed.append(f"stability window after gameplay entry is {stable_window} frames")
        else:
            issues.append(f"stability window after gameplay entry is only {stable_window} frames")

    if primary.shots > 0:
        passed.append(f"captured {primary.shots} gameplay screenshot markers")
    else:
        issues.append("no gameplay screenshots were captured by probe")

    if secondary is not None:
        if (secondary.final_script or 0) >= 5:
            passed.append(f"secondary report confirms gameplay lane (script={secondary.final_script})")
        else:
            issues.append(f"secondary report does not confirm gameplay lane (script={secondary.final_script})")

    if attr is not None:
        if (attr.script or 0) >= 5:
            passed.append(f"attr dump confirms gameplay lane (script={attr.script})")
        else:
            issues.append(f"attr dump did not reach gameplay lane (script={attr.script})")

    status = "PASS" if not issues else "FAIL"
    if status == "PASS" and (secondary is None or attr is None):
        status = "PASS_WITHOUT_FULL_TRIANGULATION"
    return status, passed, issues


def build_output(
    rom: str,
    probe: GameplayReport | None,
    state: GameplayReport | None,
    attr: AttrReport | None,
) -> str:
    lines: list[str] = []
    lines.append("=== GAMEPLAY PARITY GATE ===")
    lines.append(f"ROM: {rom}")
    lines.append("")

    if probe is None and state is None:
        lines.append("Overall: FAIL")
        lines.append("No gameplay probe/state report found.")
        return "\n".join(lines) + "\n"

    primary = probe if probe is not None else state
    secondary = state if probe is not None and state is not None else None

    lines.append(f"Primary report: {primary.path.name}")
    if secondary is not None:
        lines.append(f"Secondary report: {secondary.path.name}")
    if attr is not None:
        lines.append(f"Attr report: {attr.path.name}")
    lines.append("")

    status, passed, issues = assess(primary, secondary, attr)

    lines.append(f"Gameplay Gate 1: {status}")
    for item in passed:
        lines.append(f"- PASS: {item}")
    for item in issues:
        lines.append(f"- FAIL: {item}")
    lines.append("")

    lines.append("Definition:")
    lines.append("- Gate 1 targets file-select -> first stable gameplay lane (script >= 5).")
    lines.append("- Passing this gate means gameplay entry is proven, not full gameplay perfection.")
    return "\n".join(lines) + "\n"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Score Gameplay Gate 1 (file-select to gameplay lane).")
    parser.add_argument("--rom", required=True, help="ROM label, for example zelda_v526")
    parser.add_argument("--probe-report", help="Path to gameplay_probe report")
    parser.add_argument("--state-report", help="Path to gameplay_state report")
    parser.add_argument("--attr-report", help="Path to attr_gameplay report")
    parser.add_argument("--output", help="Output file path")
    return parser.parse_args()


def main() -> None:
    args = parse_args()

    probe_path = existing(args.probe_report, f"gameplay_probe_{args.rom}.txt")
    state_path = existing(args.state_report, f"gameplay_state_{args.rom}.txt")
    attr_path = existing(args.attr_report, f"attr_gameplay_{args.rom}.txt")

    probe = parse_gameplay_report(probe_path) if probe_path else None
    state = parse_gameplay_report(state_path) if state_path else None
    attr = parse_attr_report(attr_path) if attr_path else None

    output = build_output(args.rom, probe, state, attr)
    output_path = Path(args.output) if args.output else REPORTS / f"gameplay_parity_{args.rom}.txt"
    output_path.write_text(output, encoding="utf-8")
    print(output, end="")


if __name__ == "__main__":
    main()