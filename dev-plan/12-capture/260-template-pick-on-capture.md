# 260 — Choose or pin a template

**Phase** 12 · Capture  |  **Depends on** [218](218-capture-screen.md), [158](../09-templates/158-template-list.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Let the operator pick the template and pin it for the session or the context level.

## Files

- `frontend/lib/features/capture/presentation/template_picker_sheet.dart` (new)

## Steps

1. Offer the project's templates with the last used first; pin option per the specification.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A single-template project never shows this control.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
