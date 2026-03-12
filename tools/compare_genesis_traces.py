#!/usr/bin/env python3
"""Compare two Genesis oracle traces and find the first divergence."""

import csv
import sys
from pathlib import Path


def load(path):
    with open(path, "r", newline="", encoding="utf-8") as f:
        return list(csv.DictReader(f))


def main():
    if len(sys.argv) != 3:
        print("Usage: py tools/compare_genesis_traces.py <trace_a.csv> <trace_b.csv>")
        return 1

    pa, pb = Path(sys.argv[1]), Path(sys.argv[2])
    a_rows, b_rows = load(pa), load(pb)
    print(f"Trace A: {pa}  ({len(a_rows)} rows)")
    print(f"Trace B: {pb}  ({len(b_rows)} rows)")
    print(f"A rom_label: {a_rows[0].get('rom_label', '?')}")
    print(f"B rom_label: {b_rows[0].get('rom_label', '?')}")
    print()

    skip = {"frame", "system", "rom_label"}
    limit = min(len(a_rows), len(b_rows))
    found = False

    for i in range(limit):
        a, b = a_rows[i], b_rows[i]
        diffs = []
        for k in a:
            if k in skip:
                continue
            va = a.get(k, "")
            vb = b.get(k, "")
            if va != vb:
                diffs.append((k, va, vb))
        if diffs:
            if not found:
                print(f"=== First divergence at row {i} (frame A={a['frame']}, B={b['frame']}) ===")
                for k, va, vb in diffs:
                    print(f"  {k}: A={va}  B={vb}")
                print()
                found = True

                # Show context window
                print("Context window:")
                focus = ["pc", "PPU_EVT_COUNT", "SEQ_EVT_COUNT", "PPU_REQ_INDEX",
                         "PPU_REQ_PTR", "PPU_REQ_RES", "ppu_load_index",
                         "ppu_buf_status", "ppu_buf_0", "ppu_buf_1", "ppu_buf_2"]
                focus = [f for f in focus if f in a]
                hdr = "  {:>5} " + " ".join(f"{f:>16}" for f in focus)
                print(hdr.format("frame"))
                for j in range(max(0, i - 5), min(limit, i + 10)):
                    ra, rb = a_rows[j], b_rows[j]
                    vals_a = " ".join(f"{ra.get(f, ''):>16}" for f in focus)
                    vals_b = " ".join(f"{rb.get(f, ''):>16}" for f in focus)
                    mark = " <<<" if j == i else ""
                    print(f"  A {ra['frame']:>3} {vals_a}{mark}")
                    print(f"  B {rb['frame']:>3} {vals_b}{mark}")
                    if j == i:
                        print(f"  {'---':>5} " + "-" * (17 * len(focus)))
                break

    if not found:
        print("No divergence found in any field across all rows.")
        print()
        # Show last few frames of key fields
        print("Last 5 frames (key fields):")
        focus = ["pc", "PPU_EVT_COUNT", "SEQ_EVT_COUNT", "ppu_load_index",
                 "ppu_buf_status", "ppu_buf_0"]
        focus = [f for f in focus if f in a_rows[0]]
        hdr = "  {:>5} " + " ".join(f"{f:>16}" for f in focus)
        print(hdr.format("frame"))
        for j in range(max(0, limit - 5), limit):
            ra, rb = a_rows[j], b_rows[j]
            vals_a = " ".join(f"{ra.get(f, ''):>16}" for f in focus)
            vals_b = " ".join(f"{rb.get(f, ''):>16}" for f in focus)
            print(f"  A {ra['frame']:>3} {vals_a}")
            print(f"  B {rb['frame']:>3} {vals_b}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
