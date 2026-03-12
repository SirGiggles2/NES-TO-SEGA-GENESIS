from __future__ import annotations

import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BANK02 = ROOT / "src" / "banks" / "generated" / "bank_02_gen68k.asm"
BANK06 = ROOT / "src" / "banks" / "generated" / "bank_06_gen68k.asm"
BUILD_BAT = ROOT / "build" / "build.bat"


SPRITE_FIXES = (
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A64E 02:A63E: 85 03     STA ram_0002_t45_spr",
        "    MOVE.B  D0,ram_0003_t16_spr_A  ; Fix X: second temp byte for slot-select sprite ; orig: C - - - - - 0x00A64E 02:A63E: 85 03     STA ram_0002_t45_spr",
    ),
    (
        "    ; (empty translation for INC)  ; orig: C - - - - - 0x00A6A8 02:A698: E6 05     INC ram_0004_t14 + $",
        "    ADDQ.B  #1,ram_0005_temp  ; Fix X: high byte of slot-select loop temp ; orig: C - - - - - 0x00A6A8 02:A698: E6 05     INC ram_0004_t14 + $",
    ),
)

SAVEPAIR_FIXES = (
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A75D 02:A74D: B9 9C 6D  LDA ram_6D9D - $01,Y",
        "    MOVE.B  ram_6D9C(D2.L),D0  ; Fix X: paired save-slot checksum byte ; orig: C - - - - - 0x00A75D 02:A74D: B9 9C 6D  LDA ram_6D9D - $01,Y",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A787 02:A777: 99 24 65  STA ram_6525 - $01,Y",
        "    MOVE.B  D0,ram_6524(D2.L)  ; Fix X: paired save-slot metadata byte ; orig: C - - - - - 0x00A787 02:A777: 99 24 65  STA ram_6525 - $01,Y",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A805 02:A7F5: B9 9C 6D  LDA ram_6D9D - $01,Y",
        "    MOVE.B  ram_6D9C(D2.L),D0  ; Fix X: paired save-slot restore byte ; orig: C - - - - - 0x00A805 02:A7F5: B9 9C 6D  LDA ram_6D9D - $01,Y",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A808 02:A7F8: 99 24 65  STA ram_6525 - $01,Y",
        "    MOVE.B  D0,ram_6524(D2.L)  ; Fix X: paired save-slot restore store ; orig: C - - - - - 0x00A808 02:A7F8: 99 24 65  STA ram_6525 - $01,Y",
    ),
)

PTRHI_FIXES = (
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A826 02:A816: 85 0D     STA ram_000C_t02_slo",
        "    MOVE.B  D0,ram_000C_t02_slot_name_data+1  ; Fix X: slot-name pointer high byte ; orig: C - - - - - 0x00A826 02:A816: 85 0D     STA ram_000C_t02_slo",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A833 02:A823: 85 0D     STA ram_000C_t03_dat",
        "    MOVE.B  D0,ram_000C_t03_data+1  ; Fix X: hearts pointer high byte ; orig: C - - - - - 0x00A833 02:A823: 85 0D     STA ram_000C_t03_dat",
    ),
)

COPYHI_FIXES = (
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A717 02:A707: 8D 70 06  STA ram_item_hearts ",
        "    MOVE.B  D0,ram_item_hearts+1  ; Fix X: heart counter paired byte ; orig: C - - - - - 0x00A717 02:A707: 8D 70 06  STA ram_item_hearts ",
    ),
    (
        "    ; (empty translation for INC)  ; orig: C - - - - - 0x00A727 02:A717: E6 C3     INC ram_00C2_t01_dat",
        "    ADDQ.B  #1,ram_00C2_t01_data+1  ; Fix X: source pointer high byte ; orig: C - - - - - 0x00A727 02:A717: E6 C3     INC ram_00C2_t01_dat",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A735 02:A725: A5 0F     LDA ram_000E_t04_dat",
        "    MOVE.B  ram_000E_t04_data+1,D0  ; Fix X: destination pointer high byte compare ; orig: C - - - - - 0x00A735 02:A725: A5 0F     LDA ram_000E_t04_dat",
    ),
)


VARIANTS = [
    {"name": "baseline_on", "autostart": True},
    {"name": "sprite", "autostart": True, "sprite": True},
    {"name": "savepair", "autostart": True, "savepair": True},
    {"name": "ptrhi", "autostart": True, "ptrhi": True},
    {"name": "copyhi", "autostart": True, "copyhi": True},
    {"name": "sprite_savepair", "autostart": True, "sprite": True, "savepair": True},
    {"name": "sprite_ptrhi", "autostart": True, "sprite": True, "ptrhi": True},
    {"name": "sprite_copyhi", "autostart": True, "sprite": True, "copyhi": True},
    {"name": "all_bank2", "autostart": True, "sprite": True, "savepair": True, "ptrhi": True, "copyhi": True},
    {
        "name": "all_bank2_real_6a6c",
        "autostart": True,
        "sprite": True,
        "savepair": True,
        "ptrhi": True,
        "copyhi": True,
        "real_6a_6c": True,
    },
]


def replace_once(text: str, old: str, new: str) -> str:
    if old not in text:
        raise RuntimeError(f"expected snippet not found:\n{old}")
    return text.replace(old, new, 1)


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
    text = apply_fix_group(text, SPRITE_FIXES, bool(variant.get("sprite")))
    text = apply_fix_group(text, SAVEPAIR_FIXES, bool(variant.get("savepair")))
    text = apply_fix_group(text, PTRHI_FIXES, bool(variant.get("ptrhi")))
    text = apply_fix_group(text, COPYHI_FIXES, bool(variant.get("copyhi")))
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
