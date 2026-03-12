from __future__ import annotations

import subprocess
from pathlib import Path

from restore_bank02_title_tables import CORE_LABELS, restore_labels


ROOT = Path(__file__).resolve().parents[1]
BANK02 = ROOT / "src" / "banks" / "generated" / "bank_02_gen68k.asm"
BUILD_BAT = ROOT / "build" / "build.bat"


SPR_DATA = "tbl_90EE_spr_data:"
TABLE_915E = "tbl_915E:"
TEXT_PTRS = "tbl_94AD_demo_manual_text:"
PALETTE = "tbl_94EE_logo_palette:"


VARIANTS = [
    {"name": "control", "labels": []},
    {"name": "spr_data", "labels": [SPR_DATA]},
    {"name": "tbl_915E", "labels": [TABLE_915E]},
    {"name": "demo_text_ptrs", "labels": [TEXT_PTRS]},
    {"name": "logo_palette", "labels": [PALETTE]},
    {"name": "core_no_palette", "labels": [SPR_DATA, TABLE_915E, TEXT_PTRS]},
    {"name": "core_full", "labels": CORE_LABELS},
]


def run_checked(args: list[str]) -> None:
    subprocess.run(args, cwd=str(ROOT), check=True)


def apply_labels(labels: list[str]) -> None:
    if labels:
        restore_labels(BANK02, labels)


def main() -> None:
    original_bank02 = BANK02.read_text(encoding="utf-8")

    try:
        for variant in VARIANTS:
            print(f"\n=== Building {variant['name']} ===")
            BANK02.write_text(original_bank02, encoding="utf-8")
            apply_labels(variant["labels"])
            run_checked(["cmd.exe", "/c", str(BUILD_BAT)])
    finally:
        BANK02.write_text(original_bank02, encoding="utf-8")
        print("\nRestored source files to original state.")


if __name__ == "__main__":
    main()
