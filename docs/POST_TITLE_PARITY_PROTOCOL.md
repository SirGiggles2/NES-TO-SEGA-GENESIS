# Post-Title Parity Protocol

This protocol turns the current title-to-file-select work into a hard milestone.

## Objective

Prove that a truthful Genesis build can:

1. reach stable title-ready state,
2. accept a deliberate Start pulse,
3. leave title without forced script hacks,
4. settle into canonical file-select state.

This is the first non-visual gate after title perfection.

## Why this gate matters

Title screenshots alone can hide a dead game.

A build only counts as post-title healthy when the engine really transitions:

- `script 0 -> script 1`
- `ready 1 / sub 0 / ppu 0`
- canonical cursor and active-slot table

If a build cannot do that, it is not ready for gameplay parity work.

## Canonical pass conditions

The gate passes when all of these are true:

1. title ready is observed,
2. Start pulse is attempted,
3. title exit is logged,
4. file-select entry is logged,
5. final state is `ready=1 script=1 sub=0 ppu=0`,
6. `stable_count >= 90`,
7. final `slot=3`,
8. final `active=[00,00,00,01,01]`.

The canonical file-select state comes from the validated frontend notes in the handoff history, especially the `v410` and `v436` passes.

## Truthful vs harness interpretation

This gate scores report content only. It does not guess whether a ROM is a truthful build or a harness build.

Use it like this:

- truthful build: gate result is meaningful as a real milestone,
- harness build: gate result is still useful, but only as a frontend capture aid.

Do not claim a truthful post-title pass from a harness-only ROM.

## Required reports

Primary:

- `diag/reports/file_select_probe_<rom>.txt`
  or
- `diag/reports/file_select_state_probe_<rom>.txt`

Optional but useful:

- `diag/reports/start_injection_<rom>.txt`
- `diag/reports/oracle_ram_start_<rom>.txt`

## Command

From repo root:

```powershell
py -3 .\tools\post_title_parity_gate.py --rom zelda_v437
```

Optional explicit paths:

```powershell
py -3 .\tools\post_title_parity_gate.py `
  --rom zelda_v437 `
  --state-report .\diag\reports\file_select_state_probe_zelda_v437.txt `
  --start-report .\diag\reports\start_injection_zelda_v437.txt
```

## Output

The gate writes:

- `diag/reports/post_title_parity_<rom>.txt`

Status meanings:

- `PASS`: canonical file-select state proven.
- `PASS_WITHOUT_GAMEPLAY_PROOF`: post-title state proven, but no gameplay-path report was present.
- `FAIL`: title never left, file select never stabilized, or final canonical state is wrong.

## Recommended workflow

1. run the live probe on a truthful ROM,
2. run the gate,
3. only if the gate passes, proceed to gameplay parity work,
4. if the gate fails, debug title-to-file-select control flow before touching gameplay.

## Practical rule

Do not spend time on menu polish, palette cleanup, or gameplay scaffolding while this gate still fails on the truthful baseline.