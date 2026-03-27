# Gameplay Interaction Protocol (Gate 2)

This protocol defines the first honest post-Gate-1 interaction check.

## Objective

Prove that the gameplay lane is not only reachable, but interactive in a deterministic way.

Gate 2 is split into three checks, all driven from the truthful frontend lane:

- movement check
- pause/resume input check
- room transition check

## Why Gate 2 exists

Gate 1 proves that `script >= 5` is reachable and stable enough to debug.

Gate 2 proves that we can safely move beyond "gameplay exists" into "gameplay responds to player input" without relying on screenshots alone.

## Required report

- `diag/reports/gameplay_interaction_probe_<rom>.txt`

## Run probe

From repo root:

```powershell
powershell -ExecutionPolicy Bypass -File .\run_gameplay_interaction_probe.ps1 -Rom zelda_v601
```

## Run gate

```powershell
powershell -ExecutionPolicy Bypass -File .\run_gameplay_interaction_gate.ps1 -Rom zelda_v601
```

## Output

- `diag/reports/gameplay_interaction_gate_<rom>.txt`

Status meanings:

- `PASS`: movement, pause/resume, and a stable room transition were all proven.
- `PASS_WITHOUT_ROOM_TRANSITION`: core interaction works, but truthful transition parity is not yet proven.
- `FAIL`: movement or pause/resume input failed, or the probe never reached a usable gameplay-ready lane.

## Current Gate 2 shape

The interaction probe deliberately avoids visual scoring for now.

It reaches gameplay through the same title -> file select -> register flow already used by Gate 1, then checks:

1. sustained rightward movement changes Link state,
2. the gameplay pause input toggles pause on and back off,
3. a deterministic ordered transition attempt (`RIGHT`, `DOWN`, `LEFT`, `UP`) can produce a truthful room transition and stable gameplay on a new map.

## If the room transition part is not green yet

Keep the interaction probe as the truthful driver.

Then instrument the same transition lane more deeply by adding room-buffer and room-write tracing around the detected transition window, instead of switching to a passive probe that no longer reproduces the edge-walk path.

## Rule of thumb

Do not treat `PASS_WITHOUT_ROOM_TRANSITION` as full gameplay parity.

It means input responsiveness is real enough to move forward on gameplay-side debugging, but map-transition behavior still needs its own truthful proof.
