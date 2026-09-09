# 331 — Compute variance

**Phase** 15 · Data quality  |  **Depends on** [330](330-verification-prefill.md), [106](../04-data-layer/106-variances-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Compare as-recorded with as-found, field by field, on approval.

## Files

- `frontend/lib/features/quality/domain/variance_computation.dart` (new)

## Steps

1. Classify each field as MATCH, CHANGED or MISSING; recompute when values change.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The variance table matches the specification example.
- [ ] Tests written and passing: Unit tests over changed, matching and empty values.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
