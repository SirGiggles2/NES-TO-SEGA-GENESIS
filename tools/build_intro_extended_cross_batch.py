from __future__ import annotations

import subprocess
from pathlib import Path

from restore_bank02_title_tables import TEXT_PAYLOAD_LABELS, restore_labels


ROOT = Path(__file__).resolve().parents[1]
BANK02 = ROOT / "src" / "banks" / "generated" / "bank_02_gen68k.asm"
BUILD_BAT = ROOT / "build" / "build.bat"

SPR_DATA = "tbl_90EE_spr_data:"
TABLE_915E = "tbl_915E:"
TEXT_PTRS = "tbl_94AD_demo_manual_text:"
LOGO_PALETTE = "tbl_94EE_logo_palette:"

FULL_DEMO_TEXT = [TEXT_PTRS, *TEXT_PAYLOAD_LABELS]
BAD_BASE = [SPR_DATA, *FULL_DEMO_TEXT, LOGO_PALETTE]

TEXT_9240 = ["tbl_9240:"]
TEXT_9256 = ["tbl_9256:"]
TEXT_BOTH = [*TEXT_9240, *TEXT_9256]

SPR_POS = [
    "tbl_9268_pos_X_44:",
    "tbl_9269_pos_X_AC:",
]
SPR_TILES_ATTR = [
    "tbl_926A_spr_T:",
    "tbl_9282_spr_A:",
]
SPR_ALL = [*SPR_POS, *SPR_TILES_ATTR]

VARIANTS = [
    {"name": "bad_plus_915E", "labels": [TABLE_915E, *BAD_BASE]},
    {"name": "bad_plus_915E_9240_spr_all", "labels": [TABLE_915E, *BAD_BASE, *TEXT_9240, *SPR_ALL]},
    {"name": "bad_plus_915E_9256_spr_all", "labels": [TABLE_915E, *BAD_BASE, *TEXT_9256, *SPR_ALL]},
    {"name": "bad_plus_915E_text_all_spr_pos", "labels": [TABLE_915E, *BAD_BASE, *TEXT_BOTH, *SPR_POS]},
    {"name": "bad_plus_915E_text_all_spr_tiles_attr", "labels": [TABLE_915E, *BAD_BASE, *TEXT_BOTH, *SPR_TILES_ATTR]},
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
