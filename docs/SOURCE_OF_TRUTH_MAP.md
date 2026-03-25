# Source Of Truth Map

This document maps the repo from original NES reference material through the generated Genesis port artifacts.

## Layer Model

1. Original NES reference material
2. Port-owned NES source snapshot
3. Auto-generated 68000 translation
4. Auto-generated VDP-patched translation
5. Handwritten Genesis runtime and bridge
6. Diagnostics and parity harness

## Original Reference Layer

The `Disassembly/` folder is not active build input. It is a reference library.

Archive inventory:

- `Disassembly/Disassembly by aldonunez.zip`
  - Includes `Z_00.asm` through `Z_07.asm` plus variable include files.
  - Best match for the bank-oriented source style used under `src/banks/nes_original/`.
- `Disassembly/Disassembly by camthesaxman.zip`
  - Includes `bank0.asm` through `bank7.asm`, `zelda.asm`, `audio.inc`, music files, and common include files.
  - Useful as a second source of truth when one disassembly is ambiguous.
- `Disassembly/Disassembly by Trax.zip`
  - Includes text dumps `zelda1bank0.txt` through `zelda1bank7.txt` and `zelda1rammap.txt`.
  - Useful for quick address lookup and sanity checks.

Other reference aids in `Disassembly/`:

- `Legend of Zelda, The (U) (PRG0) [!].cdl`
- `table_file.tbl`
- TAS movie files

## Repo-Owned NES Source Snapshot

The active NES-side source snapshot lives in `src/banks/nes_original/`.

This is the closest in-repo source of truth for original logic during port work.

Key properties:

- One file per bank: `bank_00.asm` through `bank_FF.asm`
- Preserves original labels, comments, PPU register writes, and bank-local data tables
- Used as the semantic comparison target for translated Genesis banks
- Should be treated as read-only reference unless the project explicitly decides to resync from another disassembly source

## Generated Translation Layer

`src/banks/generated/`

Ownership:

- Primary generator: `tools/translator.py`
- Follow-up restorative tools may repair specific generated outputs or restore data blocks outside the translator itself

Characteristics:

- 6502 instructions mapped to 68000 instructions
- NES comments preserved inline
- Symbol names largely preserved
- Hardware I/O still needs bridge mediation

Important rule:

- These files are generated artifacts. If a fix belongs in translation logic, fix `tools/translator.py` or the dedicated post-process tool, not the generated output.

## Generated VDP Layer

`src/banks/generated_vdp/`

Ownership:

- Primary generator: `tools/patch_vdp.py`
- Rebuilt during every `build/build.bat` run from `src/banks/generated/`

Characteristics:

- Replaces PPU register accesses with bridge calls such as `PPU_WRITE_2006`, `PPU_WRITE_2007`, `PPU_READ_2002`
- Keeps translated control flow while routing graphics-side behavior through Genesis-specific bridge logic

Important rule:

- Do not make durable fixes directly in `generated_vdp/`. Those files are disposable build output.

## Handwritten Genesis Runtime Layer

Primary files:

- `src/main.asm`
- `src/bridge/vdp_layer.asm`
- `src/includes/*.asm`

Ownership:

- Handwritten project code
- Persistent source of truth for Genesis boot, interrupt, memory initialization, and PPU-to-VDP behavior

This is where platform-specific fixes belong when the translated engine is already proven correct.

## Build Orchestration Layer

Primary file:

- `build/build.bat`

Pipeline summary:

1. Run `tools/patch_vdp.py`
2. Run syntax cleanup in `generated_vdp/`
3. Run fix scripts for carry, ADC, SBC, INC, and BIT behavior
4. Assemble `src/main.asm` with `vasmm68k_mot.exe`
5. Fix ROM checksum

Consequence:

- `generated_vdp/` is regenerated every build
- The durable sources are the handwritten files plus the generator scripts and any referenced restored asset sources

## Diagnostics Layer

Primary areas:

- `diag/scripts/`
- top-level `run_*.ps1`
- `diag/reports/`

Purpose:

- Prove state transitions, RAM writes, nametable contents, palette contents, CHR contents, and emulator-specific behavior
- Provide evidence for whether a bug lives in logic, data, or bridge timing

## Title Screen Ownership Map

Title logic is spread across multiple source-of-truth layers.

Main title script entry:

- `src/banks/nes_original/bank_02.asm`
  - `ofs_main_script_2_0x009030_00_title_screen`
  - `ofs_006_903B_00_title_screen_handler`

Title script dispatcher on the NES side:

- `src/banks/nes_original/bank_FF.asm`
  - main-script dispatch table includes `ofs_main_script_2_0x009030_00_title_screen`

Title CHR and title buffer source data:

- `src/banks/nes_original/bank_02.asm`
  - `tbl_8000_tiles`
  - `tbl_8006_counter`
  - `tbl_800C_ppu_ppu_addr`
- `src/banks/nes_original/bank_06.asm`
  - `_off000_A869_10_title_screen`

Translated Genesis-side title entry points:

- `src/banks/generated_vdp/bank_02_gen68k_vdp.asm`
  - `ofs_main_script_2_0x009030_00_title_screen`
  - `ofs_006_903B_00_title_screen_handler`
  - title CHR upload path ends with `PPU_FLUSH_TITLE_CHR_TO_VRAM`
- `src/banks/generated_vdp/bank_FF_gen68k_vdp.asm`
  - title script dispatcher references the bank 02 title entry symbol
- `src/banks/generated_vdp/bank_06_gen68k_vdp.asm`
  - title PPU buffer data such as `ppu_buf_title_screen_real`

Bridge-side title commit behavior:

- `src/bridge/vdp_layer.asm`
  - `PPU_FLUSH_TITLE_CHR_TO_VRAM`
  - `PPU_FLUSH_CHR_SHADOW_TO_VRAM`

## Where Fixes Belong

Use this decision order:

1. If original NES data and translated data differ, fix the generation or restoration step.
2. If translated logic diverges from the NES source path, fix the translator or fix script.
3. If translated logic is correct but Genesis render timing differs, fix `src/bridge/vdp_layer.asm`.
4. If the issue is startup or interrupt order, fix `src/main.asm`.

## Practical Source-Of-Truth Rule

For debugging any behavior:

- First ask: what does `src/banks/nes_original/` say should happen?
- Then ask: does `generated/` preserve that logic?
- Then ask: does `generated_vdp/` preserve that logic while routing I/O correctly?
- Then ask: does the handwritten Genesis runtime commit that behavior correctly?

That is the ownership chain for the entire port.
