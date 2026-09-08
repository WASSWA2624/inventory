# 218 — Camera preview

**Phase** 12 · Capture  |  **Depends on** [217](217-camera-permission-flow.md), [005](../01-orchestration/005-dependency-allowlist.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

A responsive, correctly oriented preview that starts fast.

## Files

- `lib/features/capture/presentation/camera_view.dart` (new)

## Steps

1. Handle rotation, aspect ratio and surface disposal on background.

## Constraints

- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Returning from background restores the preview without a black frame.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
