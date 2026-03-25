# New Start Protocol

This branch restarts the title-corruption investigation from a clean method, not from zero information.

## Keep

- Branch: `new-start`
- Baseline ROM: `build/zelda_v556.md`
- Existing architecture docs:
  - `docs/architecture.md`
  - `docs/workflow.md`
  - `docs/memory-map.md`
  - `docs/TITLE_PERFECTION_PROTOCOL.md`
- Existing evidence worth preserving:
  - nametable dumps in `diag/reports/nt_dump_v551_20260324_195933.txt` and `diag/reports/nt_dump_v552_20260324_201034.txt`
  - palette dumps in `diag/reports/palette_debug_v551_20260324_195711.txt` and `diag/reports/palette_debug_v552_20260324_200912.txt`
  - mapper and mirror probes gathered during v551-v553

## What We Now Treat As Proven

- The repo must be debugged as layered systems, not as one asm file.
- The visual symptom is not enough to identify the broken layer.
- The bad `PPUCTRL` bit experiment made hardware output worse and is discarded.
- Title corruption is more likely to be caused by title-time CHR production and flush policy than by generic palette or nametable math.
- Startup VRAM preload and runtime CHR shadow are distinct systems and must be observed separately.

## New Rules

1. Start every title experiment from `build/zelda_v556.md` or a documented descendant.
2. Change one behavior at a time.
3. Do not patch `src/bridge/vdp_layer.asm` unless the timeline probe points directly at bridge behavior.
4. Treat generated VDP bank files as evidence first and edit targets last.
5. Save artifacts for every pass: ROM name, probe output, screenshots, and classification.

## First Investigation Goal

Build a title-only timeline from reset through steady title hold.

The timeline must prove:

- when `ram_script`, `ram_subscript`, `ram_ppu_load_index`, and `ram_005C` change
- when title-phase state changes (`$FF042C`, `$FF042D`)
- when `PPU_TITLE_CHR_FLUSH_DONE` flips
- whether observed CHR tiles change before corruption stabilizes
- whether nametable state is already sane while CHR content is still unstable

## Required Probe

Run:

- `run_title_timeline.ps1 -Rom zelda_v556`

This produces:

- `diag/reports/title_timeline_zelda_v556.txt`
- `diag/reports/title_timeline_zelda_v556.done`

## Investigation Windows

The first pass should examine four windows:

1. Reset to first title-script entry
2. Early title construction
3. Transition into title hold
4. Steady title hold near frame 900

## Decision Gate Before Any Code Patch

Only patch code after one of these is true:

- CHR tiles continue changing after title hold should be stable
- CHR tiles stop changing too early while title state still advances
- `PPU_TITLE_CHR_FLUSH_DONE` suppresses flushes before title tiles settle
- title state is stable, CHR is stable, and the wrong data is already present in shadow

If none of those are true, gather more timeline data before editing runtime code.

## Classification

Every run should end with one classification:

- `chr_still_mutating`
- `chr_frozen_too_early`
- `shadow_wrong_before_flush`
- `bridge_flush_suspect`
- `title_state_not_reaching_hold`
- `same_as_baseline`

## Immediate Next Step

Use the new title timeline probe on `zelda_v556` and make the first decision from the timeline, not from screenshots alone.