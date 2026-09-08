# 225 — Photo tray

**Phase** 12 · Capture  |  **Depends on** [215](215-capture-session-controller.md), [077](../03-design-system/077-app-photo-thumb.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The horizontal strip of thumbnails with counts and add action.

## Files

- `frontend/lib/features/capture/presentation/photo_tray.dart` (new)

## Steps

1. Show type badge, caption indicator and processing state per thumbnail.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Thirty photos scroll smoothly and the add button is always reachable.
- [ ] Tests written and passing: Widget test of badges and ordering.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
