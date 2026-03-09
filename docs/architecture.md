# Architecture Overview

The Zelda port only works when three systems agree:

1. Translated Zelda engine
2. VDP compatibility bridge
3. Verification tooling

If one layer fakes progress, debugging becomes misleading.

---

# 1. Translated Engine

The original Zelda code is translated from 6502 to 68000 assembly.

Goals:

- preserve control flow
- preserve script system
- preserve engine state machine

This layer should **not be rewritten unless necessary**.

---

# 2. Bridge Layer

File:


src/bridge/vdp_layer.asm


Responsibilities:

| NES Register | Genesis Mapping |
|--------------|----------------|
| $2000 | VDP control |
| $2001 | display enable |
| $2002 | status |
| $2003 | OAM addr |
| $2005 | scroll |
| $2006 | VRAM addr |
| $2007 | VRAM data |

The bridge should emulate **hardware semantics only**.

It should not emulate game logic.

---

# 3. Verification Harness

Tools:


diag/zelda_diag.lua
tools/compare_diag.py
tools/make_ram_map.py


Purpose:

- determine what code executed
- track engine progress
- detect regressions

---

# Debug Philosophy

Diagnostics are not the source of truth.

The source of truth is:

- executed PC path
- actual RAM writes
- routines entered
- stack integrity