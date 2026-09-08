# 328 — Prefill from the register

**Phase** 15 · Validation, duplicates and verification  |  **Depends on** [327](327-verification-mode.md), [197](../10-reference-data/197-lookup-prefill-apply.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Fill the whole record from the reference row and mark it as on-record.

## Files

- `lib/features/quality/domain/verification_prefill.dart` (new)

## Steps

1. Keep the register values separately so differences can be computed later.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Not-found identifiers create a record flagged not-in-register.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
