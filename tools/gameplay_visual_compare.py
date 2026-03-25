from __future__ import annotations

from pathlib import Path

import numpy as np
from PIL import Image

REPORTS = Path(r"C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS\diag\reports")


def load_rgb(path: Path) -> np.ndarray:
    return np.array(Image.open(path).convert("RGB").resize((256, 224)), dtype=np.float32)


def save_side_by_side(nes_img: np.ndarray, gen_img: np.ndarray, out_path: Path) -> None:
    both = np.concatenate([nes_img, gen_img], axis=1).astype(np.uint8)
    Image.fromarray(both, mode="RGB").save(out_path)


def save_abs_diff(nes_img: np.ndarray, gen_img: np.ndarray, out_path: Path) -> None:
    diff = np.abs(nes_img - gen_img)
    # Stretch for visibility so low-amplitude errors are still visible.
    diff = np.clip(diff * 2.0, 0, 255).astype(np.uint8)
    Image.fromarray(diff, mode="RGB").save(out_path)


def score(nes_img: np.ndarray, gen_img: np.ndarray) -> tuple[float, float, float, float, float]:
    delta = nes_img - gen_img
    mad = float(np.mean(np.abs(delta)))
    rmse = float(np.sqrt(np.mean(delta * delta)))

    # A simple 0-100 similarity score from mean absolute channel error.
    similarity = max(0.0, 100.0 - (mad / 255.0 * 100.0))

    # HUD-only crop helps separate UI parity from playfield parity.
    hud_nes = nes_img[0:32, :, :]
    hud_gen = gen_img[0:32, :, :]
    hud_mad = float(np.mean(np.abs(hud_nes - hud_gen)))

    # Playfield crop ignores top HUD for map/sprite fidelity.
    field_nes = nes_img[32:, :, :]
    field_gen = gen_img[32:, :, :]
    field_mad = float(np.mean(np.abs(field_nes - field_gen)))

    return mad, rmse, similarity, hud_mad, field_mad


def main() -> None:
    nes_path = REPORTS / "ss_gameplay_nes.png"

    genesis_candidates = sorted(REPORTS.glob("ss_gameplay_genesis_*.png"), key=lambda p: p.stat().st_mtime, reverse=True)
    if not genesis_candidates:
        raise SystemExit("No ss_gameplay_genesis_*.png found in diag/reports.")

    gen_path = genesis_candidates[0]

    if not nes_path.exists():
        raise SystemExit("Missing NES screenshot: diag/reports/ss_gameplay_nes.png")

    nes_img = load_rgb(nes_path)
    gen_img = load_rgb(gen_path)

    mad, rmse, similarity, hud_mad, field_mad = score(nes_img, gen_img)

    side_path = REPORTS / "gameplay_compare_side_by_side.png"
    diff_path = REPORTS / "gameplay_compare_diff.png"
    save_side_by_side(nes_img, gen_img, side_path)
    save_abs_diff(nes_img, gen_img, diff_path)

    report_lines = [
        "=== GAMEPLAY VISUAL COMPARE ===",
        f"nes_image={nes_path.name}",
        f"genesis_image={gen_path.name}",
        "",
        f"similarity_score={similarity:.2f}",
        f"mad={mad:.4f}",
        f"rmse={rmse:.4f}",
        f"hud_mad={hud_mad:.4f}",
        f"playfield_mad={field_mad:.4f}",
        "",
        f"side_by_side={side_path.name}",
        f"diff={diff_path.name}",
    ]

    report_path = REPORTS / "gameplay_visual_compare.txt"
    report_path.write_text("\n".join(report_lines) + "\n", encoding="utf-8")
    print(report_path.read_text(encoding="utf-8"))


if __name__ == "__main__":
    main()
