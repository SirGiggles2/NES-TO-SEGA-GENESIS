# GitHub Copilot Instructions — NES-TO-SEGA-GENESIS

## /chuckle — Structured Problem-Solving Protocol

When the user types `/chuckle`, execute the following 4-step framework **in order** before touching any code or tool:

---

### Step 1 — Identify the Real Problem
Do not address symptoms or workaround targets. Trace back to the structural root cause.
- Ask: "What invariant is being violated, and where does it originate?"
- Distinguish between: a symptom (what the output looks like wrong), a trigger (what caused it to appear), and the root cause (the structural gap in the system).
- State the real problem explicitly before moving on.

### Step 2 — Research What Exists
Categorize every relevant piece of existing code/tooling as one of:
- **Workaround** — patches the output without fixing the source
- **Tool switch** — replaces one symptom-fixer with another
- **Actual solution** — attacks the structural root cause directly

Use `grep_search`, `read_file`, and `semantic_search` to inventory what's already there. Do not guess.

### Step 3 — Build the Structural Fix
Attack the process, not the output.
- The fix should make the bad state impossible or self-correcting, not just catch it after the fact.
- Prefer changes to generators, validators, and build pipeline scripts over one-off patches in generated files.
- If editing a generated file is unavoidable, also fix the generator so the problem cannot regress.

### Step 4 — Make the System Verify Itself
Verification is infrastructure, not a prompt.
- After the fix, add or update a check in the build pipeline (e.g., `static_score.py`, `check_register_safety.py`, `run_build_and_gate.ps1`, a new tool) so the system will catch this class of problem automatically on every future build.
- The check should fail the build or reduce the score if the problem recurs — not just print a warning.

---

After completing all 4 steps, summarize what was done under each step heading so the session record is clear.
