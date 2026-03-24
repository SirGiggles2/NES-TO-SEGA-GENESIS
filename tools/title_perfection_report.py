from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

import numpy as np
from PIL import Image


REPORTS = Path(r"C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS\diag\reports")


@dataclass
class Score:
    label: str
    mad: float
    rmse: float
    score: float
    cur_nz_pixels: int
    cur_mean_luma: float
    ref_nz_pixels: int
    ref_mean_luma: float


def load_rgb(path: Path) -> np.ndarray:
    return np.array(Image.open(path).convert("RGB").resize((256, 224)), dtype=np.float32)


def score_pair(label: str, ref: np.ndarray, cur: np.ndarray) -> Score:
    delta = ref - cur
    mad = float(np.mean(np.abs(delta)))
    rmse = float(np.sqrt(np.mean(delta * delta)))
    score = max(0.0, 100.0 - (mad / 255.0 * 100.0))
    cur_nz = int(np.count_nonzero(np.sum(cur, axis=2)))
    cur_mean = float(np.mean(cur))
    ref_nz = int(np.count_nonzero(np.sum(ref, axis=2)))
    ref_mean = float(np.mean(ref))
    return Score(label, mad, rmse, score, cur_nz, cur_mean, ref_nz, ref_mean)


def find_title_candidates() -> Iterable[Path]:
    return sorted(REPORTS.glob("nes_ss_title_nmi*.png"))


def pick_best_reference(
    label: str, ref_candidates: Iterable[Path], current_img_path: Path, min_ref_nz: int = 1
) -> tuple[Score, np.ndarray, str]:
    cur = load_rgb(current_img_path)
    scored = []
    for p in ref_candidates:
        ref = load_rgb(p)
        s = score_pair(label, ref, cur)
        if s.ref_nz_pixels >= min_ref_nz:
            scored.append((s, ref, p.name))
    if not scored:
        # fallback to all candidates even if dark/empty
        for p in ref_candidates:
            ref = load_rgb(p)
            s = score_pair(label, ref, cur)
            scored.append((s, ref, p.name))
    scored.sort(key=lambda t: t[0].score, reverse=True)
    return scored[0]


def main() -> None:
    genesis_title = load_rgb(REPORTS / "ss_title_settled.png")

    candidates = []
    for p in find_title_candidates():
        nes_img = load_rgb(p)
        s = score_pair(p.name, nes_img, genesis_title)
        candidates.append((s, nes_img, p.name))

    if not candidates:
        raise SystemExit("No nes_ss_title_nmi*.png candidates found.")

    # Filter out invalid/near-black title oracle frames first.
    valid_candidates = [t for t in candidates if t[0].ref_nz_pixels >= 5000 and t[0].ref_mean_luma >= 1.0]
    if not valid_candidates:
        # Fallback: keep prior behavior if every candidate is dark/invalid.
        valid_candidates = candidates

    # Highest score = closest match among valid candidates.
    valid_candidates.sort(key=lambda t: t[0].score, reverse=True)
    best_score, best_nes_img, best_name = valid_candidates[0]

    fade_best, fade_ref, fade_name = pick_best_reference(
        "fade_mid", sorted(REPORTS.glob("nes_ss_fade_nmi*.png")), REPORTS / "ss_fade_mid.png", min_ref_nz=100
    )
    scroll_visible_best, scroll_visible_ref, scroll_visible_name = pick_best_reference(
        "scroll_start_visible",
        sorted(REPORTS.glob("nes_ss_scroll_visible_sy*.png")),
        REPORTS / "ss_scroll_start_visible.png",
        min_ref_nz=100,
    )

    pairs = [
        ("title(best)", best_nes_img, load_rgb(REPORTS / "ss_title_settled.png")),
        ("fade_mid(best)", fade_ref, load_rgb(REPORTS / "ss_fade_mid.png")),
        ("scroll_start", load_rgb(REPORTS / "nes_ss_scroll_start.png"), load_rgb(REPORTS / "ss_ad1_ph0.png")),
        ("scroll_start_visible(best)", scroll_visible_ref, load_rgb(REPORTS / "ss_scroll_start_visible.png")),
        ("scroll_mid", load_rgb(REPORTS / "nes_ss_scroll_mid.png"), load_rgb(REPORTS / "ss_phase2_f300.png")),
        ("scroll_end", load_rgb(REPORTS / "nes_ss_scroll_end.png"), load_rgb(REPORTS / "ss_phase2_f600.png")),
    ]

    scores: list[Score] = []
    for label, ref, cur in pairs:
        scores.append(score_pair(label, ref, cur))

    lines = []
    lines.append("=== TITLE PERFECTION REPORT ===")
    lines.append("")
    lines.append(f"Best NES title candidate: {best_name} (score={best_score.score:.1f}, MAD={best_score.mad:.2f})")
    lines.append(f"Candidate pool: {len(candidates)} total, {len(valid_candidates)} valid (non-black)")
    lines.append(f"Best NES fade candidate: {fade_name} (score={fade_best.score:.1f}, MAD={fade_best.mad:.2f})")
    lines.append(
        f"Best NES visible-scroll candidate: {scroll_visible_name} "
        f"(score={scroll_visible_best.score:.1f}, MAD={scroll_visible_best.mad:.2f})"
    )
    lines.append("")
    lines.append("Checkpoint scores:")
    for s in scores:
        lines.append(
            f"- {s.label}: score={s.score:.1f} MAD={s.mad:.2f} RMSE={s.rmse:.2f} "
            f"ref_nz={s.ref_nz_pixels} ref_mean={s.ref_mean_luma:.2f} "
            f"cur_nz={s.cur_nz_pixels} cur_mean={s.cur_mean_luma:.2f}"
        )

    lines.append("")
    lines.append("Sanity checks:")
    valid_scores = []
    for s in scores:
        status = "OK"
        if s.ref_nz_pixels == 0:
            status = "INVALID REF (all-black frame)"
        elif s.cur_nz_pixels == 0:
            status = "INVALID CUR (all-black frame)"
        elif s.ref_mean_luma < 1.0:
            status = "SUSPECT REF (near-black frame)"
        elif s.cur_mean_luma < 1.0:
            status = "SUSPECT CUR (near-black frame)"
        else:
            valid_scores.append(s.score)
        lines.append(f"- {s.label}: {status}")

    lines.append("")
    if valid_scores:
        overall = float(np.mean(valid_scores))
        lines.append(f"Overall score (valid checkpoints only): {overall:.1f}")
    else:
        lines.append("Overall score (valid checkpoints only): N/A (no valid checkpoints)")

    out = REPORTS / "title_perfection_report.txt"
    out.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(out.read_text(encoding="utf-8"))


if __name__ == "__main__":
    main()
