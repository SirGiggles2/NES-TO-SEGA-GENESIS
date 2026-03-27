# AI HANDOFF - NES Zelda 1 to Sega Genesis Port

**Date:** 2026-03-26
**Branch:** `new-start`
**Current ROM Version:** `zelda_v659` (latest built candidate)
**Best Stable Runtime Baseline:** `zelda_v659`
**Status:** `v659` fixes the v658 startup-readiness stall via bank-6 direct-buffer validation and passes the full build+runtime gate

---

## Resume Here (30 Seconds)

- Baseline to trust now: `zelda_v659`
	- smoke pass in `diag/reports/smoke_test_zelda_v659.json`
	- full gate pass in `diag/reports/frontend_probe_zelda_v659.txt` and `diag/reports/gameplay_probe_zelda_v659.txt`
- Latest regression candidate: `zelda_v658`
	- smoke fail in `diag/reports/smoke_test_zelda_v658.json`
	- failure shape: `pass_ready=false`, `ready_count=0`, `final_frm_cnt=0`
- Last structural change:
	- added `sub_b06_sanitize_ram_0302_if_invalid` in `src/banks/generated/bank_06_gen68k.asm`
	- added build-time guard `tools/check_ppu_buffer_safety.py` in `build/build.bat`

Immediate next command set:
1. `./run_build_and_gate.ps1 -SkipBuild -Rom 'zelda_v659'`
2. Compare `diag/reports/gameplay_probe_zelda_v659.txt` vs `diag/reports/gameplay_probe_zelda_v657.txt`
3. Use `zelda_v658` only as the startup-regression reference, not as a baseline

Decision rule:
- Preserve `v659` startup readiness and direct-buffer self-healing behavior; do not treat `v658` as baseline.

---

## Executive Summary

Important update from the latest run:

- `v659` is now the practical runtime baseline.
- `v659` passes smoke, frontend, gameplay, regression gate, and ledger recording.
- `v658` remains the useful regression reference for the startup-readiness stall.
- The winning structural fix was not a return to the old pre-NMI clobber. It was validating the raw `$0302` direct-buffer header before the legacy bank-6 parser consumes it.

New reference reports:
- `diag/reports/smoke_test_zelda_v659.json`
- `diag/reports/frontend_probe_zelda_v659.txt`
- `diag/reports/gameplay_probe_zelda_v659.txt`
- `diag/reports/smoke_test_zelda_v658.json`

---

## /chuckle Outcome (Latest)

This section records the 4-step `/chuckle` protocol result so the next session can continue without re-discovery.

### Step 1 - Real Problem

The violated invariant was startup-safe direct PPU buffer lifecycle in bank 6:

- the legacy `$0302` direct-buffer path must only ever parse a well-formed header or the `$FF` terminator,
- stale `$0302` bytes must not be allowed to masquerade as a valid PPU command stream during early translated NMI,
- bridge-side title recovery logic is not proof the startup path is healthy if bank-6 buffer consumption is unsafe.

### Step 2 - Research What Exists

Classification of existing logic:

- Workaround:
	- title one-shot fallback that force-queues index `$10` in `src/bridge/vdp_layer.asm`
	- title display pulse/visibility helpers in `src/bridge/vdp_layer.asm`
- Actual solution infrastructure already present:
	- translated NMI calls generic indexed writer in `src/banks/generated_vdp/bank_FF_gen68k_vdp.asm`
	- generic indexed writer and real ROM-backed PPU buffer selector in `src/banks/generated_vdp/bank_06_gen68k_vdp.asm`
	- real title blob data in `src/banks/generated_vdp/bank_06_gen68k_vdp.asm`
	- generic writer already resets `ram_ppu_load_index`, `ram_0301_buffer_index`, and `ram_0302_ppu_buffer` to `0/0/$FF` after a clean consume

Key finding:
- `v658` did not fail because the old clobber was missing in the abstract; it failed because the legacy bank-6 `$0302` path still trusted any non-`$FF` first byte as a real PPU header.
- when `ram_ppu_load_index` falls back to table index `00`, the request still resolves through `ram_0302_ppu_buffer`.

### Step 3 - Structural Fix Applied

Applied change:
- added `sub_b06_sanitize_ram_0302_if_invalid` in `src/banks/generated/bank_06_gen68k.asm`
- bank-6 legacy path now calls that helper whenever raw request pointer `$0302` is about to be parsed

This makes stale direct-buffer garbage self-heal back to the `$FF` terminator instead of being misparsed as startup work.

### Step 4 - System Verifies Itself

Verification and guardrail state:

- Build-time guard script extended in `tools/check_vdp_title_regressions.py` to fail if the exact pre-NMI clobber pattern returns.
- Added `tools/check_ppu_buffer_safety.py` and wired it into `build/build.bat`.
- `run_build_and_gate.ps1` still invokes the bridge guard before runtime gate, and the normal build now fails fast if the bank-6 `$0302` validation hook disappears.

Measured result:

- `v658` smoke fails:
	- `pass=false`
	- `pass_ready=false`
	- `ready_count=0`
	- `final_frm_cnt=0`
- `v659` smoke passes:
	- `pass=true`
	- `pass_ready=true`
	- `ready_count=802`
	- `final_frm_cnt=207`
- `v659` full gate passes:
	- `title_ready_frame=143`
	- `file_select_ready_frame=247/248`
	- `gameplay_entry_frame=561`
	- `accuracy_score=168`
	- `status=PASS`

Conclusion:
- `/chuckle` found the real structural issue and landed the net-correct startup fix.
- Keep `v659` as runtime baseline and treat `v658` as the regression repro for stale `$0302` startup parsing.

---

This run produced a real root-cause fix in the title/file-select/register graphics path.

The important result is `v633`:
- the old frame-42 tile `0x25` corruption is gone in emulator traces,
- the register cursor tile `0x25` is no longer blank in the register-state probe,
- title -> file select -> gameplay still works,
- movement and pause both pass,
- room transition still fails.

The best scored interaction baseline is still `v627` in the ledgers because the current accuracy/regression rules are parity-oriented and `v633` is still marked `FAIL` there. That does **not** mean `v633` was a fake fix. It means the graphics/data-path improved while the interaction gate still sees a remaining transition problem and timing deviations versus the NES reference.

---

## Current Truth

### Best scored interaction baseline

Use `v627` when the question is "what is the last clean interaction baseline in the ledgers?"

What `v627` proves:
- gameplay entry at frame `918`
- movement `PASS`
- pause `PASS`
- room transition `FAIL`
- cleaner failure path: `script=3 / sub=8 / canary=06 / trace=3516`
- register cursor tile `0x25` still blank

Key references:
- `artifacts/accuracy_ledger.csv`
- `artifacts/score_ledger.csv`
- `diag/reports/gameplay_interaction_probe_zelda_v627.txt`
- `diag/reports/register_state_probe_zelda_v627.txt`

### Latest graphics/data-path candidate

Use `v633` when the question is "what is the newest build with the real title/register graphics fix?"

What `v633` proves:
- `title_ready_frame=84`
- `file_select_ready_frame=232`
- `branch_frame=280`
- `gameplay_entry_frame=706`
- `gameplay_ready_frame=707`
- movement `PASS`
- pause `PASS`
- room transition `FAIL`
- failure path now observed as `canary=06 / trace=0403`
- register cursor tile `0x25` contains real data again

Key references:
- `diag/reports/gameplay_interaction_probe_zelda_v633.txt`
- `diag/reports/register_state_probe_zelda_v633.txt`
- `diag/reports/chr_focus_zelda_v633.csv`
- `diag/reports/ppu_writes_zelda_v633.csv`

---

## Major Builds Scored This Run

These were recorded in both:
- `artifacts/accuracy_ledger.csv`
- `artifacts/score_ledger.csv`

### `v632`

Change:
- corrected the bank_02 title PPU-address table byte order in `src/banks/generated/bank_02_gen68k.asm`

What changed:
- removed the later tile `0x25` re-clobbers
- improved title/file-select/gameplay entry timing

What did **not** change:
- the earliest frame-42 corruption still remained
- pause still failed
- interaction core still failed

Ledger result:
- `accuracy_score=121`
- `status=FAIL`

Why it matters:
- `v632` was a real intermediate step, not the final fix

### `v633`

Change:
- fixed the bank_02 title CHR uploader so ROM-backed 6502 pointers are resolved to the real title CHR blobs instead of being read from `$FF0000` NES RAM shadow

What changed:
- frame-42 tile `0x25` corruption disappeared from `chr_focus`
- register cursor tile `0x25` is populated in both CHR shadow and VRAM
- movement and pause are both back to `PASS`
- gameplay entry still works and is earlier than `v627`

What did **not** change:
- room transition still fails
- the parity-oriented ledger still records `v633` as `FAIL`

Ledger result:
- `accuracy_score=121`
- `status=FAIL`

Why it matters:
- `v633` is the first build in this run that cleanly fixes the title/register tile `0x25` corruption in the emulator path

---

## Root Cause Found This Run

The key bug was in the bank_02 title CHR uploader path:
- `sub_804F_write_to_ppu`

The generated 68k code was treating 6502 `(ram_0000),Y` as if the reconstructed pointer always lived in NES RAM shadow at:
- `$FF0000 + D5`

That assumption was wrong for the title CHR upload path.

In this code path, `ram_0000/0001` was actually pointing into ROM-backed CHR blobs:
- `$807F`
- `$877F`
- `$8E7F`

So the uploader was numerically reconstructing the right 16-bit pointer, but then dereferencing the wrong address space. That is why the trace still showed sensible pointer values in `v632` while tile `0x25` was still getting corrupted.

The `v633` fix added a ROM-pointer resolver in `src/banks/generated/bank_02_gen68k.asm`:
- `sub_808F_resolve_title_chr_ptr_real`

That helper maps the raw 6502 pointer to the actual incbin labels for the title CHR data before bytes are read.

---

## Most Important Probe Facts

### Before the final fix

`v632` still showed the early bad tile `0x25` write:
- `diag/reports/chr_focus_zelda_v632.csv`

It had already removed the later re-clobbers compared with `v631`, but the earliest bad frame-42 corruption remained.

### After the final fix

`v633` no longer shows that bad frame-42 tile `0x25` overwrite:
- `diag/reports/chr_focus_zelda_v633.csv`

The register-state probe for `v633` confirms the visual tile itself is back:
- `chr[025]=10 10 10 10 00 10 10 10 1C 14 1C 1C 08 1C 14 1C`
- `vram_tile[025]` is populated instead of blank

Reference:
- `diag/reports/register_state_probe_zelda_v633.txt`

---

## Scoring And Regression Notes

These rules remain essential:

1. Score every major build outcome in both ledgers.
2. Check the ledgers before and after major experiments.
3. Record regressions explicitly instead of silently skipping them.
4. Update this handoff during long runs and again at the end of the task run.

Important nuance from this run:
- the ledger is measuring **parity**, not "fastest path wins"
- `v633` is faster than `v627` on title/file-select/gameplay entry, but that does not automatically improve `accuracy_score`
- `v633` is still scored as `FAIL` because room transition still fails and because the regression guard compares against the previous scored timing profile

So:
- `v627` remains the best scored interaction baseline
- `v633` is the current best graphics/data-path candidate from this run

---

## Source Of Truth Rules

Permanent edits belong in:
- `src/banks/generated/*`
- `src/bridge/*`
- `src/main.asm`

Do not treat these as durable:
- `src/banks/generated_vdp/*`

Reason:
- the build pipeline regenerates `generated_vdp/*`

---

## Key Files

Core runtime and bridge:
- `src/banks/generated/bank_02_gen68k.asm`
- `src/banks/generated/bank_05_gen68k.asm`
- `src/banks/generated/bank_06_gen68k.asm`
- `src/bridge/vdp_layer.asm`
- `src/main.asm`

Scoring and gates:
- `tools/accuracy_tracker.py`
- `tools/static_score.py`
- `tools/regression_gate.py`
- `tools/record_probe_result.py`

Main wrappers:
- `run_build_and_gate.ps1`
- `run_runtime_gate.ps1`
- `run_record_probe_result.ps1`
- `run_gameplay_interaction_probe.ps1`
- `run_ppu_write_trace.ps1`
- `run_register_state_probe.ps1`

Important diagnostics:
- `diag/scripts/zelda_gameplay_interaction_probe.lua`
- `diag/scripts/zelda_ppu_write_trace.lua`
- `diag/scripts/zelda_register_state_probe.lua`
- `diag/reports/`

---

## Recommended Next Step

Do **not** go back to generic gameplay polishing yet.

The best next move is:
- test `v633` on console because it is the first build in this run with the real title/register tile `0x25` fix
- if console visuals are cleaner too, continue transition debugging from the `v633` `canary=06 / trace=0403` path
- if console still diverges from emulator, compare title/file-select/register screenshots against the `v633` emulator captures before changing more gameplay code

The main remaining blocker after this run is still:
- room transition completion

---

## Practical Commands

Full build:
```powershell
cmd //c "build\\build.bat"
```

Interaction probe:
```powershell
./run_gameplay_interaction_probe.ps1 -Rom 'zelda_v633'
```

PPU trace:
```powershell
./run_ppu_write_trace.ps1 -Rom 'zelda_v633'
```

Register-state probe:
```powershell
./run_register_state_probe.ps1 -Rom 'zelda_v633'
```

Record a major build result:
```powershell
./run_record_probe_result.ps1 -Rom 'zelda_vXXX'
```

---

## Notes For Future Work

- BizHawk is still useful, but console remains the final truth.
- `v633` is worth hardware testing because it fixed a real ROM-pointer bug, not just a trace symptom.
- The ledgers and this handoff have both been updated at the end of this task run.

---

**Prepared by:** Codex
**Date:** 2026-03-26
