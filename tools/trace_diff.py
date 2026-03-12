#!/usr/bin/env python3
"""Compare two Zelda oracle traces and report the first useful divergence."""

from __future__ import annotations

import csv
import sys
from pathlib import Path

META_FIELDS = {"frame", "system", "rom_label"}
NON_STATE_FIELDS = {"pc"}
ALIGNMENT_RULES = (
    ("screen_ready", "01", "screen_ready=01"),
    ("ram_script", "nonzero", "ram_script!=00"),
    ("ram_frm_cnt", "nonzero", "ram_frm_cnt!=00"),
    ("ram_for_2001", "nonzero", "ram_for_2001!=00"),
)
FOCUS_FIELDS = (
    "ram_script",
    "ram_subscript",
    "screen_ready",
    "ppu_load_index",
    "ram_frm_cnt",
    "ram_005C",
    "ram_00E7",
    "ram_map_location",
    "ram_next_map_location",
    "ram_0000_t41",
    "ram_0000_t42",
    "ram_for_2001",
    "ppu_buf_status",
    "ppu_buf_index",
    "ppu_buf_0",
    "ppu_buf_1",
    "ppu_buf_2",
    "ppu_buf_3",
    "ppu_buf_4",
    "ppu_buf_5",
    "ppu_buf_6",
    "ppu_buf_7",
    "PPU_REQ_INDEX",
    "PPU_REQ_PTR",
    "PPU_REQ_RES",
    "SEQ_EVT_COUNT",
    "PPU_EVT_COUNT",
    "ram_music",
    "ram_music_busy",
    "pc",
)


def normalize_value(field: str, value: str) -> str:
    text = (value or "").strip().upper()
    if text == "":
        return "00" if field != "pc" else ""
    if field == "pc":
        return text
    if all(ch in "0123456789ABCDEF" for ch in text):
        return text.lstrip("0") or "0"
    return text


def load_rows(path: Path):
    with path.open("r", newline="", encoding="utf-8") as handle:
        reader = csv.DictReader(handle)
        rows = []
        for raw in reader:
            row = dict(raw)
            row["frame"] = int(raw["frame"])
            rows.append(row)
        return rows


def sibling_event_trace(path: Path) -> Path | None:
    name = path.name
    if not name.startswith("oracle_trace_"):
        return None
    return path.with_name(name.replace("oracle_trace_", "oracle_events_", 1))


def summarize_event_trace(path: Path):
    if path is None or not path.exists():
        return None

    rows = load_rows(path)
    if not rows:
        return {"path": path, "count": 0, "by_kind": {}, "recent": []}

    by_kind: dict[str, int] = {}
    for row in rows:
        kind = row.get("kind", "")
        by_kind[kind] = by_kind.get(kind, 0) + 1

    return {
        "path": path,
        "count": len(rows),
        "by_kind": by_kind,
        "recent": rows[-8:],
    }


def field_matches(row: dict[str, str], field: str, target: str) -> bool:
    value = normalize_value(field, row.get(field, ""))
    if target == "nonzero":
        return value not in {"", "0", "00"}
    return value == normalize_value(field, target)


def find_alignment(rows, field: str, target: str):
    for index, row in enumerate(rows):
        if field_matches(row, field, target):
            return index
    return None


def pick_alignment(nes_rows, gen_rows):
    for field, target, label in ALIGNMENT_RULES:
        nes_index = find_alignment(nes_rows, field, target)
        gen_index = find_alignment(gen_rows, field, target)
        if nes_index is not None and gen_index is not None:
            return {
                "field": field,
                "target": target,
                "label": label,
                "nes_index": nes_index,
                "gen_index": gen_index,
            }
    return {
        "field": "frame",
        "target": "0",
        "label": "frame=0",
        "nes_index": 0,
        "gen_index": 0,
    }


def compare_rows(nes_rows, gen_rows, alignment):
    shared_fields = [
        field
        for field in nes_rows[0].keys()
        if field in gen_rows[0] and field not in META_FIELDS
    ]

    nes_start = alignment["nes_index"]
    gen_start = alignment["gen_index"]
    limit = min(len(nes_rows) - nes_start, len(gen_rows) - gen_start)
    first_state = None
    first_any = None
    field_first = {}

    for offset in range(limit):
        nes = nes_rows[nes_start + offset]
        gen = gen_rows[gen_start + offset]
        for field in shared_fields:
            nes_value = normalize_value(field, nes[field])
            gen_value = normalize_value(field, gen[field])
            if nes_value != gen_value:
                detail = {
                    "offset": offset,
                    "field": field,
                    "nes": nes[field],
                    "gen": gen[field],
                    "nes_index": nes_start + offset,
                    "gen_index": gen_start + offset,
                    "nes_frame": nes["frame"],
                    "gen_frame": gen["frame"],
                }
                field_first.setdefault(field, detail)
                if first_any is None:
                    first_any = detail
                if field not in NON_STATE_FIELDS and first_state is None:
                    first_state = detail
        if first_state is not None:
            break

    return shared_fields, first_state, first_any, field_first, limit


def print_window(nes_rows, gen_rows, detail, fields):
    if detail is None:
        return

    nes_index = detail["nes_index"]
    gen_index = detail["gen_index"]
    start = max(0, min(nes_index, gen_index) - 3)
    nes_end = min(len(nes_rows), nes_index + 4)
    gen_end = min(len(gen_rows), gen_index + 4)
    rows = max(nes_end - max(0, nes_index - 3), gen_end - max(0, gen_index - 3))

    print("\nContext around divergence:")
    header = ["frame"] + fields
    print("  " + " | ".join(f"{name:>14}" for name in header))

    for offset in range(rows):
        nes_pos = max(0, nes_index - 3) + offset
        gen_pos = max(0, gen_index - 3) + offset
        if nes_pos >= len(nes_rows) or gen_pos >= len(gen_rows):
            break
        nes = nes_rows[nes_pos]
        gen = gen_rows[gen_pos]
        print(f"    A {' | '.join(f'{nes[name]:>14}' for name in header)}")
        print(f"    B {' | '.join(f'{gen[name]:>14}' for name in header)}")
        print("  " + "-" * (17 * len(header)))


def main(argv):
    if len(argv) != 3:
        print("Usage: py -3 tools/trace_diff.py <trace_a.csv> <trace_b.csv>")
        return 1

    nes_path = Path(argv[1])
    gen_path = Path(argv[2])

    if not nes_path.exists():
        print(f"ERROR: Missing trace A: {nes_path}")
        return 1
    if not gen_path.exists():
        print(f"ERROR: Missing trace B: {gen_path}")
        return 1

    nes_rows = load_rows(nes_path)
    gen_rows = load_rows(gen_path)

    if not nes_rows or not gen_rows:
        print("ERROR: One of the traces is empty.")
        return 1

    alignment = pick_alignment(nes_rows, gen_rows)
    shared_fields, first_state, first_any, field_first, limit = compare_rows(
        nes_rows, gen_rows, alignment
    )

    print("Zelda trace diff")
    print(f"  Trace A:  {nes_path}")
    print(f"  Trace B:  {gen_path}")
    print(f"  Alignment: {alignment['label']}")
    print(
        f"  Start frames: A {nes_rows[alignment['nes_index']]['frame']} | "
        f"B {gen_rows[alignment['gen_index']]['frame']}"
    )
    print(f"  Frames compared after alignment: {limit}")

    for label, summary in (
        ("Trace A", summarize_event_trace(sibling_event_trace(nes_path))),
        ("Trace B", summarize_event_trace(sibling_event_trace(gen_path))),
    ):
        if summary is None:
            continue
        print(f"\n{label} event trace:")
        print(f"  Path: {summary['path']}")
        print(f"  Rows: {summary['count']}")
        if summary["by_kind"]:
            parts = [f"{kind}={count}" for kind, count in sorted(summary["by_kind"].items())]
            print(f"  By kind: {', '.join(parts)}")
        if summary["recent"]:
            print("  Recent events:")
            for row in summary["recent"]:
                print(
                    "    frame {frame:>3}  {kind:<3}  {event_id}  {event_name}  total={total_count}".format(
                        frame=row.get("frame", "?"),
                        kind=row.get("kind", ""),
                        event_id=row.get("event_id", ""),
                        event_name=row.get("event_name", ""),
                        total_count=row.get("total_count", ""),
                    )
                )

    if first_state is None and first_any is None:
        print("\nNo divergence found in shared fields.")
        return 0

    if first_state is not None:
        print("\nFirst state divergence:")
        print(f"  Trace A frame:  {first_state['nes_frame']}")
        print(f"  Trace B frame:  {first_state['gen_frame']}")
        print(f"  Field:          {first_state['field']}")
        print(f"  Trace A:        {first_state['nes']}")
        print(f"  Trace B:        {first_state['gen']}")
    else:
        print("\nNo state divergence found.")

    if first_any is not None and (
        first_state is None
        or first_any["nes_index"] != first_state["nes_index"]
        or first_any["field"] != first_state["field"]
    ):
        print("\nFirst divergence of any kind:")
        print(f"  Trace A frame:  {first_any['nes_frame']}")
        print(f"  Trace B frame:  {first_any['gen_frame']}")
        print(f"  Field:          {first_any['field']}")
        print(f"  Trace A:        {first_any['nes']}")
        print(f"  Trace B:        {first_any['gen']}")

    print("\nEarliest divergence by field:")
    for field, detail in sorted(
        field_first.items(),
        key=lambda item: (item[1]["offset"], item[0]),
    ):
        marker = " (non-state)" if field in NON_STATE_FIELDS else ""
        print(
            f"  {field:<16} offset {detail['offset']} "
            f"(Trace A frame {detail['nes_frame']}, Trace B frame {detail['gen_frame']}){marker}"
        )

    focus_fields = [
        field
        for field in FOCUS_FIELDS
        if field in shared_fields
    ]
    print_window(nes_rows, gen_rows, first_state or first_any, focus_fields)
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
