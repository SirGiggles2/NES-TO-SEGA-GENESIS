#!/usr/bin/env python3
"""Verify frontend palette tables stay in sync with their calibration rules."""

from __future__ import annotations

import argparse
import pathlib
import re
import sys


WORD_RE = re.compile(r"\$([0-9A-Fa-f]{4})")

NES_RGB = [
    (124, 124, 124), (0, 0, 252), (0, 0, 188), (68, 40, 188),
    (148, 0, 132), (168, 0, 32), (168, 16, 0), (136, 20, 0),
    (80, 48, 0), (0, 120, 0), (0, 104, 0), (0, 88, 0),
    (0, 64, 88), (0, 0, 0), (0, 0, 0), (0, 0, 0),
    (188, 188, 188), (0, 120, 248), (0, 88, 248), (104, 68, 252),
    (216, 0, 204), (228, 0, 88), (248, 56, 0), (228, 92, 16),
    (172, 124, 0), (0, 184, 0), (0, 168, 0), (0, 168, 68),
    (0, 136, 136), (0, 0, 0), (0, 0, 0), (0, 0, 0),
    (248, 248, 248), (60, 188, 252), (104, 136, 252), (152, 120, 248),
    (248, 120, 248), (248, 88, 152), (248, 120, 88), (252, 160, 68),
    (248, 184, 0), (184, 248, 24), (88, 216, 84), (88, 248, 152),
    (0, 232, 216), (120, 120, 120), (0, 0, 0), (0, 0, 0),
    (252, 252, 252), (164, 228, 252), (184, 184, 248), (216, 184, 248),
    (248, 184, 248), (248, 164, 192), (240, 208, 176), (252, 224, 168),
    (248, 216, 120), (216, 248, 120), (184, 248, 184), (184, 248, 216),
    (0, 252, 252), (216, 216, 216), (0, 0, 0), (0, 0, 0),
]

GLOBAL_OVERRIDES = {
    0x07: 0x00AE,
    0x0C: 0x0CCE,
    0x0F: 0x0444,
    0x12: 0x0EEE,
    0x16: 0x0CCE,
    0x17: 0x08CE,
    0x1C: 0x0EEE,
    0x27: 0x0AEE,
    0x29: 0x08EE,
    0x2C: 0x0EEE,
}

TITLE_SCREEN_OVERRIDES = {
    0x08: 0x0CCE,
    0x1A: 0x0CE0,
    0x22: 0x0EEE,
    0x36: 0x0EEE,
}


def extract_table(text: str, label: str) -> list[int]:
    lines = text.splitlines()
    values: list[int] = []
    in_table = False

    for line in lines:
        if not in_table:
            if line.strip() == f"{label}:":
                in_table = True
            continue

        stripped = line.strip()
        if not stripped:
            break
        if stripped.startswith(";"):
            continue
        if not stripped.startswith("DC.W"):
            break
        values.extend(int(match.group(1), 16) for match in WORD_RE.finditer(line))

    if len(values) != 64:
        raise ValueError(f"{label} expected 64 words, found {len(values)}")
    return values


def decode(word: int) -> tuple[int, int, int]:
    r = (word & 0x000E) >> 1
    g = (word & 0x00E0) >> 5
    b = (word & 0x0E00) >> 9
    return r, g, b


def encode(r: int, g: int, b: int) -> int:
    return (b << 9) | (g << 5) | (r << 1)


def quantize_channel(channel: int) -> int:
    # Slight gamma lift keeps the shared gameplay/frontend palette closer to
    # the NES reference on darker hardware/capture paths.
    return max(0, min(7, round(((channel / 255.0) ** 0.85) * 7)))


def lift_channel(level: int) -> int:
    if level == 0:
        return 0
    if level <= 1:
        return 3
    if level == 2:
        return 4
    if level == 3:
        return 5
    if level == 4:
        return 6
    return 7


def lift_word(word: int) -> int:
    r, g, b = decode(word)
    return encode(lift_channel(r), lift_channel(g), lift_channel(b))


def quantize_rgb(rgb: tuple[int, int, int]) -> int:
    r, g, b = rgb
    return encode(quantize_channel(r), quantize_channel(g), quantize_channel(b))


def run(path: pathlib.Path) -> int:
    text = path.read_text(encoding="utf-8", errors="replace")
    base = extract_table(text, "NES_PALETTE_DATA")
    frontend = extract_table(text, "CORRECT_NES_PALETTE")
    title = extract_table(text, "TITLE_SCREEN_NES_PALETTE")
    expected = [lift_word(quantize_rgb(rgb)) for rgb in NES_RGB]
    for idx, word in GLOBAL_OVERRIDES.items():
        expected[idx] = word
    expected_title = expected.copy()
    for idx, word in TITLE_SCREEN_OVERRIDES.items():
        expected_title[idx] = word

    failures: list[str] = []
    base_mismatches = [idx for idx, (cur, exp) in enumerate(zip(base, expected)) if cur != exp]
    if base_mismatches:
        preview = ", ".join(f"${idx:02X}" for idx in base_mismatches[:8])
        failures.append(f"NES_PALETTE_DATA does not match the global calibration rule at {preview}.")

    frontend_mismatches = [idx for idx, (cur, exp) in enumerate(zip(frontend, expected)) if cur != exp]
    if frontend_mismatches:
        preview = ", ".join(f"${idx:02X}" for idx in frontend_mismatches[:8])
        failures.append(f"CORRECT_NES_PALETTE does not match the global calibration rule at {preview}.")

    title_mismatches = [idx for idx, (cur, exp) in enumerate(zip(title, expected_title)) if cur != exp]
    if title_mismatches:
        preview = ", ".join(f"${idx:02X}" for idx in title_mismatches[:8])
        failures.append(f"Title frontend palette does not match the calibrated title rule at {preview}.")

    key_indices = [0x10, 0x22, 0x28, 0x36]
    key_lines = [
        f"${idx:02X}:{base[idx]:04X}->{frontend[idx]:04X}"
        for idx in key_indices
    ]
    title_key_lines = [
        f"${idx:02X}:{title[idx]:04X}"
        for idx in key_indices
    ]

    if failures:
        print("Frontend palette calibration check FAILED")
        print(f"Checked: {path}")
        for item in failures:
            print(f" - {item}")
        print("Key title mappings:", ", ".join(key_lines))
        print("Title table keys:", ", ".join(title_key_lines))
        return 1

    print("Frontend palette calibration check passed")
    print(f"Checked: {path}")
    print("Key title mappings:", ", ".join(key_lines))
    print("Title table keys:", ", ".join(title_key_lines))
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Check frontend palette calibration in vdp_layer.asm.")
    parser.add_argument(
        "--file",
        default="src/bridge/vdp_layer.asm",
        help="Path to vdp_layer.asm (default: src/bridge/vdp_layer.asm)",
    )
    args = parser.parse_args()

    path = pathlib.Path(args.file)
    if not path.exists():
        print(f"Missing file: {path}", file=sys.stderr)
        return 2

    return run(path)


if __name__ == "__main__":
    raise SystemExit(main())
