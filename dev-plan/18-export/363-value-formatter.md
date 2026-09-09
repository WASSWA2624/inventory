# 363 — Export value formatter

**Phase** 18 · Export  |  **Depends on** [154](../09-templates/154-field-type-registry.md), [284](../13-processing/284-normalise-dates.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One formatter that renders any field type for any output format.

## Files

- `frontend/lib/core/export/value_formatter.dart` (new)

## Steps

1. Handle dates, numbers with units, choices with codes, booleans, multi-values and nulls consistently.
2. Never coerce identifiers to numbers; preserve leading zeros.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/08-localization.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] XLSX, CSV, JSON and PDF show the same value in the same way.
- [ ] Tests written and passing: Table-driven tests per type and format.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
