# 230 — Delete a photo

**Phase** 12 · Capture  |  **Depends on** [227](227-photo-tray.md), [072](../03-design-system/072-app-dialog-service.md), [074](../03-design-system/074-app-snackbar.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Remove one photo from the session or record, with confirmation and undo.

## Files

- `frontend/lib/features/capture/presentation/photo_delete_action.dart` (new)

## Steps

1. Confirm with the destructive dialog; remove from the tray and the database; offer undo through the snackbar.
2. Keep the file until the retention purge, so undo is always possible.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/06-simplicity.md`, `frontend/.rules/09-accessibility.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Undo restores the photo in its original position with its caption and type.
- [ ] Tests written and passing: Widget test of delete then undo.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
