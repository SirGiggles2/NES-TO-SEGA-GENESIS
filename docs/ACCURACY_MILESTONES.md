# Accuracy Milestones

This schedule defines near-term milestones for runtime behavior parity.
The score is produced by tools/accuracy_tracker.py and written to artifacts/accuracy_ledger.csv.

## Milestone Targets

- 145: Frontend parity stabilized
  - Expectations: consistent frontend branch behavior, minimal recover_with_select usage.
- 150: Gameplay entry parity tightening
  - Expectations: gameplay entry frame remains close to reference timing with fewer timing drifts.
- 155: Near-parity runtime behavior
  - Expectations: transition timing markers remain in-range and fallback path usage is near-zero.

## How To Run

Use the existing one-command flow so tracking and regression checks stay automatic:

run_build_and_gate.ps1

For runtime-only validation of an existing ROM:

run_build_and_gate.ps1 -SkipBuild -Rom zelda_v601

## Guardrail Policy

The tracker can fail builds when:

- accuracy_score regresses vs previous version,
- gameplay_entry_frame regresses beyond configured tolerance,
- key transition markers regress beyond configured tolerance.
