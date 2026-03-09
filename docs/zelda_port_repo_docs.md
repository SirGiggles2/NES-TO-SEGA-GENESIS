# README.md

## Zelda NES → Sega Genesis / Mega Drive Port

This project ports **The Legend of Zelda (NES)** to **Sega Genesis / Mega Drive** by preserving as much original engine behavior as possible while translating platform-specific systems.

### Project goals

- translate **6502 assembly** into **Motorola 68000 assembly**
- translate **NES PPU behavior** into **Genesis VDP behavior**
- keep original Zelda engine logic as intact as possible
- build a repeatable workflow for debugging translation, rendering, and startup behavior

### High-level architecture

The project has three major layers:

1. **Translated engine**  
   Auto-translated and hand-fixed 68k versions of Zelda code, organized into generated bank files.

2. **Bridge / hardware compatibility layer**  
   `vdp_layer.asm` and related helpers that emulate the NES-facing PPU interface on top of the Genesis VDP.

3. **Verification harness**  
   Build scripts, diagnostic Lua, RAM-map generation, per-build artifact capture, and regression comparison.

### Important files

- `src/bridge/vdp_layer.asm`
- `src/main.asm`
- `src/banks/bank_00_gen68k_vdp.asm`
- `src/banks/bank_05_gen68k_vdp.asm`
- `src/banks/bank_FF_gen68k_vdp.asm`
- `tools/translator.py`
- `tools/patch_vdp.py`
- `tools/fix_syntax.py`
- `tools/make_ram_map.py`
- `diag/zelda_diag.lua`
- `build/build.bat`

### Build flow

1. regenerate VDP-patched bank files
2. fix syntax artifacts from translation
3. assemble with vasm
4. run the ROM in BizHawk
5. run `diag/zelda_diag.lua`
6. compare the generated `diag_report.txt` to the current stable baseline

### Current engineering philosophy

The project should not rely on endless speculative edits to `vdp_layer.asm`.

Instead:

- keep one known-good stable baseline
- change one behavior at a time
- classify every build result
- separate **hardware bridge bugs** from **translated engine bugs**
- treat the diagnostic report as a **triage tool**, not the only source of truth

### Repository workflow

Use two main working tracks:

- **stable/latest-good**  
  The last known-good checkpoint. Small safe edits only.

- **exp/* branches**  
  One experiment per branch. Never replace stable unless the result is clearly better.

### Success criteria

Short-term milestones:

- stable VBlank / interrupt behavior
- correct PPU register bridging
- entry into the real Zelda frame engine
- entry into title-screen script handler
- visible title-screen rendering

Long-term milestone:

- stable title screen
- stable transition into gameplay
- accurate enough engine behavior to continue porting beyond boot

---

# docs/architecture.md

## Architecture overview

This port works only if three systems agree:

1. **Translated game engine**
2. **PPU → VDP bridge**
3. **Verification and regression tooling**

If one system fakes progress in a way that hides bugs in another, the project becomes noisy and unstable.

### 1. Translated game engine

The original Zelda NES engine is translated from 6502 to 68000 assembly.

This layer should preserve:

- original control flow
- script dispatch behavior
- game state transitions
- timing-sensitive engine logic where practical

This layer should *not* be silently replaced by bridge-side hacks unless those hacks are explicitly temporary and documented.

### 2. Bridge / hardware compatibility layer

The bridge layer exists to make translated engine code believe it is talking to an NES-like PPU interface.

Primary responsibilities:

- map `$2000` / `$2001` / `$2002` / `$2003` / `$2005` / `$2006` / `$2007`
- maintain mirrors and latches expected by the engine
- translate VRAM / CRAM writes to Genesis VDP operations
- expose frame/vblank behavior in a way compatible with engine expectations

The bridge should focus on **hardware semantics**, not game semantics.

Bad examples of bridge behavior:

- forcing script progression
- faking engine state unrelated to hardware
- introducing startup-only hacks without documentation

Acceptable temporary bridge behavior:

- startup-only instrumentation
- safe temporary compatibility nudges that are documented and isolated
- explicit workarounds with a removal plan

### 3. Verification harness

The verification layer exists to answer:

- what code actually ran?
- what values changed?
- did this build improve, stay flat, or regress?

This includes:

- `zelda_diag.lua`
- `diag_report.txt`
- screenshot strips
- build classification scripts
- ROM / build hashes

### Execution path focus

The current debugging strategy should follow exact control flow:

1. reset / startup path
2. first VBlank entry
3. main-loop wait condition
4. translated NMI / frame routine
5. script dispatch
6. title-screen handler

For each checkpoint, answer:

- what value is read?
- what value should it be?
- who writes it?
- did that writer execute?
- is the value genuine or forced?

### Source of truth

The final source of truth is not the color of the diag score.

The final source of truth is:

- executed PC path
- exact RAM writes
- exact routines entered
- stack / return integrity
- whether the translated engine progresses without artificial help

---

# docs/porting-rules.md

## Porting rules

These rules exist to prevent regressions, confusion, and false progress.

### 1. Keep a stable baseline

At all times, preserve one exact known-good checkpoint containing:

- ROM filename and hash
- `vdp_layer.asm`
- `diag_report.txt`
- screenshots
- short notes on observed behavior

Never experiment directly on top of an unverified or regressed state.

### 2. One behavior change per experiment

An experiment branch should change one thing only.

Examples:

- one scroll-latch fix
- one `PPU_READ_2002` behavior change
- one NMI integration change

Do not combine unrelated changes in one step.

### 3. Full-file edits only for `vdp_layer.asm`

When replacing `vdp_layer.asm`, always provide the full file.

Never use:

- partial snippets as if they were full replacements
- trimmed-down versions that silently remove working code
- “example” files in place of production files

### 4. Treat `vdp_layer.asm` as hardware code

`vdp_layer.asm` should primarily emulate:

- register behavior
- latches
- mirrors
- VBlank-visible behavior
- VRAM / CRAM / scroll semantics

It should not become a substitute for the real Zelda engine unless a temporary hack is:

- clearly documented
- intentionally isolated
- easy to remove

### 5. Mark every temporary workaround

Any temporary workaround must include:

- why it exists
- what behavior it is faking
- what real engine/bridge behavior should replace it later

### 6. Regressions must be labeled immediately

If a build gets worse:

- label it `regression`
- save the diag and screenshots
- do not continue forward from it
- revert to the last stable checkpoint

### 7. Diagnostics are triage, not proof

A greener diag does not automatically mean a better port.

A build is only truly better if it improves one of these:

- later real execution path
- more genuine engine activity
- fewer forced bridge-side states
- cleaner stack/return integrity
- visible draw behavior from real script execution

### 8. Prefer proof over nudging

Before forcing a variable, ask:

- who is supposed to write it?
- why didn’t they?
- did that routine run?
- is the problem a bridge bug or a translation bug?

### 9. Stable and experimental branches must stay separate

Use:

- `stable/latest-good`
- `exp/vdp-*`
- `exp/nmi-*`
- `exp/translator-*`

Never merge an experiment into stable unless it clearly improves the verified baseline.

### 10. Preserve build history

Every build worth keeping should have:

- build ID
- branch name
- ROM filename
- ROM hash
- diag classification
- notes on what changed

---

# docs/debugging-workflow.md

## Debugging workflow

### Goal

Turn each build into a reproducible engineering result instead of a vague memory.

### Per-build loop

1. start from `stable/latest-good`
2. create one experiment branch
3. make one change
4. build ROM
5. run BizHawk + `diag/zelda_diag.lua`
6. save artifacts
7. classify result
8. compare to baseline
9. either merge or discard

### Required artifacts per build

- build log
- ROM filename
- ROM hash
- `diag_report.txt`
- screenshot strip
- classification summary

### Standard result labels

- `early_crash`
- `vblank_dead`
- `late_guard_loop`
- `script_entered`
- `visible_draw_started`
- `regression`
- `same_as_baseline`
- `better_than_baseline`

### What to compare every time

- PASS / FAIL / WARN
- stuck PC
- exception handler hit or not
- NMI completion count
- `ram_script`
- `ram_subscript`
- `ram_ppu_load_index`
- `ram_005C`
- `ram_for_2000`
- `ram_for_2001`
- VRAM nonzero count
- CRAM nonzero count

### What to do when stuck in a loop

For a late loop:

1. identify exact PC
2. identify exact condition being tested
3. identify RAM variables read there
4. identify routine expected to write them
5. prove whether that routine executed

Do not jump immediately to another bridge-side hack.

### When to edit the bridge layer

Edit `vdp_layer.asm` only when the missing behavior is clearly one of:

- wrong latch semantics
- wrong status behavior
- wrong scroll behavior
- wrong VRAM/CRAM addressing
- wrong mirror maintenance
- wrong frame/vblank-visible hardware behavior

### When to edit translated engine code

Edit translated engine or translator output when the missing behavior is clearly:

- bad control-flow translation
- bad branch target
- stack/register corruption
- missing call
- impossible translated sequence

---

# docs/current-blockers.md

## Current blockers

### Stable baseline definition

The current stable checkpoint is the last known build that achieved a strong late-loop state without early crash.

This baseline should be recorded with:

- ROM filename
- ROM hash
- `vdp_layer.asm`
- `diag_report.txt`
- screenshot set

### Current known problem shape

The project has demonstrated:

- working VDP init
- working display enable
- working interrupt bring-up
- VRAM/CRAM activity
- PPU bridge activity

But the remaining blocker is not fully isolated because some recent experiments introduced artificial bridge-side state.

### Current engineering question

The next milestone is to prove whether the translated frame/NMI/script path runs safely and genuinely.

### Top-priority next tasks

1. restore and lock the best stable baseline
2. document the exact execution path from reset to late loop
3. prove which routine is supposed to release the late loop
4. determine whether the missing behavior is bridge-side or engine-side
5. remove temporary bridge-side hacks one by one once their real replacement is understood

### What not to do next

- do not continue from regressed builds
- do not keep stacking speculative VBlank hacks
- do not treat diag score alone as proof of real progress
- do not replace `vdp_layer.asm` with trimmed or partial files

---

# docs/known-good-builds.md

## Known-good build template

### Build ID

`vXXX-branch-name`

### ROM

- filename:
- hash:

### Source state

- branch:
- commit:

### Result summary

- PASS:
- FAIL:
- WARN:
- stuck PC:
- exception handler:
- NMI completions:
- VRAM nonzero words:
- CRAM nonzero colors:

### Notes

- what changed in this build
- why it was better than previous builds
- what still blocked forward progress

### Attached artifacts

- `diag_report.txt`
- screenshots
- build log
- copied `vdp_layer.asm`

---

# docs/memory-map.md

## Working memory notes

This project uses Genesis RAM at `$FF0000+` to mirror NES engine expectations.

Important engine-visible locations include:

- `ram_dungeon_level / game mode` → `$FF0010`
- `ram_0011_screen_ready_flag` → `$FF0011`
- `ram_script` → `$FF0012`
- `ram_subscript` → `$FF0013`
- `ram_ppu_load_index` → `$FF0014`
- `ram_frm_cnt` → `$FF0015`
- `ram_for_2001` → `$FF00FE`
- `ram_for_2000` → `$FF00FF`
- `ram_scroll_Y` → `$FF00FC`
- `ram_scroll_X` → `$FF00FD`
- `ram_005C` → `$FF005C`
- `ram_0301_buffer_index` → `$FF0301`
- `ram_0302_ppu_buffer` → `$FF0302`

Bridge shadow registers include:

- `PPUCTRL_SHADOW` → `$FFFFEF00`
- `PPUMASK_SHADOW` → `$FFFFEF01`
- `PPUSCROLL_X` → `$FFFFEF05`
- `PPUSCROLL_Y` → `$FFFFEF06`
- `VRAM_ADDR_CURR` → `$FFFFEF08`
- `VDP_REG1_SHADOW` → `$FFFFEF0A`

This document should remain short and point to the generated RAM map for full symbol coverage.

