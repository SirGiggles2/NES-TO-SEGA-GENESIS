# Zelda NES → Sega Genesis / Mega Drive Port

This project ports **The Legend of Zelda (NES)** to **Sega Genesis / Mega Drive** by preserving as much of the original game engine as possible.

Instead of rewriting the game, this project:

- translates **6502 assembly → Motorola 68000 assembly**
- emulates **NES PPU behavior → Genesis VDP behavior**
- keeps original Zelda engine logic intact wherever possible

---

# Project Status

The project currently achieves:

- successful ROM build
- Genesis VDP initialization
- working interrupts
- rendering enable
- VRAM and CRAM writes
- partial execution of the Zelda frame engine

The remaining milestone is reaching the **title screen script execution path**.

---

# Architecture

The port is divided into three layers.

### 1. Translated Zelda Engine

Original NES code translated from 6502 into 68000 assembly.

Examples:


src/banks/bank_00_gen68k_vdp.asm
src/banks/bank_05_gen68k_vdp.asm
src/banks/bank_FF_gen68k_vdp.asm


This layer should stay as close to the original engine as possible.

---

### 2. PPU → VDP Bridge

The bridge layer makes the translated engine believe it is interacting with NES PPU registers.

Primary file:


src/bridge/vdp_layer.asm


Responsibilities:

- emulate `$2000-$2007`
- maintain PPU register mirrors
- translate VRAM/CRAM writes
- implement scroll latch behavior
- translate PPU buffer writes

---

### 3. Verification Harness

Debug and verification tools.

Examples:


diag/zelda_diag.lua
tools/make_ram_map.py
tools/translator.py
tools/patch_vdp.py


These tools generate:

- diagnostic reports
- RAM maps
- regression comparisons

---

# Build Instructions

Run:


build/build.bat


The build process:

1. regenerate patched banks
2. fix syntax artifacts
3. assemble with `vasm`
4. produce `.md` Genesis ROM

---

# Runtime Debugging

Run ROM in **BizHawk**.

Then run:


diag/zelda_diag.lua


This produces:


diag_report.txt


Which records:

- pass/fail checks
- CPU program counter
- engine state
- VRAM / CRAM activity

---

# Current Engineering Goal

Next milestone:


Reach title screen script execution


Execution path target:


RESET
→ VBlank handler
→ vec_0x01E494_NMI
→ script dispatcher
→ title screen routine


---

# Contribution Rules

1. Never trim `vdp_layer.asm`
2. Always provide full file replacements
3. One behavior change per experiment
4. Preserve known-good builds
5. Treat diagnostics as triage, not proof