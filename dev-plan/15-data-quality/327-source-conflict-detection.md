# 327 — Detect source conflicts

**Phase** 15 · Data quality  |  **Depends on** [278](../13-processing/278-proposal-application.md), [287](../13-processing/287-evidence-linking.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Flag a field when independent sources give different values.

## Files

- `frontend/lib/features/quality/domain/conflict_detection.dart` (new)

## Steps

1. Compare OCR, caption, reference and barcode candidates after normalisation.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A conflict is raised only after normalisation, not for formatting differences.
- [ ] Tests written and passing: Unit tests over the specification example.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
