# 252 — Inline template fields on capture

**Phase** 12 · Capture  |  **Depends on** [218](218-capture-screen.md), [154](../09-templates/154-field-type-registry.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Let the operator type known values during capture instead of waiting for review.

## Files

- `frontend/lib/features/capture/presentation/inline_fields_section.dart` (new)

## Steps

1. Show only identity and required fields by default, with the rest behind "More fields".

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A fully manual project is captured entirely on this screen.
- [ ] Tests written and passing: Widget test of `inline_fields_section.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
