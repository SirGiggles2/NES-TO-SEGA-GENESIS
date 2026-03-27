from __future__ import annotations

import argparse
from pathlib import Path


REPORTS = Path(r"C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS\diag\reports")


def parse_report(path: Path) -> dict[str, str]:
    data: dict[str, str] = {}
    for raw in path.read_text(encoding="utf-8", errors="replace").splitlines():
        line = raw.strip()
        if not line or "=" not in line:
            continue
        key, value = line.split("=", 1)
        data[key.strip()] = value.strip()
    return data


def as_bool(value: str | None) -> bool | None:
    if value is None:
        return None
    text = value.strip().lower()
    if text == "true":
        return True
    if text == "false":
        return False
    return None


def as_int(value: str | None) -> int | None:
    if value is None:
        return None
    text = value.strip()
    if not text or text.lower() == "nil":
        return None
    try:
        return int(text)
    except ValueError:
        return None


def assess(data: dict[str, str]) -> tuple[str, list[str], list[str], list[str]]:
    passed: list[str] = []
    failed: list[str] = []
    warnings: list[str] = []

    gameplay_entry = as_int(data.get("gameplay_entry_frame"))
    gameplay_ready = as_int(data.get("gameplay_ready_frame"))
    movement_pass = as_bool(data.get("movement_pass"))
    pause_pass = as_bool(data.get("pause_pass"))
    room_transition_pass = as_bool(data.get("room_transition_pass"))
    transition_detected = as_bool(data.get("room_transition_detected"))

    if gameplay_entry is not None:
        passed.append(f"gameplay entry reached at frame {gameplay_entry}")
    else:
        failed.append("gameplay entry frame missing from interaction probe")

    if gameplay_ready is not None:
        passed.append(f"gameplay lane became ready at frame {gameplay_ready}")
    else:
        failed.append("gameplay ready frame missing from interaction probe")

    if movement_pass:
        passed.append(
            "movement check passed "
            f"(dx={data.get('movement_delta_x', 'nil')} dy={data.get('movement_delta_y', 'nil')})"
        )
    else:
        failed.append(
            "movement check failed "
            f"(dx={data.get('movement_delta_x', 'nil')} dy={data.get('movement_delta_y', 'nil')})"
        )

    if pause_pass:
        passed.append(
            "pause/resume check passed "
            f"(on={data.get('pause_on_frame', 'nil')} off={data.get('pause_off_frame', 'nil')})"
        )
    else:
        failed.append(
            "pause/resume check failed "
            f"(on={data.get('pause_on_frame', 'nil')} off={data.get('pause_off_frame', 'nil')})"
        )

    if room_transition_pass:
        passed.append(
            "room transition check passed "
            f"(direction={data.get('room_transition_direction', 'nil')} "
            f"map {data.get('room_transition_map_before', 'nil')} -> {data.get('room_transition_map_after', 'nil')})"
        )
    elif transition_detected:
        warnings.append(
            "room transition signal was detected but did not stabilize "
            f"(direction={data.get('room_transition_direction', 'nil')} "
            f"stable_count={data.get('room_transition_stable_count', '0')})"
        )
    else:
        warnings.append("room transition was not proven by the interaction probe")

    core_pass = movement_pass is True and pause_pass is True
    if room_transition_pass:
        status = "PASS"
    elif core_pass:
        status = "PASS_WITHOUT_ROOM_TRANSITION"
    else:
        status = "FAIL"

    if status != "PASS":
        warnings.append("next_room_debug=extend gameplay_interaction_probe with room-buffer/write tracing around the detected transition window")

    return status, passed, failed, warnings


def build_report(rom: str, report_path: Path) -> str:
    data = parse_report(report_path)
    status, passed, failed, warnings = assess(data)

    lines: list[str] = []
    lines.append("=== GAMEPLAY INTERACTION GATE ===")
    lines.append(f"ROM: {rom}")
    lines.append(f"Primary report: {report_path.name}")
    lines.append("")
    lines.append(f"Gameplay Gate 2: {status}")
    for item in passed:
        lines.append(f"- PASS: {item}")
    for item in failed:
        lines.append(f"- FAIL: {item}")
    for item in warnings:
        lines.append(f"- WARN: {item}")
    lines.append("")
    lines.append("Definition:")
    lines.append("- Gate 2 proves deterministic gameplay interaction after Gate 1.")
    lines.append("- Full PASS requires movement, pause/resume, and a stable room transition.")
    lines.append("- PASS_WITHOUT_ROOM_TRANSITION means core input works, but transition parity is not yet proven.")
    return "\n".join(lines) + "\n"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Score Gameplay Gate 2 (interaction parity).")
    parser.add_argument("--rom", required=True, help="ROM label, for example zelda_v601")
    parser.add_argument("--probe-report", help="Path to gameplay_interaction_probe report")
    parser.add_argument("--output", help="Output file path")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    report_path = Path(args.probe_report) if args.probe_report else REPORTS / f"gameplay_interaction_probe_{args.rom}.txt"
    if not report_path.exists():
        raise SystemExit(f"Missing interaction probe report: {report_path}")

    output = build_report(args.rom, report_path)
    output_path = Path(args.output) if args.output else REPORTS / f"gameplay_interaction_gate_{args.rom}.txt"
    output_path.write_text(output, encoding="utf-8")
    print(output, end="")


if __name__ == "__main__":
    main()
