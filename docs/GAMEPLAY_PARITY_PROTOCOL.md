# Gameplay Parity Protocol (Gate 1)

This protocol defines the fastest honest step after post-title parity.

## Objective

Prove truthful progression from file select into the first stable gameplay lane.

For this repo, Gate 1 means `script >= 5` with a stable post-entry window.

## Why Gate 1 exists

A title or file-select pass does not prove gameplay works.

Gate 1 prevents losing time on visual cleanup while core gameplay entry is still broken.

## Required reports

Primary (at least one):

- `diag/reports/gameplay_probe_<rom>.txt`
- `diag/reports/gameplay_state_<rom>.txt`

Optional but recommended:

- `diag/reports/attr_gameplay_<rom>.txt`

## Run probes

From repo root:

```powershell
powershell -ExecutionPolicy Bypass -File .\run_gameplay_probe.ps1 -Rom zelda_v526
powershell -ExecutionPolicy Bypass -File .\run_gameplay_state.ps1 -Rom zelda_v526
powershell -ExecutionPolicy Bypass -File .\run_attr_gameplay.ps1 -Rom zelda_v526
```

## Run gate

```powershell
powershell -ExecutionPolicy Bypass -File .\run_gameplay_parity_gate.ps1 -Rom zelda_v526
```

## Output

- `diag/reports/gameplay_parity_<rom>.txt`

Status meanings:

- `PASS`: gameplay entry proven and triangulated.
- `PASS_WITHOUT_FULL_TRIANGULATION`: gameplay entry proven but one or more supporting reports missing.
- `FAIL`: gameplay lane not reached or not stable.

## Pass intent

Gate 1 is not full gameplay perfection.

It only proves the port can leave frontend flow and hold in gameplay lane long enough to debug gameplay systems safely.

## Next gate after pass

After Gate 1 is green, build Gate 2 for interaction parity:

- deterministic movement check,
- deterministic action check,
- room transition check.

Protocol:

- `docs/GAMEPLAY_INTERACTION_PROTOCOL.md`
