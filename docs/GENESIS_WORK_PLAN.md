# Genesis Work Plan

This plan turns the repo map into execution.

## Objective

Map the entire port from original NES reference through Genesis runtime, then use that map to land a working Genesis result without blind iteration.

## Phase 1: Freeze The Ownership Model

Definition of done:

- The repo has a stable written source-of-truth map
- Every future bug is assigned to one layer before code changes begin

Primary references:

- `docs/SOURCE_OF_TRUTH_MAP.md`
- `docs/NEW_START_PROTOCOL.md`
- `docs/NEW_START_BASELINE.md`

## Phase 2: Map Original Script And Data Flow

Goal:

- Build a dependable original-side map for title, file-select, transition, and gameplay entry paths

Tasks:

1. Build a script-dispatch table from `src/banks/nes_original/bank_FF.asm`
2. Build a bank-02 title map from `src/banks/nes_original/bank_02.asm`
3. Build a title-buffer and title-data map from `src/banks/nes_original/bank_06.asm`
4. Cross-check labels against archive references in `Disassembly/`

Expected artifact:

- A document or CSV mapping script numbers to original entry symbols and bank locations

## Phase 3: Map Translation Fidelity

Goal:

- Prove whether the translated Genesis banks still represent the original control flow and data layout

Tasks:

1. Compare original bank-02 title symbols against `generated_vdp/bank_02_gen68k_vdp.asm`
2. Compare original bank-FF script dispatch against `generated_vdp/bank_FF_gen68k_vdp.asm`
3. Compare title data tables and CHR upload tables between original and translated outputs
4. Identify every title-path `PPU_WRITE_2006` and `PPU_WRITE_2007` call site in translated output

Expected artifact:

- A correspondence table from original symbol to translated symbol to bridge dependency

## Phase 4: Map Genesis Runtime Commit Points

Goal:

- Pin down where translated NES behavior becomes Genesis VRAM, CRAM, and visible output

Tasks:

1. Map `src/main.asm` startup preload paths
2. Map CHR shadow load versus startup tile preload
3. Map `PPU_FLUSH_TITLE_CHR_TO_VRAM` and its gating conditions
4. Map nametable, palette, and CHR commit timing inside `src/bridge/vdp_layer.asm`

Expected artifact:

- A dataflow diagram from NES-side writes to Genesis visible state

## Phase 5: Expand Probe Coverage

Goal:

- Make every important subsystem visible with repeatable diagnostics

Current probe foundation:

- `diag/scripts/zelda_title_timeline.lua`

Next probe tasks:

1. Expand watched CHR tiles to include the hardware-corrupted title glyphs
2. Add a flush-event probe around `PPU_TITLE_CHR_FLUSH_DONE`
3. Add script and subscript timeline probes for file-select and gameplay handoff
4. Add a title data provenance probe that watches the exact tile upload ranges used by bank 02 and bank 06 title routines

## Phase 6: Make It Work On Genesis

This phase starts only after the mapping artifacts say where the breakage lives.

Decision tree:

- If original data and translated data differ:
  - Fix the generator or restoration path
- If translated logic differs from original:
  - Fix the translator or a post-process tool
- If logic and data are both correct but hardware still diverges:
  - Fix bridge timing or Genesis runtime behavior

## Immediate Execution Lane

Highest-value next tasks:

1. Build a script-dispatch map from original `bank_FF.asm`
2. Build a title ownership map from original and translated `bank_02`
3. Expand the title timeline probe to watch the tiles that match the real-hardware corruption pattern
4. Add a dedicated flush-timing probe around the title-only CHR flush path

## Non-Negotiable Rules

1. One behavior change per experiment
2. No durable fixes in generated build outputs
3. Every experiment starts from a named baseline ROM
4. Every experiment produces a report and a classification
5. No more screen-first guessing

## Success Condition

The port is considered under control when:

- Original-side script/data ownership is documented
- Translation fidelity is documented
- Genesis commit timing is documented
- The remaining bug lane is narrow enough to patch with one targeted change and one measured rerun
