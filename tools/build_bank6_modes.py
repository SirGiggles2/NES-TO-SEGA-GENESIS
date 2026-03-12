from __future__ import annotations

import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BANK02 = ROOT / "src" / "banks" / "generated" / "bank_02_gen68k.asm"
BANK06 = ROOT / "src" / "banks" / "generated" / "bank_06_gen68k.asm"
BUILD_BAT = ROOT / "build" / "build.bat"


VARIANTS = [
    {"name": "baseline_on", "autostart": True},
    {"name": "real_6a6c", "autostart": True, "real_6a_6c": True},
    {"name": "real_continue", "autostart": True, "real_continue": True},
    {"name": "real_7678", "autostart": True, "real_76_78": True},
    {"name": "real_26505a", "autostart": True, "real_26_50_5a": True},
    {"name": "ram0302_direct", "autostart": True, "ram_0302_direct": True},
    {"name": "ram0302_alias", "autostart": True, "ram_0302_alias_direct": True},
    {
        "name": "all_real_optional",
        "autostart": True,
        "real_6a_6c": True,
        "real_continue": True,
        "real_76_78": True,
        "real_26_50_5a": True,
    },
    {
        "name": "all_real_plus_direct",
        "autostart": True,
        "real_6a_6c": True,
        "real_continue": True,
        "real_76_78": True,
        "real_26_50_5a": True,
        "ram_0302_direct": True,
    },
    {
        "name": "all_real_plus_alias",
        "autostart": True,
        "real_6a_6c": True,
        "real_continue": True,
        "real_76_78": True,
        "real_26_50_5a": True,
        "ram_0302_alias_direct": True,
    },
]


def replace_once(text: str, old: str, new: str) -> str:
    if old not in text:
        raise RuntimeError(f"expected snippet not found:\n{old}")
    return text.replace(old, new, 1)


def build_bank02(original: str, variant: dict[str, object]) -> str:
    text = original
    if variant.get("autostart"):
        text = replace_once(
            text,
            "title_autostart_cfg:\n    DC.B    $00",
            "title_autostart_cfg:\n    DC.B    $01",
        )
    return text


def enable_flag(text: str, label: str) -> str:
    return replace_once(
        text,
        f"{label}:\n    DC.B    $00",
        f"{label}:\n    DC.B    $01",
    )


def build_bank06(original: str, variant: dict[str, object]) -> str:
    text = original
    for label in (
        "b06_cfg_real_6a_6c",
        "b06_cfg_real_continue",
        "b06_cfg_real_76_78",
        "b06_cfg_real_26_50_5a",
        "b06_cfg_ram_0302_direct",
        "b06_cfg_ram_0302_alias_direct",
    ):
        key = label.removeprefix("b06_cfg_")
        if variant.get(key):
            text = enable_flag(text, label)
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
