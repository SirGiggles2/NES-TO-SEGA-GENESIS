# Merge Notes

This package merges the GitHub repo ZIP and the full working project ZIP into one organized tree.

## What was preserved

- documentation from the GitHub repo under `docs/`
- current hand-edited bridge files under `src/bridge/`
- translated/generated bank files under `src/banks/`
- original NES bank sources under `src/banks/nes_original/`
- helper scripts under `tools/`
- build scripts under `build/`
- diagnostics, reports, and screenshots under `artifacts/` and `diag/`
- ROM outputs under `artifacts/roms/`
- emulator/toolchain binaries under `build/toolchain/`

## Important starting points

- `src/bridge/vdp_layer.asm`
- `src/main.asm`
- `src/banks/generated_vdp/bank_FF_gen68k_vdp.asm`
- `diag/scripts/zelda_diag.lua`
- `build/build.bat`

## Suggested next step

Use this organized tree as the new repo root, then commit it into GitHub on a new branch such as `import/organized-project`.
