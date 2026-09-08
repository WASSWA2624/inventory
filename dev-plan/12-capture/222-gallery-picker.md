# 222 — Pick photos from the gallery

**Phase** 12 · Capture  |  **Depends on** [215](215-capture-session-controller.md), [126](../05-file-storage/126-file-validation.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Import existing images into the session, copying them into the project tree.

## Files

- `lib/features/capture/presentation/gallery_picker.dart` (new)

## Steps

1. Multi-select; copy rather than reference; preserve the original filename in metadata.

## Constraints

- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Deleting the photo from the gallery afterwards does not affect the record.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
