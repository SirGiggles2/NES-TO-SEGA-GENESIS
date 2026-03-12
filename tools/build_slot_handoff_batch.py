from __future__ import annotations

import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BANK02 = ROOT / "src" / "banks" / "generated_vdp" / "bank_02_gen68k_vdp.asm"
BANK06 = ROOT / "src" / "banks" / "generated_vdp" / "bank_06_gen68k_vdp.asm"
BUILD_BAT = ROOT / "build" / "build.bat"


CURSOR_TABLES_OLD = """tbl_A589_cursor_spr_data:  ; orig: tbl_A589_cursor_spr_data:
    ; [DIRECTIVE] .BYTE $F3  -- needs manual handling  ; orig: - D 1 - - - 0x00A599 02:A589: F3        .byte $F3   ; 00
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - - - 0x00A59A 02:A58A: 03        .byte $03   ; 01
    ; [DIRECTIVE] .BYTE $28  -- needs manual handling  ; orig: - D 1 - - - 0x00A59B 02:A58B: 28        .byte $28   ; 02



tbl_A58C_cursor_spr_Y:  ; orig: tbl_A58C_cursor_spr_Y:
    ; [DIRECTIVE] .BYTE $5C  -- needs manual handling  ; orig: - D 1 - - - 0x00A59C 02:A58C: 5C        .byte $5C   ; 00 sav
    ; [DIRECTIVE] .BYTE $74  -- needs manual handling  ; orig: - D 1 - - - 0x00A59D 02:A58D: 74        .byte $74   ; 01 sav
    ; [DIRECTIVE] .BYTE $8C  -- needs manual handling  ; orig: - D 1 - - - 0x00A59E 02:A58E: 8C        .byte $8C   ; 02 sav
    ; [DIRECTIVE] .BYTE $A8  -- needs manual handling  ; orig: - D 1 - - - 0x00A59F 02:A58F: A8        .byte $A8   ; 03 reg
    ; [DIRECTIVE] .BYTE $B8  -- needs manual handling  ; orig: - D 1 - - - 0x00A5A0 02:A590: B8        .byte $B8   ; 04 eli
"""

CURSOR_TABLES_NEW = """tbl_A589_cursor_spr_data:  ; orig: tbl_A589_cursor_spr_data:
    DC.B    $F3,$03,$28



tbl_A58C_cursor_spr_Y:  ; orig: tbl_A58C_cursor_spr_Y:
    DC.B    $5C,$74,$8C,$A8,$B8
"""

TITLE_HANDLER_OLD = """    MOVE.B  #con_ppu_buf_12,D0  ; orig: C - - - - - 0x009068 02:9058: A9 12     LDA #con_ppu_buf_12
    MOVE.B  D0,ram_ppu_load_index  ; orig: C - - - - - 0x00906A 02:905A: 85 14     STA ram_ppu_load_ind
b02_bra_905C_RTS:  ; orig: b02_bra_905C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00906C 02:905C: 60        RTS
"""

TITLE_HANDLER_SCRIPT1 = """    MOVE.B  #con_ppu_buf_12,D0  ; orig: C - - - - - 0x009068 02:9058: A9 12     LDA #con_ppu_buf_12
    MOVE.B  D0,ram_ppu_load_index  ; orig: C - - - - - 0x00906A 02:905A: 85 14     STA ram_ppu_load_ind
    MOVE.B  #$01,D0  ; Force H1: jump into prepare_slot_select_screen_1 from title handoff
    MOVE.B  D0,ram_script
    MOVE.B  #$00,D0
    MOVE.B  D0,ram_subscript
    MOVE.B  D0,ram_current_save_slot
b02_bra_905C_RTS:  ; orig: b02_bra_905C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00906C 02:905C: 60        RTS
"""

TITLE_HANDLER_SCRIPT1_LOAD14 = """    MOVE.B  #con_ppu_buf_12,D0  ; orig: C - - - - - 0x009068 02:9058: A9 12     LDA #con_ppu_buf_12
    MOVE.B  D0,ram_ppu_load_index  ; orig: C - - - - - 0x00906A 02:905A: 85 14     STA ram_ppu_load_ind
    MOVE.B  #$01,D0  ; Force H2: jump into prepare_slot_select_screen_1 from title handoff
    MOVE.B  D0,ram_script
    MOVE.B  #$00,D0
    MOVE.B  D0,ram_subscript
    MOVE.B  D0,ram_current_save_slot
    MOVE.B  #$14,D0  ; Force H3: stage the later menu/file-select buffer immediately
    MOVE.B  D0,ram_ppu_load_index
b02_bra_905C_RTS:  ; orig: b02_bra_905C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00906C 02:905C: 60        RTS
"""


VARIANTS = [
    {"name": "current_control"},
    {"name": "cursor_tables", "cursor_tables": True},
    {"name": "force_script1", "force_script1": True},
    {"name": "force_script1_cursor", "force_script1": True, "cursor_tables": True},
    {"name": "force_script1_cursor_continue", "force_script1": True, "cursor_tables": True, "real_continue": True},
    {"name": "force_script1_load14", "force_script1_load14": True},
    {"name": "force_script1_load14_cursor", "force_script1_load14": True, "cursor_tables": True},
    {"name": "force_script1_load14_cursor_continue", "force_script1_load14": True, "cursor_tables": True, "real_continue": True},
]


def replace_once(text: str, old: str, new: str) -> str:
    if old not in text:
        raise RuntimeError(f"expected snippet not found:\n{old}")
    return text.replace(old, new, 1)


def build_bank02(original: str, variant: dict[str, object]) -> str:
    text = original
    if variant.get("cursor_tables"):
        text = replace_once(text, CURSOR_TABLES_OLD, CURSOR_TABLES_NEW)
    if variant.get("force_script1_load14"):
        text = replace_once(text, TITLE_HANDLER_OLD, TITLE_HANDLER_SCRIPT1_LOAD14)
    elif variant.get("force_script1"):
        text = replace_once(text, TITLE_HANDLER_OLD, TITLE_HANDLER_SCRIPT1)
    return text


def build_bank06(original: str, variant: dict[str, object]) -> str:
    text = original
    if variant.get("real_continue"):
        text = replace_once(
            text,
            "b06_cfg_real_continue:\n    DC.B    $00",
            "b06_cfg_real_continue:\n    DC.B    $01",
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
