#!/usr/bin/env python3
"""Fail fast on known bridge-level title regression patterns.

This check protects the vdp_layer write paths that previously caused
visual corruption/cropping even when telemetry looked nominal.
"""

from __future__ import annotations

import argparse
import pathlib
import re
import sys
from dataclasses import dataclass


@dataclass(frozen=True)
class Rule:
    name: str
    pattern: str
    hint: str


RULES: tuple[Rule, ...] = (
    Rule(
        name="vsram_write_address_drift",
        pattern=r"move\.l\s+#\$40000010,\(\$C00004\)",
        hint="Use the known-good VSRAM write command in PPU_WRITE_2005 write_y path.",
    ),
    Rule(
        name="vblank_display_forced_off_block",
        pattern=r"HARDWARE FIX v634: disable display during VRAM write phase",
        hint="Do not force display-off around the full VBlank write phase.",
    ),
    Rule(
        name="spurious_dma_clear_patch",
        pattern=r"FIX v636: clear garbage low word to prevent spurious DMA",
        hint="Do not use the v636 low-word clear patch in CRAM/VDP address composition paths.",
    ),
    Rule(
        name="pre_nmi_direct_buffer_clobber",
        pattern=r"tst\.b\s+\(ram_0301_buffer_index\)\.l\s*\n\s*bne\s+\.keep_staged_ppu_buffer\s*\n\s*move\.b\s+#\$FF,\(ram_0302_ppu_buffer\)\.l",
        hint="Do not clear ram_0302_ppu_buffer before the translated NMI consumes staged direct PPU writes.",
    ),
    Rule(
        name="runtime_title_balance_reintroduced",
        pattern=r"TITLE_SCREEN_COLOR_BALANCE:|bsr\s+TITLE_SCREEN_COLOR_BALANCE",
        hint="Use the static frontend hardware palette table instead of runtime title-balance logic.",
    ),
    Rule(
        name="h40_mode_reintroduced",
        pattern=r"move\.w\s+#\$8C81,\(\$C00004\)",
        hint="Keep the frontend in H32 mode so Genesis output matches the NES 256px width.",
    ),
    Rule(
        name="invalid_h32_timing_mode",
        pattern=r"move\.w\s+#\$8C80,\(\$C00004\)",
        hint="Do not use Reg 12 value $80 for H32. Normal 32-cell mode is $00 in the data byte.",
    ),
    Rule(
        name="stale_h40_window_base",
        pattern=r"move\.w\s+#\$8307,\(\$C00004\)",
        hint="Keep the H32 window table on the verified $B000 base (Reg 3 = $2C).",
    ),
    Rule(
        name="stale_h40_sat_base",
        pattern=r"move\.w\s+#\$856C,\(\$C00004\)",
        hint="Keep the H32 sprite attribute table on the verified $BE00 base (Reg 5 = $5F).",
    ),
    Rule(
        name="stale_h40_hscroll_base",
        pattern=r"move\.w\s+#\$8D2F,\(\$C00004\)",
        hint="Keep the H32 h-scroll table on the verified $B800 base (Reg 13 = $2E).",
    ),
    Rule(
        name="fullscreen_window_hpos",
        pattern=r"move\.w\s+#\$9100,\(\$C00004\)",
        hint="Do not leave the window H position at $00. In H32 that anchors the window at the left edge.",
    ),
    Rule(
        name="fullscreen_window_vpos",
        pattern=r"move\.w\s+#\$9200,\(\$C00004\)",
        hint="Do not leave the window V position at $00. In 224-line mode that anchors the window at the top edge.",
    ),
    Rule(
        name="bg_color0_transparent_table",
        pattern=r"PPU_PIXEL_PAIR_TABLE:\s*\n\s*dc\.b\s+\$00,\$01,\$10,\$11,\$02,\$03,\$12,\$13\s*\n\s*dc\.b\s+\$20,\$21,\$30,\$31,\$22,\$23,\$32,\$33",
        hint="Do not map BG color 0 to Genesis nibble 0. NES BG color 0 must be opaque via Genesis color $F.",
    ),
)


def _contains_in_block(text: str, block_label: str, needle_regex: str) -> bool:
    start = text.find(block_label)
    if start < 0:
        return False
    end = text.find("\n\n", start)
    if end < 0:
        end = len(text)
    block = text[start:end]
    return re.search(needle_regex, block, flags=re.MULTILINE) is not None


def run(path: pathlib.Path) -> int:
    text = path.read_text(encoding="utf-8", errors="replace")
    failures: list[str] = []

    for rule in RULES:
        if re.search(rule.pattern, text, flags=re.MULTILINE):
            failures.append(f"[{rule.name}] {rule.hint}")

    if _contains_in_block(text, "PPU_WRITE_2000:", r"move\.l\s+D0,-\(A7\)"):
        failures.append("[ppu_write_2000_stack_push] Avoid D0 stack push/pop wrapper in PPU_WRITE_2000.")

    if _contains_in_block(text, "PPU_WRITE_2006:", r"move\.l\s+D0,-\(A7\)"):
        failures.append("[ppu_write_2006_stack_push] Avoid D0 stack push/pop wrapper in PPU_WRITE_2006.")

    if failures:
        print("VDP title regression guard FAILED")
        print(f"Checked: {path}")
        for item in failures:
            print(f" - {item}")
        return 1

    print("VDP title regression guard passed")
    print(f"Checked: {path}")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Check for known VDP title regression signatures.")
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
