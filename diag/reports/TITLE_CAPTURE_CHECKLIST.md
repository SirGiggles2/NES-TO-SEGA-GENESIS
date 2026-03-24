# Title Capture Checklist (Ares + BlastEm)

Goal: capture the same 5 intro checkpoints in both emulators using neutral profiles.

## Required files

Place these PNG files in `diag/reports`:

- `ares_title_settled.png`
- `ares_fade_mid.png`
- `ares_scroll_start_visible.png`
- `ares_scroll_mid.png`
- `ares_scroll_end.png`

- `blastem_title_settled.png`
- `blastem_fade_mid.png`
- `blastem_scroll_start_visible.png`
- `blastem_scroll_mid.png`
- `blastem_scroll_end.png`

## Timing checkpoints (from BizHawk logs)

Use these as visual targets when pausing/capturing:

- **title_settled**: title hold, pre-fade (`ad0/ph0`, timer around 250)
- **fade_mid**: fade step around midpoint (`fade_step ~= $07`)
- **scroll_start_visible**: first visible scroll content (`scroll_y >= $20`)
- **scroll_mid**: around `scroll_y ~= $70`
- **scroll_end**: around `scroll_y ~= $D0`

## Launch commands

- Ares parity profile:
  - `powershell -ExecutionPolicy Bypass -File .\run_ares_parity.ps1`
- BlastEm neutral profile:
  - `& "D:\Emulation\Sega\Genesis\blastem-win64-0.6.3-pre-884de5ef1263\blastem.exe" "C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS\build\zelda_v495.md"`

## Notes

- Capture raw emulator output (no post-process overlays).
- If a checkpoint frame is all black, capture the nearest visible frame and keep the same filename.
- After captures are saved, run:
  - `py -3 .\tools\title_perfection_gate.py`
