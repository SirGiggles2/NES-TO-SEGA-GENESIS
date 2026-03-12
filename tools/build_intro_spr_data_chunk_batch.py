from __future__ import annotations

import re
import subprocess
from pathlib import Path

from restore_bank02_title_tables import (
    MARK_BEGIN,
    MARK_END,
    TEXT_PAYLOAD_LABELS,
    cleanup_existing_auto_block,
    collect_directive_lines,
    parse_byte_expr,
    restore_labels,
)


ROOT = Path(__file__).resolve().parents[1]
BANK02 = ROOT / "src" / "banks" / "generated" / "bank_02_gen68k.asm"
BUILD_BAT = ROOT / "build" / "build.bat"

SPR_DATA = "tbl_90EE_spr_data:"
TEXT_PTRS = "tbl_94AD_demo_manual_text:"
LOGO_PALETTE = "tbl_94EE_logo_palette:"
SPR_DATA_SIZE = 0x70

FULL_DEMO_TEXT = [TEXT_PTRS, *TEXT_PAYLOAD_LABELS]
BASELINE_LABELS = [*FULL_DEMO_TEXT, LOGO_PALETTE]

VARIANTS = [
    {"name": "full_text_palette_ctrl", "spr_real_bytes": 0x00},
    {"name": "spr_0010_full_text_palette", "spr_real_bytes": 0x10},
    {"name": "spr_0020_full_text_palette", "spr_real_bytes": 0x20},
    {"name": "spr_0040_full_text_palette", "spr_real_bytes": 0x40},
    {"name": "spr_0070_full_text_palette", "spr_real_bytes": 0x70},
]

BYTE_RE = re.compile(r"\.BYTE\s+(.+?)\s+-- needs manual handling")


def run_checked(args: list[str]) -> None:
    subprocess.run(args, cwd=str(ROOT), check=True)


def extract_spr_data_bytes(text: str) -> list[int]:
    lines = text.splitlines()
    label_index = next(
        (idx for idx, line in enumerate(lines) if line.strip().startswith(SPR_DATA)),
        None,
    )
    if label_index is None:
        raise SystemExit(f"missing label: {SPR_DATA}")

    values: list[int] = []
    for line in collect_directive_lines(lines, label_index):
        match = BYTE_RE.search(line)
        if not match:
            continue
        values.extend(parse_byte_expr(expr.strip()) for expr in match.group(1).split(","))

    if len(values) != SPR_DATA_SIZE:
        raise SystemExit(
            f"unexpected {SPR_DATA} size: got {len(values)} bytes, expected {SPR_DATA_SIZE}"
        )
    return values


def apply_partial_spr_data(path: Path, source_bytes: list[int], real_bytes: int) -> None:
    if real_bytes < 0 or real_bytes > len(source_bytes):
        raise SystemExit(f"invalid spr_data byte count: {real_bytes}")

    patched = source_bytes[:real_bytes] + [0x00] * (len(source_bytes) - real_bytes)
    lines = path.read_text(encoding="utf-8").splitlines()
    label_index = next(
        (idx for idx, line in enumerate(lines) if line.strip().startswith(SPR_DATA)),
        None,
    )
    if label_index is None:
        raise SystemExit(f"missing label in working file: {SPR_DATA}")

    lines = cleanup_existing_auto_block(lines, label_index)

    block = [MARK_BEGIN]
    for offset in range(0, len(patched), 16):
        chunk = ",".join(f"${value:02X}" for value in patched[offset : offset + 16])
        block.append(f"    DC.B {chunk}")
    block.append(MARK_END)

    insert_at = label_index + 1
    for line in reversed(block):
        lines.insert(insert_at, line)

    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    original_bank02 = BANK02.read_text(encoding="utf-8")
    spr_source_bytes = extract_spr_data_bytes(original_bank02)

    try:
        for variant in VARIANTS:
            print(f"\n=== Building {variant['name']} ===")
            BANK02.write_text(original_bank02, encoding="utf-8")
            restore_labels(BANK02, BASELINE_LABELS)
            apply_partial_spr_data(BANK02, spr_source_bytes, variant["spr_real_bytes"])
            run_checked(["cmd.exe", "/c", str(BUILD_BAT)])
    finally:
        BANK02.write_text(original_bank02, encoding="utf-8")
        print("\nRestored source files to original state.")


if __name__ == "__main__":
    main()
