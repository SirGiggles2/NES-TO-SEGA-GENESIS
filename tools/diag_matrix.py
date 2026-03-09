#!/usr/bin/env python3
"""Summarize saved BizHawk diag reports and map crash PCs to build listings."""

from __future__ import annotations

import bisect
import pathlib
import re
import sys
from dataclasses import dataclass


ROOT = pathlib.Path(__file__).resolve().parent.parent
REPORT_DIR = ROOT / "diag" / "reports"
BUILD_DIR = ROOT / "build"

ROM_RE = re.compile(r"ROM:\s+(\S+)")
FRAMES_RE = re.compile(r"Frames:\s+(\d+)")
SCORE_RE = re.compile(r"Score:\s+(\d+) PASS / (\d+) FAIL / (\d+) WARN")
CRASH_RE = re.compile(
    r"EXCEPTION_HANDLER hit! vector=\$(?P<vector>[0-9A-Fa-f]{4}) (?P<name>.+?) crash_pc=\$(?P<pc>[0-9A-Fa-f]{8})"
)
LEGACY_CRASH_RE = re.compile(r"EXCEPTION_HANDLER hit! crash_pc=\$(?P<pc>[0-9A-Fa-f]{8})")
CHECKPOINT_RE = re.compile(r"Last checkpoint:\s+\$(?P<id>[0-9A-Fa-f]{4})\s+(?P<name>.*)")
TRACE_SEQ_RE = re.compile(r"Trace sequence:\s+(?P<seq>\d+)")
FAULT_RE = re.compile(r"Fault address:\s+\$(?P<addr>[0-9A-Fa-f]{8})")
LISTING_RE = re.compile(r"^\d\d:([0-9A-Fa-f]{8})\s+[0-9A-Fa-f]+\s+\d+:\s+(.*)$")


@dataclass
class ReportSummary:
    report_path: pathlib.Path
    rom_name: str
    frames: int | None
    score: tuple[int, int, int] | None
    crash_vector: str | None
    crash_name: str | None
    crash_pc: int | None
    last_checkpoint: str | None
    last_checkpoint_name: str | None
    trace_seq: int | None
    fault_addr: int | None


def version_key(name: str) -> tuple[int, str]:
    match = re.search(r"_v(\d+)", name)
    if match:
        return (int(match.group(1)), name)
    return (-1, name)


def parse_report(path: pathlib.Path) -> ReportSummary:
    rom_name = path.stem
    frames = None
    score = None
    crash_vector = None
    crash_name = None
    crash_pc = None
    last_checkpoint = None
    last_checkpoint_name = None
    trace_seq = None
    fault_addr = None

    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        if rom_name == path.stem:
            match = ROM_RE.search(line)
            if match:
                rom_name = match.group(1)
        if frames is None:
            match = FRAMES_RE.search(line)
            if match:
                frames = int(match.group(1))
        if score is None:
            match = SCORE_RE.search(line)
            if match:
                score = tuple(int(match.group(i)) for i in range(1, 4))
        if crash_pc is None:
            match = CRASH_RE.search(line)
            if match:
                crash_vector = match.group("vector")
                crash_name = match.group("name")
                crash_pc = int(match.group("pc"), 16)
                continue
            legacy = LEGACY_CRASH_RE.search(line)
            if legacy:
                crash_pc = int(legacy.group("pc"), 16)
        if last_checkpoint is None:
            match = CHECKPOINT_RE.search(line)
            if match:
                last_checkpoint = match.group("id").upper()
                last_checkpoint_name = match.group("name").strip()
        if trace_seq is None:
            match = TRACE_SEQ_RE.search(line)
            if match:
                trace_seq = int(match.group("seq"))
        if fault_addr is None:
            match = FAULT_RE.search(line)
            if match:
                fault_addr = int(match.group("addr"), 16)

    return ReportSummary(
        report_path=path,
        rom_name=rom_name,
        frames=frames,
        score=score,
        crash_vector=crash_vector,
        crash_name=crash_name,
        crash_pc=crash_pc,
        last_checkpoint=last_checkpoint,
        last_checkpoint_name=last_checkpoint_name,
        trace_seq=trace_seq,
        fault_addr=fault_addr,
    )


def load_listing(path: pathlib.Path) -> tuple[list[int], list[str]]:
    addrs: list[int] = []
    texts: list[str] = []
    if not path.exists():
        return addrs, texts
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        match = LISTING_RE.match(line)
        if not match:
            continue
        addrs.append(int(match.group(1), 16))
        texts.append(match.group(2).strip())
    return addrs, texts


def lookup_listing(pc: int | None, listing_path: pathlib.Path) -> str:
    if pc is None or not listing_path.exists():
        return "-"
    addrs, texts = load_listing(listing_path)
    if not addrs:
        return "-"
    idx = bisect.bisect_right(addrs, pc) - 1
    if idx < 0:
        return "-"
    return f"${addrs[idx]:06X} {texts[idx]}"


def iter_reports(args: list[str]) -> list[pathlib.Path]:
    if args:
        return [pathlib.Path(arg).resolve() for arg in args]
    if not REPORT_DIR.exists():
        return []
    seen: dict[pathlib.Path, None] = {}
    for pattern in ("diag_report_v*.txt", "diag_report_zelda_v*.txt"):
        for path in REPORT_DIR.glob(pattern):
            seen[path.resolve()] = None
    return sorted(seen.keys(), key=lambda p: version_key(p.name))


def format_score(score: tuple[int, int, int] | None) -> str:
    if not score:
        return "-"
    return f"{score[0]}/{score[1]}/{score[2]}"


def main(argv: list[str]) -> int:
    reports = iter_reports(argv[1:])
    if not reports:
        print("No diag reports found.")
        return 1

    summaries = [parse_report(path) for path in reports]

    print("ROM        Frames  Score   Crash PC   Vector  Checkpoint  Trace  Fault Addr  Listing")
    print("-" * 110)
    for summary in summaries:
        rom_base = pathlib.Path(summary.rom_name).stem
        listing = BUILD_DIR / f"{rom_base}.lst"
        vector = summary.crash_vector or "-"
        checkpoint = summary.last_checkpoint or "-"
        trace_seq = str(summary.trace_seq) if summary.trace_seq is not None else "-"
        crash_pc = f"${summary.crash_pc:08X}" if summary.crash_pc is not None else "-"
        fault_addr = f"${summary.fault_addr:08X}" if summary.fault_addr is not None else "-"
        listing_hit = lookup_listing(summary.crash_pc, listing)
        print(
            f"{rom_base:<10} "
            f"{str(summary.frames or '-'):>6}  "
            f"{format_score(summary.score):<7} "
            f"{crash_pc:<10} "
            f"{vector:<6} "
            f"{checkpoint:<10} "
            f"{trace_seq:<5} "
            f"{fault_addr:<10} "
            f"{listing_hit}"
        )
        if summary.crash_name:
            print(f"  crash: {summary.crash_name}")
        if summary.last_checkpoint_name:
            print(f"  trace: {summary.last_checkpoint_name}")
        print(f"  report: {summary.report_path}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
