# 231 — Retake a photo

**Phase** 12 · Capture  |  **Depends on** [230](230-photo-delete.md), [221](221-camera-shutter.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Replace a photo in place, keeping its position, type and caption.

## Files

- `frontend/lib/features/capture/presentation/photo_retake_action.dart` (new)

## Steps

1. Keep the old file as a superseded version rather than overwriting it.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/06-simplicity.md`, `frontend/.rules/09-accessibility.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Retaking never changes the photo's position in the tray.
- [ ] Tests written and passing: Widget test of `photo_retake_action.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
