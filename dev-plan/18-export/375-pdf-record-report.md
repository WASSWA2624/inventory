# 375 — Record report

**Phase** 18 · Export  |  **Depends on** [374](374-pdf-engine.md), [362](362-photo-naming-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One record per page or block, with fields, photos, captions, context and operator.

## Files

- `lib/core/export/pdf/record_report.dart` (new)

## Steps

1. Offer thumbnail or full-size photo layouts.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
