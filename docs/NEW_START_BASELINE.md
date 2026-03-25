# New Start Baseline

Baseline run:

- Branch: `new-start`
- ROM: `build/zelda_v556.md`
- Probe: `run_title_timeline.ps1 -Rom zelda_v556`
- Output: `diag/reports/title_timeline_zelda_v556.txt`

## Key Observations

1. CHR activity starts before the game is screen-ready.
   - At frame 16, watched CHR tile `008` mutates while `ready=00`, `phase=00`, and the nametable is still blank.
2. The title flush one-shot flag asserts early.
   - At frame 54, `flush_done=01` while `ready=00`, `script=00`, `sub=00`, and the title is not yet in a stable visible state.
3. Nametable fill begins after the early flush event.
   - Around frames 78-81, watched title rows fill with `24` values while `flush_done` is already set.
4. Palette state arrives after the early CHR and nametable activity.
   - Around frame 132, the palette becomes non-zero while the watched title tiles are already largely settled.
5. Watched CHR can change transiently during early title construction.
   - Tile `01C` briefly fills with `24` bytes around frame 135 and then clears again by frame 145.
6. By steady title hold, the watched state is stable in BizHawk.
   - Near frames 1351-1500: `ready=01`, `phase=01`, `script=00`, `sub=00`, `ppu_idx=00`, `ram_005C=00`.
   - Watched nametable rows, palette, and watched CHR tiles remain stable.

## Initial Classification

`bridge_flush_suspect`

Reason:

- The title-only one-shot flush gate is arming before the rest of title construction has fully settled.
- In BizHawk the final watched state is stable, which makes the remaining problem look more like a timing and commit policy issue than a continuously mutating title stream.
- That does not yet prove the bridge is wrong, but it does justify making flush timing the first narrow lane of investigation.

## What This Baseline Rules Out

- A constantly mutating watched title CHR set during late steady title hold in BizHawk.
- A late nametable storm continuing through the steady title window for the watched rows.

## What To Prove Next

1. Whether the early `flush_done=01` event corresponds to a partial CHR commit on hardware.
2. Whether the watched CHR set is too small and misses the actually corrupted hardware tiles.
3. Whether VBlank-gated flush cadence differs materially across BizHawk, BlastEm, Ares, and real hardware.