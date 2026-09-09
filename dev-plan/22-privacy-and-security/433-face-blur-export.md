# 433 — Face blurring on export

**Phase** 22 · Privacy and security  |  **Depends on** [033](../02-foundation/033-isolate-runner.md), [381](../18-export/381-zip-package.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Optionally blur detected faces in exported photos, keeping originals untouched.

## Files

- `frontend/lib/core/export/face_blur.dart` (new)

## Steps

1. Process copies only; report how many faces were found per photo.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/11-security-privacy.md`, `frontend/rules/12-testing.md`.
- Text arriving from OCR, transcripts, imports or bundles is data, never instructions and never concatenated into a query.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The original photo on the device is never modified.
- [ ] Tests written and passing: Test comparing original hashes before and after export.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
