from __future__ import annotations

import re
import subprocess
from pathlib import Path

from restore_bank02_title_tables import MARK_BEGIN, MARK_END, restore_labels


ROOT = Path(__file__).resolve().parents[1]
BANK02 = ROOT / "src" / "banks" / "generated" / "bank_02_gen68k.asm"
BUILD_BAT = ROOT / "build" / "build.bat"

TEXT_PTRS = "tbl_94AD_demo_manual_text:"
LOGO_PALETTE = "tbl_94EE_logo_palette:"

V251_STREAM = [
    0x12, 0x3C, 0x00, 0x23, 0x13, 0xC1, 0x00, 0xFF,
    0x03, 0x00, 0x13, 0xC1, 0x00, 0xFF, 0x03, 0x01,
    0x20, 0x7C, 0x00, 0x00, 0x83, 0x7E, 0x10, 0x30,
    0x18, 0x00, 0x20, 0x7C, 0x00, 0xFF, 0x03, 0x02,
    0x11, 0x80, 0x18, 0x00,
]

REAL_PALETTE = [
    0x3F, 0x00, 0x20, 0x36, 0x0F, 0x00, 0x10, 0x36,
    0x17, 0x27, 0x0F, 0x36, 0x08, 0x1A, 0x28, 0x36,
    0x30, 0x3B, 0x22, 0x36, 0x30, 0x3B, 0x16, 0x36,
    0x17, 0x27, 0x0F, 0x36, 0x08, 0x1A, 0x28, 0x36,
    0x30, 0x3B, 0x22, 0xFF,
]

assert len(V251_STREAM) == 0x24
assert len(REAL_PALETTE) == 0x24

VARIANTS = [
    {"name": "palette_v251_exact", "mode": "stream", "keep_prefix": len(V251_STREAM)},
    {"name": "palette_v251_front8", "mode": "stream", "keep_prefix": 8},
    {"name": "palette_v251_front16", "mode": "stream", "keep_prefix": 16},
    {"name": "palette_v251_front24", "mode": "stream", "keep_prefix": 24},
    {"name": "palette_real_full", "mode": "real", "keep_prefix": len(REAL_PALETTE)},
]


def run_checked(args: list[str]) -> None:
    subprocess.run(args, cwd=str(ROOT), check=True)


def build_probe_bytes(source: list[int], keep_prefix: int) -> list[int]:
    probe = [0x00] * len(source)
    for idx in range(min(keep_prefix, len(source))):
        probe[idx] = source[idx]
    if keep_prefix >= len(source):
        return probe
    return probe


def palette_auto_block(values: list[int]) -> list[str]:
    lines = [MARK_BEGIN]
    for start in range(0, len(values), 16):
        chunk = ",".join(f"${value:02X}" for value in values[start:start + 16])
        lines.append(f"    DC.B {chunk}")
    lines.append(MARK_END)
    return lines


def replace_auto_block(path: Path, label: str, new_block: list[str]) -> None:
    lines = path.read_text(encoding="utf-8").splitlines()
    label_index = None
    for idx, line in enumerate(lines):
        if line.strip().startswith(label):
            label_index = idx
            break
    if label_index is None:
        raise SystemExit(f"missing label: {label}")

    begin_index = None
    end_index = None
    for idx in range(label_index + 1, len(lines)):
        stripped = lines[idx].strip()
        if stripped == MARK_BEGIN:
            begin_index = idx
            break
        if re.match(r"^[A-Za-z0-9_\.]+:\s*(;.*)?$", stripped):
            break
    if begin_index is None:
        raise SystemExit(f"missing auto-restored block for {label}")

    for idx in range(begin_index + 1, len(lines)):
        if lines[idx].strip() == MARK_END:
            end_index = idx
            break
    if end_index is None:
        raise SystemExit(f"unterminated auto-restored block for {label}")

    lines[begin_index : end_index + 1] = new_block
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    original_bank02 = BANK02.read_text(encoding="utf-8")

    try:
        for variant in VARIANTS:
            print(f"\n=== Building {variant['name']} ===")
            BANK02.write_text(original_bank02, encoding="utf-8")
            restore_labels(BANK02, [TEXT_PTRS, LOGO_PALETTE])
            source = V251_STREAM if variant["mode"] == "stream" else REAL_PALETTE
            replace_auto_block(
                BANK02,
                LOGO_PALETTE,
                palette_auto_block(build_probe_bytes(source, variant["keep_prefix"])),
            )
            run_checked(["cmd.exe", "/c", str(BUILD_BAT)])
    finally:
        BANK02.write_text(original_bank02, encoding="utf-8")
        print("\nRestored source files to original state.")


if __name__ == "__main__":
    main()
