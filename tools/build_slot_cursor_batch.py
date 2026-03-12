from __future__ import annotations

import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BANK02 = ROOT / "src" / "banks" / "generated" / "bank_02_gen68k.asm"
BANK06 = ROOT / "src" / "banks" / "generated" / "bank_06_gen68k.asm"
BUILD_BAT = ROOT / "build" / "build.bat"


A63E_FIX = (
    "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A64E 02:A63E: 85 03     STA ram_0002_t45_spr",
    "    MOVE.B  D0,ram_0003_t16_spr_A  ; Fix X: second slot-select sprite temp byte ; orig: C - - - - - 0x00A64E 02:A63E: 85 03     STA ram_0002_t45_spr",
)

A698_FIX = (
    "    ; (empty translation for INC)  ; orig: C - - - - - 0x00A6A8 02:A698: E6 05     INC ram_0004_t14 + $",
    "    ADDQ.B  #1,ram_0005_temp  ; Fix X: slot-select loop temp high byte ; orig: C - - - - - 0x00A6A8 02:A698: E6 05     INC ram_0004_t14 + $",
)

AA4C_FIX = (
    "    ; (empty translation for STA)  ; orig: C - - - - - 0x00AA5C 02:AA4C: 8D 15 03  STA ram_0302_ppu_buf",
    "    MOVE.B  D0,ram_0302_ppu_buffer+$13  ; Fix X: animated menu buffer byte ; orig: C - - - - - 0x00AA5C 02:AA4C: 8D 15 03  STA ram_0302_ppu_buf",
)

AA62_COPY_FIXES = (
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00AAA6 02:AA96: A5 71     LDA ram_pos_X_enemy ",
        "    MOVE.B  ram_pos_X_enemy+1,D0  ; Fix X: copy cursor helper X to spawned slot marker ; orig: C - - - - - 0x00AAA6 02:AA96: A5 71     LDA ram_pos_X_enemy ",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00AAA8 02:AA98: 85 72     STA ram_pos_X_enemy ",
        "    MOVE.B  D0,ram_pos_X_enemy+2  ; Fix X: store cursor marker X ; orig: C - - - - - 0x00AAA8 02:AA98: 85 72     STA ram_pos_X_enemy ",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00AAAA 02:AA9A: A5 85     LDA ram_pos_Y_enemy ",
        "    MOVE.B  ram_pos_Y_enemy+1,D0  ; Fix X: copy cursor helper Y to spawned slot marker ; orig: C - - - - - 0x00AAAA 02:AA9A: A5 85     LDA ram_pos_Y_enemy ",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00AAAF 02:AA9F: 85 86     STA ram_pos_Y_enemy ",
        "    MOVE.B  D0,ram_pos_Y_enemy+2  ; Fix X: store cursor marker Y ; orig: C - - - - - 0x00AAAF 02:AA9F: 85 86     STA ram_pos_Y_enemy ",
    ),
)


VARIANTS = [
    {"name": "baseline_on", "autostart": True},
    {"name": "a63e_only", "autostart": True, "a63e": True},
    {"name": "a698_only", "autostart": True, "a698": True},
    {"name": "a63e_a698", "autostart": True, "a63e": True, "a698": True},
    {"name": "aa4c_only", "autostart": True, "aa4c": True},
    {"name": "aa62_copy", "autostart": True, "aa62_copy": True},
    {"name": "a63e_copy", "autostart": True, "a63e": True, "aa62_copy": True},
    {"name": "a698_copy", "autostart": True, "a698": True, "aa62_copy": True},
    {"name": "sprite_copy", "autostart": True, "a63e": True, "a698": True, "aa62_copy": True},
    {
        "name": "sprite_copy_aa4c_real6a6c",
        "autostart": True,
        "a63e": True,
        "a698": True,
        "aa4c": True,
        "aa62_copy": True,
        "real_6a_6c": True,
    },
]


def replace_once(text: str, old: str, new: str) -> str:
    if old not in text:
        raise RuntimeError(f"expected snippet not found:\n{old}")
    return text.replace(old, new, 1)


def apply_optional_fix(text: str, fix: tuple[str, str], enabled: bool) -> str:
    if not enabled:
        return text
    old, new = fix
    return replace_once(text, old, new)


def apply_fix_group(text: str, fixes: tuple[tuple[str, str], ...], enabled: bool) -> str:
    if not enabled:
        return text
    for old, new in fixes:
        text = replace_once(text, old, new)
    return text


def build_bank02(original: str, variant: dict[str, object]) -> str:
    text = original
    if variant.get("autostart"):
        text = replace_once(
            text,
            "title_autostart_cfg:\n    DC.B    $00",
            "title_autostart_cfg:\n    DC.B    $01",
        )
    text = apply_optional_fix(text, A63E_FIX, bool(variant.get("a63e")))
    text = apply_optional_fix(text, A698_FIX, bool(variant.get("a698")))
    text = apply_optional_fix(text, AA4C_FIX, bool(variant.get("aa4c")))
    text = apply_fix_group(text, AA62_COPY_FIXES, bool(variant.get("aa62_copy")))
    return text


def build_bank06(original: str, variant: dict[str, object]) -> str:
    text = original
    if variant.get("real_6a_6c"):
        text = replace_once(
            text,
            "b06_cfg_real_6a_6c:\n    DC.B    $00",
            "b06_cfg_real_6a_6c:\n    DC.B    $01",
        )
    return text


def main() -> None:
    original_bank02 = BANK02.read_text(encoding="utf-8")
    original_bank06 = BANK06.read_text(encoding="utf-8")

    try:
        for variant in VARIANTS:
            print(f"\n=== Building {variant['name']} ===")
            BANK02.write_text(build_bank02(original_bank02, variant), encoding="utf-8")
            BANK06.write_text(build_bank06(original_bank06, variant), encoding="utf-8")
            subprocess.run(
                ["cmd.exe", "/c", str(BUILD_BAT)],
                cwd=str(ROOT),
                check=True,
            )
    finally:
        BANK02.write_text(original_bank02, encoding="utf-8")
        BANK06.write_text(original_bank06, encoding="utf-8")
        print("\nRestored source files to original state.")


if __name__ == "__main__":
    main()
