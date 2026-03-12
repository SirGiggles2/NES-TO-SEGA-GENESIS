from __future__ import annotations

import re
import subprocess
from pathlib import Path

from restore_bank02_title_tables import (
    EXTENDED_ONLY_LABELS,
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
TABLE_915E = "tbl_915E:"
TEXT_PTRS = "tbl_94AD_demo_manual_text:"
LOGO_PALETTE = "tbl_94EE_logo_palette:"

FULL_DEMO_TEXT = [TEXT_PTRS, *TEXT_PAYLOAD_LABELS]
BASELINE_LABELS = [*FULL_DEMO_TEXT, LOGO_PALETTE]

BYTE_RE = re.compile(r"\.BYTE\s+(.+?)\s+-- needs manual handling")
WORD_RAW_RE = re.compile(r"orig:.*?:\s*([0-9A-Fa-f]{2})\s+([0-9A-Fa-f]{2})\s+\.word")
DBYT_RE = re.compile(r"\.DBYT\s+(\$[0-9A-Fa-f]{4})")

VARIANTS = [
    {
        "name": "zero_spr_base",
        "labels": {
            SPR_DATA: "zero",
        },
    },
    {
        "name": "zero_spr_zero_915E_zero_ext",
        "labels": {
            SPR_DATA: "zero",
            TABLE_915E: "zero",
            **{label: "zero" for label in EXTENDED_ONLY_LABELS},
        },
    },
    {
        "name": "zero_spr_real_915E_zero_ext",
        "labels": {
            SPR_DATA: "zero",
            TABLE_915E: "real",
            **{label: "zero" for label in EXTENDED_ONLY_LABELS},
        },
    },
    {
        "name": "zero_spr_zero_915E_real_ext",
        "labels": {
            SPR_DATA: "zero",
            TABLE_915E: "zero",
            **{label: "real" for label in EXTENDED_ONLY_LABELS},
        },
    },
    {
        "name": "zero_spr_real_915E_real_ext",
        "labels": {
            SPR_DATA: "zero",
            TABLE_915E: "real",
            **{label: "real" for label in EXTENDED_ONLY_LABELS},
        },
    },
]


def run_checked(args: list[str]) -> None:
    subprocess.run(args, cwd=str(ROOT), check=True)


def extract_label_bytes(text: str, label: str) -> list[int]:
    lines = text.splitlines()
    label_index = next(
        (idx for idx, line in enumerate(lines) if line.strip().startswith(label)),
        None,
    )
    if label_index is None:
        raise SystemExit(f"missing label: {label}")

    values: list[int] = []
    for line in collect_directive_lines(lines, label_index):
        dbyt_match = DBYT_RE.search(line)
        if dbyt_match:
            value = int(dbyt_match.group(1)[1:], 16)
            values.extend([(value >> 8) & 0xFF, value & 0xFF])
            continue

        byte_match = BYTE_RE.search(line)
        if byte_match:
            values.extend(parse_byte_expr(expr.strip()) for expr in byte_match.group(1).split(","))
            continue

        word_match = WORD_RAW_RE.search(line)
        if word_match:
            values.extend([int(word_match.group(1), 16), int(word_match.group(2), 16)])
            continue

        raise SystemExit(f"unsupported directive in {label}: {line}")

    if not values:
        raise SystemExit(f"no bytes extracted for {label}")
    return values


def apply_label_bytes(path: Path, label: str, values: list[int]) -> None:
    lines = path.read_text(encoding="utf-8").splitlines()
    label_index = next(
        (idx for idx, line in enumerate(lines) if line.strip().startswith(label)),
        None,
    )
    if label_index is None:
        raise SystemExit(f"missing label in working file: {label}")

    lines = cleanup_existing_auto_block(lines, label_index)

    block = [MARK_BEGIN]
    for offset in range(0, len(values), 16):
        chunk = ",".join(f"${value:02X}" for value in values[offset : offset + 16])
        block.append(f"    DC.B {chunk}")
    if len(values) & 1:
        block.append("    EVEN")
    block.append(MARK_END)

    insert_at = label_index + 1
    for line in reversed(block):
        lines.insert(insert_at, line)

    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    original_bank02 = BANK02.read_text(encoding="utf-8")
    source_bytes = {
        label: extract_label_bytes(original_bank02, label)
        for label in [SPR_DATA, TABLE_915E, *EXTENDED_ONLY_LABELS]
    }

    try:
        for variant in VARIANTS:
            print(f"\n=== Building {variant['name']} ===")
            BANK02.write_text(original_bank02, encoding="utf-8")
            restore_labels(BANK02, BASELINE_LABELS)

            for label, mode in variant["labels"].items():
                values = source_bytes[label]
                if mode == "zero":
                    apply_label_bytes(BANK02, label, [0x00] * len(values))
                elif mode == "real":
                    apply_label_bytes(BANK02, label, values)
                else:
                    raise SystemExit(f"unsupported mode for {label}: {mode}")

            run_checked(["cmd.exe", "/c", str(BUILD_BAT)])
    finally:
        BANK02.write_text(original_bank02, encoding="utf-8")
        print("\nRestored source files to original state.")


if __name__ == "__main__":
    main()
