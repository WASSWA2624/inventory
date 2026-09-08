# 348 — Read the attendance sheet

**Phase** 17 · Meeting mode  |  **Depends on** [347](347-attendance-photo.md), [264](../13-processing/264-ocr-on-device.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Turn the photographed sheet into editable attendee rows.

## Files

- `frontend/lib/features/meetings/domain/attendance_ocr.dart` (new)

## Steps

1. Detect columns for name, title, organisation and signature presence; produce rows with confidence.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every extracted row is editable and none is added silently.
- [ ] Tests written and passing: Test against a fixture attendance sheet.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
