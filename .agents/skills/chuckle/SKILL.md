---
name: chuckle
description: Run the NES-to-Genesis repo's 4-step root-cause debugging workflow. Use when the user says `/chuckle`, `$chuckle`, "chuckle it", or asks for a disciplined root-cause pass that must identify the real problem, research current evidence, apply a structural fix, and verify the result with builds, probes, or reports.
---

# Chuckle

## Overview

Execute the repo's 4-step root-cause workflow for hard debugging problems.
Treat this as a disciplined investigation-and-verification protocol, not as a request for loose brainstorming.

## Start Here

Open `AI_HANDOFF.md` first.

Use it to establish:
- the current best fully gated baseline
- the current live candidate
- the current do-not-regress rules
- the latest relevant reports, probes, and next-step guidance

If `.agents/workflows/chuckle.md` exists, read it too and keep its wording aligned with the skill behavior.

## Workflow

### 1. Identify Real Problem

- State the precise failure, not just the visible symptom.
- Separate current evidence from stale theories, misleading artifacts, or old experiments.
- Prefer the user's latest console or hardware observation over emulator intuition when they conflict, then explain the mismatch.

### 2. Research What Exists

- Inspect the current code path, latest reports, traces, ledgers, screenshots, and probe outputs relevant to the failure.
- Compare against the baseline named in `AI_HANDOFF.md` or the last known-good candidate for the affected subsystem.
- Prefer hard artifacts over recollection: exact trace IDs, register values, CRAM or VRAM dumps, report files, build names, and screenshots.
- If a needed artifact does not exist yet, generate it before speculating.

### 3. Build Structural Fix

- Change the narrowest code path that explains the failure.
- Preserve proven foundations and explicit do-not-regress rules from `AI_HANDOFF.md` unless new evidence disproves them.
- Avoid speculative rewrites and do not revert unrelated user changes.
- When several theories are possible, pick the one best supported by the artifacts and say why.

### 4. Make System Verify Itself

- Build the next numbered artifact when the repo uses numbered builds.
- Run the relevant probes, gates, or diagnostic scripts for the path you changed.
- Compare the new output against the baseline and call out whether the result is a win, a regress, or a no-op.
- Update `AI_HANDOFF.md` when the session materially changes the active baseline, current candidate, root-cause conclusion, or next-step guidance.

## Output Contract

- Present the result in four explicit sections: `Real Problem`, `Research`, `Structural Fix`, and `Verification`.
- Include exact build names, report names, and file paths when available.
- Be decisive: say whether the current theory was confirmed, disproved, or remains unproven.
- If blocked, name the missing artifact or command instead of guessing.

## Repo Rules

- Treat hardware as the final oracle when the handoff says hardware and emulator disagree.
- Use the handoff as the continuation point so future sessions do not need to re-discover the same baseline.
- Keep the workflow factual. `/chuckle` is for root-cause work and proof, not for vibes.
