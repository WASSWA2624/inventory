# 234 — Assign a photo type

**Phase** 12 · Capture  |  **Depends on** [227](227-photo-tray.md), [059](../03-design-system/059-app-choice-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Set front, serial, rating plate, damage and the rest, by hand or from a suggestion.

## Files

- `frontend/lib/features/capture/presentation/photo_type_sheet.dart` (new)

## Steps

1. Offer the types from the specification; remember the last used type for rapid tagging.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/06-simplicity.md`, `frontend/.rules/09-accessibility.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The type feeds file naming and evidence tracking immediately.
- [ ] Tests written and passing: Widget test of `photo_type_sheet.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
