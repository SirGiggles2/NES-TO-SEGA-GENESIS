from __future__ import annotations

import subprocess
from pathlib import Path

from restore_bank02_title_tables import EXTENDED_ONLY_LABELS, TEXT_PAYLOAD_LABELS, restore_labels


ROOT = Path(__file__).resolve().parents[1]
BANK02 = ROOT / "src" / "banks" / "generated" / "bank_02_gen68k.asm"
BUILD_BAT = ROOT / "build" / "build.bat"


SPR_DATA = "tbl_90EE_spr_data:"
TABLE_915E = "tbl_915E:"
TEXT_PTRS = "tbl_94AD_demo_manual_text:"
LOGO_PALETTE = "tbl_94EE_logo_palette:"

FULL_DEMO_TEXT = [TEXT_PTRS, *TEXT_PAYLOAD_LABELS]
BAD_BASE = [SPR_DATA, *FULL_DEMO_TEXT, LOGO_PALETTE]


VARIANTS = [
    {"name": "bad_base", "labels": BAD_BASE},
    {"name": "bad_plus_915E", "labels": [TABLE_915E, *BAD_BASE]},
    {"name": "bad_plus_extended", "labels": [*BAD_BASE, *EXTENDED_ONLY_LABELS]},
    {"name": "bad_plus_915E_extended", "labels": [TABLE_915E, *BAD_BASE, *EXTENDED_ONLY_LABELS]},
    {"name": "all_title_data", "labels": [SPR_DATA, TABLE_915E, *FULL_DEMO_TEXT, LOGO_PALETTE, *EXTENDED_ONLY_LABELS]},
]


def run_checked(args: list[str]) -> None:
    subprocess.run(args, cwd=str(ROOT), check=True)


def main() -> None:
    original_bank02 = BANK02.read_text(encoding="utf-8")

    try:
        for variant in VARIANTS:
            print(f"\n=== Building {variant['name']} ===")
            BANK02.write_text(original_bank02, encoding="utf-8")
            restore_labels(BANK02, variant["labels"])
            run_checked(["cmd.exe", "/c", str(BUILD_BAT)])
    finally:
        BANK02.write_text(original_bank02, encoding="utf-8")
        print("\nRestored source files to original state.")


if __name__ == "__main__":
    main()
