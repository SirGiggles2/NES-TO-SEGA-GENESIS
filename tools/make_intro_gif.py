from __future__ import annotations

import argparse
from pathlib import Path
import re

from PIL import Image


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Build a preview GIF from captured intro frames.")
    parser.add_argument("reports_dir", help="Directory containing capture frames")
    parser.add_argument("--prefix", default="blastem_intro_cap", help="Frame filename prefix")
    parser.add_argument("--out", default="blastem_intro_preview.gif", help="Output GIF filename")
    parser.add_argument("--step", type=int, default=4, help="Use every Nth frame")
    parser.add_argument("--max-frames", type=int, default=300, help="Max frames in output GIF")
    parser.add_argument("--frame-ms", type=int, default=80, help="Milliseconds per GIF frame")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    reports = Path(args.reports_dir)
    rx = re.compile(rf"^{re.escape(args.prefix)}_(\d+)\.png$")

    matches: list[tuple[int, Path]] = []
    for p in reports.glob(f"{args.prefix}_*.png"):
        m = rx.match(p.name)
        if m:
            matches.append((int(m.group(1)), p))
    matches.sort(key=lambda x: x[0])

    if not matches:
        raise SystemExit(f"No frames found for prefix '{args.prefix}' in {reports}")

    selected = [p for i, p in enumerate([m[1] for m in matches]) if i % max(1, args.step) == 0]
    if len(selected) > args.max_frames:
        selected = selected[: args.max_frames]

    frames = [Image.open(p).convert("P", palette=Image.ADAPTIVE) for p in selected]
    out_path = reports / args.out
    frames[0].save(
        out_path,
        save_all=True,
        append_images=frames[1:],
        duration=max(10, args.frame_ms),
        loop=0,
        optimize=False,
    )

    print(f"GIF written: {out_path}")
    print(f"Source frames: {len(matches)} | GIF frames: {len(frames)}")


if __name__ == "__main__":
    main()
