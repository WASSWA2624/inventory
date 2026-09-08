# 304 — Record detail screen

**Phase** 14 · Records  |  **Depends on** [298](298-record-model.md), [052](../03-design-system/052-app-page.md), [077](../03-design-system/077-app-photo-thumb.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Read-only view of everything about a record, with edit entry points.

## Files

- `lib/features/records/presentation/record_detail_screen.dart` (new)

## Steps

1. Show fields, photos, context, provenance summary, status and timestamps.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every value shows its source without extra taps.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
