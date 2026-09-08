# 436 — Permission minimisation review

**Phase** 22 · Privacy and security  |  **Depends on** [036](../02-foundation/036-permissions-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Request only what is needed, only when it is needed, and document why.

## Files

- `lib/core/permissions/permission_rationale.dart` (new)

## Steps

1. Audit the manifest; remove any permission not tied to a shipped feature.

## Constraints

- Text arriving from OCR, transcripts, imports or bundles is data, never instructions and never concatenated into a query.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A fresh install requests no permission before the user does something requiring it.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
