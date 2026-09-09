# 258 — Rapid capture mode

**Phase** 12 · Capture  |  **Depends on** [254](254-save-raw.md), [255](255-capture-reset.md), [227](227-photo-tray.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The high-speed loop from the specification: item after item without leaving the camera.

## Files

- `frontend/lib/features/capture/presentation/rapid_mode_screen.dart` (new)

## Steps

1. One tap ends an item and starts the next; show a running list of items with photo counts.
2. Nothing is analysed until the operator asks.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Four items with photos can be captured in under a minute.
- [ ] Tests written and passing: Integration test of a four-item run.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
