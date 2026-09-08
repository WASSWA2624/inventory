# 318 — Duplicate detection service

**Phase** 15 · Validation, duplicates and verification  |  **Depends on** [317](317-identity-hash.md), [266](../13-processing/266-perceptual-hash.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Detect duplicates on save, on table import and after merge, using the specification's signals.

## Files

- `lib/features/quality/domain/duplicate_detection.dart` (new)

## Steps

1. Signals: identity hash, identical photo hash, near-identical photo, same predefined row in the same context, same name plus context plus close time.
2. Score and rank candidates; never act automatically.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Detection runs in the background and never delays a save.
- [ ] Tests written and passing: Unit tests per signal.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
