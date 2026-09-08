# 313 — Validation engine

**Phase** 15 · Validation, duplicates and verification  |  **Depends on** [154](../09-templates/154-field-type-registry.md), [026](../02-foundation/026-result-and-failures.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One engine that validates a value, a record and an export set, used everywhere.

## Files

- `frontend/lib/core/validation/validation_engine.dart` (new)

## Steps

1. Return structured results with field key, severity and a plain-language message.
2. Separate errors, which block, from warnings, which do not.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/07-consistency.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Capture, review, import and export all call this one engine.
- [ ] Tests written and passing: Unit tests per rule type.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
