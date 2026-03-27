#!/usr/bin/env python3
"""Fail fast when bank-6 direct-buffer validation is missing."""

from __future__ import annotations

import argparse
import pathlib
import re
import sys


HELPER_PATTERN = re.compile(
    r"sub_b06_sanitize_ram_0302_if_invalid:\s*"
    r".*?MOVE\.B\s+ram_0302_ppu_buffer,D0\s*"
    r".*?CMPI\.B\s+#\$FF,D0\s*"
    r".*?CMPI\.B\s+#\$20,D0\s*"
    r".*?CMPI\.B\s+#\$40,D0\s*"
    r".*?MOVE\.B\s+#\$FF,ram_0302_ppu_buffer",
    flags=re.DOTALL,
)

LEGACY_CALLSITE_PATTERN = re.compile(
    r"bra_b06_ppu_legacy:\s*"
    r".*?CMPI\.W\s+#\$0302,D5\s*"
    r".*?BSR\s+sub_b06_sanitize_ram_0302_if_invalid\s*"
    r".*?BSR\s+sub_A0F6_write_to_ppu",
    flags=re.DOTALL,
)


def run(path: pathlib.Path) -> int:
    text = path.read_text(encoding="utf-8", errors="replace")
    failures: list[str] = []

    if not HELPER_PATTERN.search(text):
        failures.append(
            "Missing ram_0302 direct-buffer header validation helper before legacy parsing."
        )

    if not LEGACY_CALLSITE_PATTERN.search(text):
        failures.append(
            "Legacy bank-6 PPU path no longer validates raw pointer $0302 before sub_A0F6_write_to_ppu."
        )

    if failures:
        print("PPU buffer safety guard FAILED")
        print(f"Checked: {path}")
        for item in failures:
            print(f" - {item}")
        return 1

    print("PPU buffer safety guard passed")
    print(f"Checked: {path}")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Check bank-6 direct PPU buffer safety hooks.")
    parser.add_argument(
        "--file",
        default="src/banks/generated_vdp/bank_06_gen68k_vdp.asm",
        help="Path to bank_06_gen68k_vdp.asm (default: src/banks/generated_vdp/bank_06_gen68k_vdp.asm)",
    )
    args = parser.parse_args()

    path = pathlib.Path(args.file)
    if not path.exists():
        print(f"Missing file: {path}", file=sys.stderr)
        return 2

    return run(path)


if __name__ == "__main__":
    raise SystemExit(main())
