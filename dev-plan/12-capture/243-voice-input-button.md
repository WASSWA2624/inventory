# 243 — Voice input button

**Phase** 12 · Capture  |  **Depends on** [242](242-stt-service.md), [056](../03-design-system/056-app-text-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The microphone affordance attached to any long-text field.

## Files

- `frontend/lib/features/capture/presentation/voice_input_button.dart` (new)

## Steps

1. Show listening state and live partial text; stop on tap or silence.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The result lands in the field as editable text, never auto-submitted.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
