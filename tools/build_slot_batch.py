from __future__ import annotations

import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BANK02 = ROOT / "src" / "banks" / "generated" / "bank_02_gen68k.asm"
BANK06 = ROOT / "src" / "banks" / "generated" / "bank_06_gen68k.asm"
BUILD_BAT = ROOT / "build" / "build.bat"


def replace_once(text: str, old: str, new: str) -> str:
    if old not in text:
        raise RuntimeError(f"expected snippet not found:\n{old}")
    return text.replace(old, new, 1)


FEATURE_A_PTR = [
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x009F30 02:9F20: 99 9C 6D  STA ram_6D9D - $01,Y",
        "    MOVE.B  D0,ram_6D9C(D2.L)  ; fill translated store of paired save-name byte",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A2D0 02:A2C0: B9 9C 6D  LDA ram_6D9D - $01,Y",
        "    MOVE.B  ram_6D9C(D2.L),D0  ; fill translated load of paired save-name byte",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A2FF 02:A2EF: B9 24 65  LDA ram_6525 - $01,Y",
        "    MOVE.B  ram_6524(D2.L),D0  ; fill translated load of paired checksum byte",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A3D4 02:A3C4: 99 24 65  STA ram_6525 - $01,Y",
        "    MOVE.B  D0,ram_6524(D2.L)  ; fill translated store of paired checksum byte",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A3ED 02:A3DD: 99 9C 6D  STA ram_6D9D - $01,Y",
        "    MOVE.B  D0,ram_6D9C(D2.L)  ; fill translated store of paired save-name byte",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A75D 02:A74D: B9 9C 6D  LDA ram_6D9D - $01,Y",
        "    MOVE.B  ram_6D9C(D2.L),D0  ; fill translated load of paired save-name byte",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A787 02:A777: 99 24 65  STA ram_6525 - $01,Y",
        "    MOVE.B  D0,ram_6524(D2.L)  ; fill translated store of paired checksum byte",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A805 02:A7F5: B9 9C 6D  LDA ram_6D9D - $01,Y",
        "    MOVE.B  ram_6D9C(D2.L),D0  ; fill translated load of paired save-name byte",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A808 02:A7F8: 99 24 65  STA ram_6525 - $01,Y",
        "    MOVE.B  D0,ram_6524(D2.L)  ; fill translated store of paired checksum byte",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A826 02:A816: 85 0D     STA ram_000C_t02_slo",
        "    MOVE.B  D0,ram_000C_t02_slot_name_data+1  ; fill translated slot-name pointer high byte",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A833 02:A823: 85 0D     STA ram_000C_t03_dat",
        "    MOVE.B  D0,ram_000C_t03_data+1  ; fill translated hearts pointer high byte",
    ),
]


FEATURE_B_CARRY = [
    (
        "    ; (empty translation for INC)  ; orig: C - - - - - 0x00A727 02:A717: E6 C3     INC ram_00C2_t01_dat",
        "    ADDQ.B  #1,ram_00C2_t01_data+1  ; fill translated source pointer high-byte carry",
    ),
    (
        "    ; (empty translation for INC)  ; orig: C - - - - - 0x00A72D 02:A71D: E6 0F     INC ram_000E_t04_dat",
        "    ADDQ.B  #1,ram_000E_t04_data+1  ; fill translated destination pointer high-byte carry",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A735 02:A725: A5 0F     LDA ram_000E_t04_dat",
        "    MOVE.B  ram_000E_t04_data+1,D0  ; fill translated destination pointer high byte",
    ),
    (
        "    ; (empty translation for INC)  ; orig: C - - - - - 0x00A7D5 02:A7C5: E6 03     INC ram_0002_t03_dat",
        "    ADDQ.B  #1,ram_0002_t03_data+1  ; fill translated source pointer high-byte carry",
    ),
    (
        "    ; (empty translation for INC)  ; orig: C - - - - - 0x00A7DB 02:A7CB: E6 C3     INC ram_00C2_t01_dat",
        "    ADDQ.B  #1,ram_00C2_t01_data+1  ; fill translated destination pointer high-byte carry",
    ),
    (
        "    ; (empty translation for INC)  ; orig: C - - - - - 0x00A7E1 02:A7D1: E6 0F     INC ram_000E_t04_dat",
        "    ADDQ.B  #1,ram_000E_t04_data+1  ; fill translated compare pointer high-byte carry",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A7E9 02:A7D9: A5 0F     LDA ram_000E_t04_dat",
        "    MOVE.B  ram_000E_t04_data+1,D0  ; fill translated compare pointer high byte",
    ),
]


FEATURE_C_PPU = [
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A4E1 02:A4D1: AD 03 03  LDA ram_0302_ppu_buf",
        "    MOVE.B  ram_0302_ppu_buffer+1,D0  ; fill translated LDA $0303",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A4E7 02:A4D7: 8D 03 03  STA ram_0302_ppu_buf",
        "    MOVE.B  D0,ram_0302_ppu_buffer+1  ; fill translated STA $0303",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A4EA 02:A4DA: AD 17 03  LDA ram_0302_ppu_buf",
        "    MOVE.B  ram_0302_ppu_buffer+$15,D0  ; fill translated LDA $0317",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A4F0 02:A4E0: 8D 17 03  STA ram_0302_ppu_buf",
        "    MOVE.B  D0,ram_0302_ppu_buffer+$15  ; fill translated STA $0317",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A4FB 02:A4EB: 8D 16 03  STA ram_0302_ppu_buf",
        "    MOVE.B  D0,ram_0302_ppu_buffer+$14  ; fill translated STA $0316",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A550 02:A540: A5 02     LDA ram_0001_t04_dec",
        "    MOVE.B  ram_0002_t04_data,D0  ; fill translated tens digit byte",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A552 02:A542: 9D 03 03  STA ram_0302_ppu_buf",
        "    LEA     (ram_0302_ppu_buffer+1).l,A1\n    MOVE.B  D0,(A1,D1.W)  ; fill translated STA $0303,X",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A555 02:A545: A5 03     LDA ram_0001_t04_dec",
        "    MOVE.B  ram_0003_t04,D0  ; fill translated hundreds digit byte",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A55F 02:A54F: A5 02     LDA ram_0001_t04_dec",
        "    MOVE.B  ram_0002_t04_data,D0  ; fill translated second decimal compare byte",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A572 02:A562: 9D 04 03  STA ram_0302_ppu_buf",
        "    LEA     (ram_0302_ppu_buffer+2).l,A1\n    MOVE.B  D0,(A1,D1.W)  ; fill translated STA $0304,X",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00AA5C 02:AA4C: 8D 15 03  STA ram_0302_ppu_buf",
        "    MOVE.B  D0,ram_0302_ppu_buffer+$13  ; fill translated STA $0315",
    ),
]


FEATURE_D_SPRITE = [
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x009EEB 02:9EDB: 8D 08 02  STA ram_spr_Y + $08",
        "    MOVE.B  D0,(ram_spr_Y+$08).l  ; fill translated STA sprite Y+8",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00A64E 02:A63E: 85 03     STA ram_0002_t45_spr",
        "    MOVE.B  D0,ram_0002_t45_spr_T+1  ; fill translated sprite attribute byte",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00AAA6 02:AA96: A5 71     LDA ram_pos_X_enemy ",
        "    MOVE.B  ram_pos_X_enemy+1,D0  ; fill translated load of paired enemy X",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00AAA8 02:AA98: 85 72     STA ram_pos_X_enemy ",
        "    MOVE.B  D0,ram_pos_X_enemy+2  ; fill translated store of paired enemy X",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: C - - - - - 0x00AAAA 02:AA9A: A5 85     LDA ram_pos_Y_enemy ",
        "    MOVE.B  ram_pos_Y_enemy+1,D0  ; fill translated load of paired enemy Y",
    ),
    (
        "    ; (empty translation for STA)  ; orig: C - - - - - 0x00AAAF 02:AA9F: 85 86     STA ram_pos_Y_enemy ",
        "    MOVE.B  D0,ram_pos_Y_enemy+2  ; fill translated store of paired enemy Y",
    ),
]


VARIANTS = [
    {"name": "control_off", "autostart": False, "fixes": ""},
    {"name": "baseline_on", "autostart": True, "fixes": ""},
    {"name": "autostart_A", "autostart": True, "fixes": "A"},
    {"name": "autostart_B", "autostart": True, "fixes": "B"},
    {"name": "autostart_C", "autostart": True, "fixes": "C"},
    {"name": "autostart_AB", "autostart": True, "fixes": "AB"},
    {"name": "autostart_AC", "autostart": True, "fixes": "AC"},
    {"name": "autostart_BC", "autostart": True, "fixes": "BC"},
    {"name": "autostart_ABC", "autostart": True, "fixes": "ABC"},
    {"name": "autostart_ABC_6a6c", "autostart": True, "fixes": "ABC", "real_6a_6c": True},
]


def apply_feature_set(text: str, feature_code: str) -> str:
    for old, new in feature_code:
        text = replace_once(text, old, new)
    return text


def build_bank02(original: str, variant: dict) -> str:
    text = original
    if variant.get("autostart"):
        text = replace_once(
            text,
            "title_autostart_cfg:\n    DC.B    $00",
            "title_autostart_cfg:\n    DC.B    $01",
        )
    if "A" in variant["fixes"]:
        text = apply_feature_set(text, FEATURE_A_PTR)
    if "B" in variant["fixes"]:
        text = apply_feature_set(text, FEATURE_B_CARRY)
    if "C" in variant["fixes"]:
        text = apply_feature_set(text, FEATURE_C_PPU)
    if "D" in variant["fixes"]:
        text = apply_feature_set(text, FEATURE_D_SPRITE)
    return text


def build_bank06(original: str, variant: dict) -> str:
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
