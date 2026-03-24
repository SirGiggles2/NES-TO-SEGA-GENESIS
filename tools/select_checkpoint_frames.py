from __future__ import annotations

from pathlib import Path
import shutil
import sys
import re

import numpy as np
from PIL import Image


REPORTS = Path(r"C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS\diag\reports")
TARGETS = {
    "title_settled": "nes_ss_title_nmi700.png",
    "fade_mid": "ss_fade_mid.png",
    "scroll_start_visible": "ss_scroll_start_visible.png",
    "scroll_mid": "ss_phase2_f300.png",
    "scroll_end": "ss_phase2_f600.png",
}

WINDOWS = {
    "title_settled": (0.10, 0.35),
    "fade_mid": (0.25, 0.45),
    "scroll_start_visible": (0.35, 0.60),
    "scroll_mid": (0.45, 0.75),
    "scroll_end": (0.60, 0.95),
}

MIN_NZ_BY_CHECKPOINT = {
    # Prevent selecting near-black title frames that can look deceptively similar.
    "title_settled": 5000,
}


def load_gray(path: Path) -> np.ndarray:
    return np.array(Image.open(path).convert("L").resize((256, 224)), dtype=np.float32)


def main() -> None:
    if len(sys.argv) != 3:
        raise SystemExit("Usage: py select_checkpoint_frames.py <capture_prefix> <output_prefix>")

    capture_prefix = sys.argv[1]
    out_prefix = sys.argv[2]

    frames = sorted(REPORTS.glob(f"{capture_prefix}_*.png"))
    if not frames:
        raise SystemExit(f"No captured frames found for prefix: {capture_prefix}")

    parsed = []
    rx = re.compile(r".*_(\d+)\.png$")
    for f in frames:
        m = rx.match(f.name)
        idx = int(m.group(1)) if m else 0
        parsed.append((f, idx, load_gray(f)))
    max_idx = max(idx for _, idx, _ in parsed) if parsed else 1

    lines = []
    lines.append(f"=== Frame Selection ({capture_prefix} -> {out_prefix}) ===")

    for checkpoint, target_name in TARGETS.items():
        target_path = REPORTS / target_name
        if not target_path.exists():
            lines.append(f"{checkpoint}: missing target `{target_name}`")
            continue
        target = load_gray(target_path)

        lo_p, hi_p = WINDOWS.get(checkpoint, (0.0, 1.0))
        lo_i = int(max_idx * lo_p)
        hi_i = int(max_idx * hi_p)
        window = [(p, idx, arr) for (p, idx, arr) in parsed if lo_i <= idx <= hi_i]
        if not window:
            window = parsed

        best = None
        ref_nz = int(np.count_nonzero(target))
        # Prefer candidates with meaningful non-black content to avoid false matches.
        meaningful = []
        min_nz = int(MIN_NZ_BY_CHECKPOINT.get(checkpoint, 500))
        for frame_path, idx, arr in window:
            nz = int(np.count_nonzero(arr))
            if nz >= min_nz:
                meaningful.append((frame_path, idx, arr, nz))
        if not meaningful:
            meaningful = [(frame_path, idx, arr, int(np.count_nonzero(arr))) for frame_path, idx, arr in window]
        for frame_path, idx, arr, nz in meaningful:
            mad = float(np.mean(np.abs(target - arr)))
            nz_penalty = abs(nz - ref_nz) / max(ref_nz, 1)
            score = mad + (nz_penalty * 20.0)
            if best is None or score < best[0]:
                best = (score, frame_path, idx, nz, mad, nz_penalty)

        assert best is not None
        out_path = REPORTS / f"{out_prefix}_{checkpoint}.png"
        shutil.copy2(best[1], out_path)
        lines.append(
            f"{checkpoint}: {best[1].name} idx={best[2]} nz={best[3]} "
            f"window=[{lo_i},{hi_i}] mad={best[4]:.2f} nz_penalty={best[5]:.3f} "
            f"score={best[0]:.2f} -> {out_path.name}"
        )

    out_report = REPORTS / f"{out_prefix}_auto_selection.txt"
    out_report.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(out_report.read_text(encoding="utf-8"))


if __name__ == "__main__":
    main()
