# 255 — Reset for the next item

**Phase** 12 · Capture  |  **Depends on** [254](254-save-raw.md), [204](../11-context/204-context-persistence.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Clear the session but keep context, pinned template and camera settings.

## Files

- `frontend/lib/features/capture/domain/capture_reset.dart` (new)

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/06-simplicity.md`, `frontend/.rules/09-accessibility.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Capturing the next item requires no re-selection of anything.
- [ ] Tests written and passing: Test that context and template survive a save.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
