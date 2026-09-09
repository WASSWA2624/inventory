# 308 — Add and remove photos after save

**Phase** 14 · Records  |  **Depends on** [306](306-record-detail.md), [230](../12-capture/230-photo-delete.md), [221](../12-capture/221-camera-shutter.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Attach more evidence or remove a bad photo long after capture.

## Files

- `frontend/lib/features/records/presentation/record_photos_editor.dart` (new)

## Steps

1. Adding offers re-analysis; removing flags values whose evidence has gone.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/07-consistency.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Values are never silently deleted when their evidence is removed.
- [ ] Tests written and passing: Test of the evidence-removed flag.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
