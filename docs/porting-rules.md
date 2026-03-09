# Porting Rules

These rules prevent regressions and false progress.

---

# 1. Keep a Stable Baseline

Always maintain a known-good checkpoint containing:

- ROM
- diag report
- vdp_layer.asm
- notes

Never experiment on top of a regressed build.

---

# 2. One Change Per Experiment

Each experiment branch should modify **one behavior only**.

Examples:

- scroll latch fix
- status register fix
- NMI integration fix

---

# 3. Always Provide Full vdp_layer.asm

Never replace the file with:

- snippets
- shortened versions
- partial patches

Always provide the **entire file**.

---

# 4. Treat Bridge Code as Hardware

`vdp_layer.asm` should emulate:

- registers
- mirrors
- latches
- VBlank behavior

It should not emulate game logic.

---

# 5. Label Temporary Hacks

Temporary hacks must document:

- why they exist
- what behavior they fake
- what real fix should replace them

---

# 6. Regressions Must Be Marked

If a build becomes worse:

- mark it `regression`
- revert immediately

---

# 7. Prefer Proof Over Nudging

Before forcing a value ask:

- who writes this variable?
- why didn't they?
- did that routine run?