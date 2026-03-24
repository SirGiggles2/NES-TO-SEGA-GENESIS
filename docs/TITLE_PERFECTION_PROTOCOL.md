# Title Perfection Protocol (Toward 100%)

This protocol is the fastest known path to an emulator-robust "perfect" title screen.

## Objective

Reach `100.0` title parity score under validated checkpoints, and maintain >= `98` on
scroll/fade checkpoints, across:

- BizHawk (instrumentation baseline)
- BlastEm (neutral profile)
- Ares (neutral profile)

## Core principle

Separate **logic correctness** from **display fidelity**:

1. BizHawk Lua scripts prove RAM/state/timing correctness.
2. Ares/BlastEm captures prove visual parity under neutral settings.
3. Only tune palette/render code when logic is stable.

## Required tooling

- BizHawk capture scripts:
  - `diag/scripts/zelda_visual_capture.lua`
  - `diag/scripts/zelda_nes_visual_capture.lua`
- External emulator setup:
  - BlastEm neutral profile: `%LOCALAPPDATA%/blastem/blastem.cfg`
  - Ares neutral profile: `tools/ares_settings_parity.bml`
- Scorers:
  - `tools/title_perfection_report.py` (internal loop)
  - `tools/title_perfection_gate.py` (cross-emulator gate)
- Capture checklist:
  - `diag/reports/TITLE_CAPTURE_CHECKLIST.md`

## Iteration loop (mandatory each pass)

1. **Build ROM**
   - `build/build.bat`
2. **Run BizHawk probes**
   - visual capture + NES capture scripts
3. **Generate scores**
   - `title_perfection_report.py`
   - `title_perfection_gate.py`
4. **Patch one targeted lever only**
   - Prefer phase-gated palette/render tweaks over broad global changes.
5. **Re-run loop and compare deltas**
   - Keep change only if:
     - title score improves, and
     - no unacceptable regression in fade/scroll checkpoints.
6. **Update handoff**
   - append rationale, metrics before/after, and decision.

## Priority order for levers

1. **Checkpoint validity**
   - eliminate black/invalid oracle frames first.
2. **Title-hold-only palette tuning**
   - gate by script + phase (`ad0/ph0`) to avoid fade pollution.
3. **PPU load/index fidelity**
   - verify title buffer and loader path behavior.
4. **CHR/nametable consistency**
   - ensure title tiles referenced are uploaded/decoded correctly.
5. **Cross-emulator normalization**
   - avoid shader/filter/overscan noise.

## Definition of done (strict)

- BizHawk title score >= 98 with valid checkpoints.
- Ares title score >= 98 with valid checkpoints.
- BlastEm title score >= 98 with valid checkpoints.
- No invalid reference frames in gated checkpoints.
- Scroll/fade checkpoints remain stable and visually consistent.
