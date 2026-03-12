from __future__ import annotations

import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BANK02 = ROOT / "src" / "banks" / "generated" / "bank_02_gen68k.asm"
BUILD_BAT = ROOT / "build" / "build.bat"
RESTORE_SCRIPT = ROOT / "tools" / "restore_bank02_title_tables.py"


VARIANTS = [
    {"name": "control", "profiles": []},
    {"name": "core", "profiles": ["core"]},
    {"name": "text", "profiles": ["text"]},
    {"name": "core_text", "profiles": ["core", "text"]},
    {"name": "extended", "profiles": ["extended"]},
    {"name": "full", "profiles": ["full"]},
]


def run_checked(args: list[str]) -> None:
    subprocess.run(args, cwd=str(ROOT), check=True)


def apply_profiles(profiles: list[str]) -> None:
    for profile in profiles:
        run_checked(
            [
                sys.executable,
                str(RESTORE_SCRIPT),
                str(BANK02),
                "--profile",
                profile,
            ]
        )


def main() -> None:
    original_bank02 = BANK02.read_text(encoding="utf-8")

    try:
        for variant in VARIANTS:
            print(f"\n=== Building {variant['name']} ===")
            BANK02.write_text(original_bank02, encoding="utf-8")
            apply_profiles(variant["profiles"])
            run_checked(["cmd.exe", "/c", str(BUILD_BAT)])
    finally:
        BANK02.write_text(original_bank02, encoding="utf-8")
        print("\nRestored source files to original state.")


if __name__ == "__main__":
    main()
