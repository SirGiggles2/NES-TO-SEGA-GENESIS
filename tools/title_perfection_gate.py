from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Tuple

import numpy as np
from PIL import Image


REPORTS = Path(r"C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS\diag\reports")

CHECKPOINTS = [
    "title_settled",
    "fade_mid",
    "scroll_start_visible",
    "scroll_mid",
    "scroll_end",
]

NES_CANDIDATES = {
    "title_settled": "nes_ss_title_nmi700.png",
    "fade_mid": "nes_ss_fade_nmi930.png",
    "scroll_start_visible": "nes_ss_scroll_visible_sy30.png",
    "scroll_mid": "nes_ss_scroll_mid.png",
    "scroll_end": "nes_ss_scroll_end.png",
}

EMU_PREFIXES = ["bizhawk", "ares", "blastem"]


@dataclass
class Metric:
    score: float
    mad: float
    rmse: float
    ref_nz: int
    cur_nz: int


def load_rgb(path: Path) -> np.ndarray:
    return np.array(Image.open(path).convert("RGB").resize((256, 224)), dtype=np.float32)


def score_pair(ref: np.ndarray, cur: np.ndarray) -> Metric:
    d = ref - cur
    mad = float(np.mean(np.abs(d)))
    rmse = float(np.sqrt(np.mean(d * d)))
    score = max(0.0, 100.0 - (mad / 255.0 * 100.0))
    ref_nz = int(np.count_nonzero(np.sum(ref, axis=2)))
    cur_nz = int(np.count_nonzero(np.sum(cur, axis=2)))
    return Metric(score=score, mad=mad, rmse=rmse, ref_nz=ref_nz, cur_nz=cur_nz)


def resolve_current_path(prefix: str, checkpoint: str) -> Path:
    # BizHawk canonical filenames
    if prefix == "bizhawk":
        mapping = {
            "title_settled": "ss_title_settled.png",
            "fade_mid": "ss_fade_mid.png",
            "scroll_start_visible": "ss_scroll_start_visible.png",
            "scroll_mid": "ss_phase2_f300.png",
            "scroll_end": "ss_phase2_f600.png",
        }
        return REPORTS / mapping[checkpoint]
    return REPORTS / f"{prefix}_{checkpoint}.png"


def valid(m: Metric) -> bool:
    # Reject near-empty captures that can produce misleadingly high similarity.
    return m.ref_nz >= 500 and m.cur_nz >= 500


def main() -> None:
    lines: List[str] = []
    lines.append("=== TITLE PERFECTION GATE ===")
    lines.append("")

    all_scores: Dict[str, List[float]] = {p: [] for p in EMU_PREFIXES}

    for checkpoint in CHECKPOINTS:
        ref_path = REPORTS / NES_CANDIDATES[checkpoint]
        if not ref_path.exists():
            lines.append(f"[MISSING REF] {checkpoint}: {ref_path.name}")
            continue
        ref = load_rgb(ref_path)
        lines.append(f"## {checkpoint}")
        lines.append(f"- ref: `{ref_path.name}`")
        for prefix in EMU_PREFIXES:
            cur_path = resolve_current_path(prefix, checkpoint)
            if not cur_path.exists():
                lines.append(f"- {prefix}: MISSING (`{cur_path.name}`)")
                continue
            cur = load_rgb(cur_path)
            m = score_pair(ref, cur)
            state = "OK" if valid(m) else "INVALID"
            lines.append(
                f"- {prefix}: {state} score={m.score:.1f} MAD={m.mad:.2f} RMSE={m.rmse:.2f} "
                f"ref_nz={m.ref_nz} cur_nz={m.cur_nz}"
            )
            if valid(m):
                all_scores[prefix].append(m.score)
        lines.append("")

    lines.append("## Overall")
    for prefix in EMU_PREFIXES:
        if all_scores[prefix]:
            overall = float(np.mean(all_scores[prefix]))
            gap = max(0.0, 100.0 - overall)
            lines.append(f"- {prefix}: overall={overall:.1f} -> gap_to_100={gap:.1f}")
        else:
            lines.append(f"- {prefix}: overall=N/A (no valid checkpoints)")

    output = REPORTS / "title_perfection_gate.txt"
    output.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(output.read_text(encoding="utf-8"))


if __name__ == "__main__":
    main()
