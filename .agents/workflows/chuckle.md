---
description: The 4-step protocol for diagnosing and verifying root-cause fixes
---

The `/chuckle` command executes a rigorous 4-step protocol established in the AI Handoff documentation for diagnosing, fixing, and verifying root-cause problems.

When requested to run `/chuckle`, execute the following 4 steps and document the outcome of each phase carefully:

### 1. Identify real problem
- Pinpoint the exact nature of the problem, diagnosing the core failure instead of relying on generic symptoms (e.g., "dark screen" vs "specific VDP register write missing").
- Separate the real cause from misleading artifacts, old assumptions, or earlier failed experiments.

### 2. Research what exists
- Gather concrete evidence from the latest probes, traces, and diagnostic scripts.
- Compare current behavior against the reference reports generated from the designated safe baseline build (e.g., `zelda_v677` or the latest fully gated baseline).

### 3. Build structural fix
- Implement a targeted fix addressing the researched root cause.
- Ensure that proven structural foundations (like known correct hardware timing, verified composition rules, or basic control flow) are preserved and not arbitrarily overwritten unless new evidence dictates otherwise.

### 4. Make system verify itself
- Build a new numbered ROM from the current branch.
- Generate new title/frontend/gameplay probes (as applicable) from that new child build.
- Compare these new results against the established reference set to mathematically/visually verify the fix and prove no regressions were introduced.
- Document the full 4-step outcome (Problem, Research, Fix, and Verification) clearly, so future sessions can resume work without re-discovering the baseline.
