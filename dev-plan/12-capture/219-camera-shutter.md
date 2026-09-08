# 219 — Shutter and immediate save

**Phase** 12 · Capture  |  **Depends on** [218](218-camera-preview.md), [119](../05-file-storage/119-file-writer.md), [118](../05-file-storage/118-photo-path-builder.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Take a photo, write it to the right folder, and be ready for the next shot.

## Files

- `frontend/lib/features/capture/domain/take_photo.dart` (new)

## Steps

1. Write the file, hash it, insert the row and add it to the session, all off the UI thread.
2. Give haptic and visual confirmation without blocking the preview.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Shutter to ready is under 400 milliseconds on a mid-range device.
- [ ] Tests written and passing: Integration test that ten rapid shots produce ten files and ten rows.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
