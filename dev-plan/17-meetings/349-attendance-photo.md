# 349 — Attendance sheet photo

**Phase** 17 · Meetings  |  **Depends on** [221](../12-capture/221-camera-shutter.md), [234](../12-capture/234-photo-type-assign.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Capture the signed attendance sheet as evidence, typed ATTENDANCE.

## Files

- `frontend/lib/features/meetings/presentation/attendance_capture.dart` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: Widget test of `attendance_capture.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
