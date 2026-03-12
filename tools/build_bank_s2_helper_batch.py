from __future__ import annotations

import re
import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BANK02 = ROOT / "src" / "banks" / "generated_vdp" / "bank_02_gen68k_vdp.asm"
BANK06 = ROOT / "src" / "banks" / "generated_vdp" / "bank_06_gen68k_vdp.asm"
BANKS2 = ROOT / "src" / "banks" / "generated_vdp" / "bank_s2_gen68k_vdp.asm"
BUILD_BAT = ROOT / "build" / "build.bat"


S2_HELPER_FIXES: tuple[tuple[str, str], ...] = (
    (
        "    MOVEA.L #$FF77AC,A0  ; Fix X: ; (empty translation for LDA)  ; orig: - D 1 - I - 0x007076 01:77F6: B9 AC 77  LDA tbl_77AB + $01,Y\n"
        "    MOVE.B  (A0,D2.L),D0  ; ^",
        "    MOVEA.L #tbl_77AB+1,A0  ; Fix H1: load second sprite index byte from real ROM table ; orig: - D 1 - I - 0x007076 01:77F6: B9 AC 77  LDA tbl_77AB + $01,Y\n"
        "    MOVE.B  (A0,D2.L),D0  ; ^",
    ),
    (
        "    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0070A0 01:7820: 85 03     STA ram_0002_t45_spr",
        "    MOVE.B  D0,ram_0003_t16_spr_A  ; Fix H2: store second sprite tile byte ; orig: - D 1 - I - 0x0070A0 01:7820: 85 03     STA ram_0002_t45_spr",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0070D5 01:7855: A5 03     LDA ram_0002_t45_spr",
        "    MOVE.B  ram_0003_t16_spr_A,D0  ; Fix H3: load second sprite tile byte for swap ; orig: - D 1 - I - 0x0070D5 01:7855: A5 03     LDA ram_0002_t45_spr",
    ),
    (
        "    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0070DA 01:785A: 85 03     STA ram_0002_t45_spr",
        "    MOVE.B  D0,ram_0003_t16_spr_A  ; Fix H4: store swapped second sprite tile byte ; orig: - D 1 - I - 0x0070DA 01:785A: 85 03     STA ram_0002_t45_spr",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0070E2 01:7862: A5 05     LDA ram_0004_t13_spr",
        "    MOVE.B  ram_0005_temp,D0  ; Fix H5: load second sprite attribute byte ; orig: - D 1 - I - 0x0070E2 01:7862: A5 05     LDA ram_0004_t13_spr",
    ),
    (
        "    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0070E6 01:7866: 85 05     STA ram_0004_t13_spr",
        "    MOVE.B  D0,ram_0005_temp  ; Fix H6: store second sprite attribute byte ; orig: - D 1 - I - 0x0070E6 01:7866: 85 05     STA ram_0004_t13_spr",
    ),
    (
        "    MOVEA.L #$FF77AC,A0  ; Fix X: ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0071A4 01:7924: B9 AC 77  LDA tbl_77AB + $01,Y\n"
        "    MOVE.B  (A0,D2.L),D0  ; ^",
        "    MOVEA.L #tbl_77AB+1,A0  ; Fix H7: load second sprite index byte from real ROM table ; orig: - D 1 - I - 0x0071A4 01:7924: B9 AC 77  LDA tbl_77AB + $01,Y\n"
        "    MOVE.B  (A0,D2.L),D0  ; ^",
    ),
    (
        "    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0071C5 01:7945: 85 03     STA ram_0002_t45_spr",
        "    MOVE.B  D0,ram_0003_t16_spr_A  ; Fix H8: store second sprite tile byte ; orig: - D 1 - I - 0x0071C5 01:7945: 85 03     STA ram_0002_t45_spr",
    ),
    (
        "    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0071FB 01:797B: 85 03     STA ram_0002_t45_spr",
        "    MOVE.B  D0,ram_0003_t16_spr_A  ; Fix H9: copy tile byte into second sprite tile byte ; orig: - D 1 - I - 0x0071FB 01:797B: 85 03     STA ram_0002_t45_spr",
    ),
    (
        "    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0071FD 01:797D: A5 05     LDA ram_0004_t14 + $",
        "    MOVE.B  ram_0005_temp,D0  ; Fix H10: load second sprite attribute byte ; orig: - D 1 - I - 0x0071FD 01:797D: A5 05     LDA ram_0004_t14 + $",
    ),
    (
        "    ; (empty translation for STA)  ; orig: - D 1 - I - 0x007201 01:7981: 85 05     STA ram_0004_t14 + $",
        "    MOVE.B  D0,ram_0005_temp  ; Fix H11: store toggled second sprite attribute byte ; orig: - D 1 - I - 0x007201 01:7981: 85 05     STA ram_0004_t14 + $",
    ),
    (
        "    ; (empty translation for STA)  ; orig: - D 1 - I - 0x00720A 01:798A: 85 05     STA ram_0004_t14 + $",
        "    MOVE.B  D0,ram_0005_temp  ; Fix H12: initialize second sprite attribute byte ; orig: - D 1 - I - 0x00720A 01:798A: 85 05     STA ram_0004_t14 + $",
    ),
)

TABLE_ORDER = (
    "tbl_7594",
    "tbl_7613",
    "tbl_76DF_spr_A",
    "tbl_77AB",
    "tbl_78B7_index",
    "tbl_78DC",
)

TABLE_NEXT = {
    "tbl_7594": "tbl_7613",
    "tbl_7613": "tbl_76DF_spr_A",
    "tbl_76DF_spr_A": "tbl_77AB",
    "tbl_77AB": "tbl_78B7_index",
    "tbl_78B7_index": "tbl_78DC",
    "tbl_78DC": "sub_bat_790C",
}

SMALL_TABLES = ("tbl_77AB", "tbl_78B7_index", "tbl_78DC")
ALL_TABLES = TABLE_ORDER

VARIANTS = [
    {"name": "current_control"},
    {"name": "helper_ops", "helper_ops": True},
    {"name": "small_tables", "tables": SMALL_TABLES},
    {"name": "helper_ops_small_tables", "helper_ops": True, "tables": SMALL_TABLES},
    {"name": "all_tables", "tables": ALL_TABLES},
    {"name": "helper_ops_all_tables", "helper_ops": True, "tables": ALL_TABLES},
    {
        "name": "helper_ops_all_tables_continue",
        "helper_ops": True,
        "tables": ALL_TABLES,
        "real_continue": True,
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


def compact_dc_b_lines(exprs: list[str], per_line: int = 8) -> list[str]:
    lines: list[str] = []
    for i in range(0, len(exprs), per_line):
        chunk = exprs[i : i + per_line]
        lines.append("    DC.B    " + ",".join(chunk))
    return lines


def materialize_table_block(text: str, label: str, next_label: str) -> str:
    start_re = re.compile(rf"(?m)^{re.escape(label)}:.*$")
    start_match = start_re.search(text)
    if not start_match:
        raise RuntimeError(f"table label not found: {label}")

    start = start_match.start()
    next_re = re.compile(rf"(?m)^{re.escape(next_label)}:")
    next_match = next_re.search(text, start_match.end())
    if not next_match:
        raise RuntimeError(f"next table label not found after {label}: {next_label}")
    end = next_match.start()

    block = text[start:end]
    block_lines = block.splitlines()

    first_directive = next(
        (idx for idx, line in enumerate(block_lines) if "[DIRECTIVE] .BYTE" in line),
        None,
    )
    if first_directive is None:
        raise RuntimeError(f"no directive bytes found in {label}")

    exprs: list[str] = []
    for line in block_lines[first_directive:]:
        m = re.search(r"\[DIRECTIVE\] \.BYTE (.+?)  -- needs manual handling", line)
        if not m:
            continue
        parts = [part.strip() for part in m.group(1).split(",") if part.strip()]
        exprs.extend(parts)

    if not exprs:
        raise RuntimeError(f"failed to parse bytes for {label}")

    prelude = block_lines[:first_directive]
    new_lines = prelude + compact_dc_b_lines(exprs) + [""]
    new_block = "\n".join(new_lines)
    return text[:start] + new_block + text[end:]


def apply_table_set(text: str, labels: tuple[str, ...] | None) -> str:
    if not labels:
        return text

    for label in TABLE_ORDER:
        if label not in labels:
            continue
        text = materialize_table_block(text, label, TABLE_NEXT[label])
    return text


def build_bank_s2(original: str, variant: dict[str, object]) -> str:
    text = original
    text = apply_fix_group(text, S2_HELPER_FIXES, bool(variant.get("helper_ops")))
    text = apply_table_set(text, variant.get("tables"))  # type: ignore[arg-type]
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
    original_bank_s2 = BANKS2.read_text(encoding="utf-8")

    try:
        for variant in VARIANTS:
            print(f"\n=== Building {variant['name']} ===")
            BANK02.write_text(original_bank02, encoding="utf-8")
            BANK06.write_text(build_bank06(original_bank06, variant), encoding="utf-8")
            BANKS2.write_text(build_bank_s2(original_bank_s2, variant), encoding="utf-8")
            subprocess.run(
                ["cmd.exe", "/c", str(BUILD_BAT)],
                cwd=str(ROOT),
                check=True,
            )
    finally:
        BANK02.write_text(original_bank02, encoding="utf-8")
        BANK06.write_text(original_bank06, encoding="utf-8")
        BANKS2.write_text(original_bank_s2, encoding="utf-8")
        print("\nRestored source files to original state.")


if __name__ == "__main__":
    main()
