# 215 — Capture session controller

**Phase** 12 · Capture  |  **Depends on** [214](214-capture-session-model.md), [014](../01-orchestration/014-riverpod-test.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The controller that owns the session and writes through to storage immediately.

## Files

- `frontend/lib/features/capture/presentation/capture_controller.dart` (new)

## Steps

1. Persist each addition (photo, caption, value) as it happens, not on save.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Killing the app mid-session loses at most the last keystroke.
- [ ] Tests written and passing: Test that a photo added is on disk and in the database before the next frame.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
