# 231 — Crop a photo

**Phase** 12 · Capture  |  **Depends on** [226](226-photo-viewer.md), [033](../02-foundation/033-isolate-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Crop for legibility, keeping the original.

## Files

- `lib/features/capture/presentation/photo_crop_screen.dart` (new)

## Steps

1. Write the crop as a derived file linked to the original; allow reverting to the original.

## Constraints

- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Reverting always restores the full frame.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
