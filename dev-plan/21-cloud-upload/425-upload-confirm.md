# 425 — Upload confirmation

**Phase** 21 · Cloud upload  |  **Depends on** [419](419-destination-list.md), [072](../03-design-system/072-app-dialog-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Show file, size and destination folder, and require an explicit tap.

## Files

- `frontend/lib/features/cloud/presentation/upload_confirm_sheet.dart` (new)

## Steps

1. Confirm every upload, every time; no remembered blanket consent.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/11-security-privacy.md`.
- Nothing is uploaded without an explicit per-file confirmation; credentials live only in secure storage.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No bytes leave the device without this confirmation.
- [ ] Tests written and passing: Test that cancelling performs no request.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
