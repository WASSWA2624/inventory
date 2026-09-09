# 159 — Create a template from the library

**Phase** 09 · Templates  |  **Depends on** [157](157-shipped-template-loader.md), [158](158-template-list.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Pick a shipped template and add it to the project in two taps.

## Files

- `frontend/lib/features/templates/presentation/shipped_picker_screen.dart` (new)

## Steps

1. Preview fields before adding; allow renaming on add.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A new project is capture-ready without building anything.
- [ ] Tests written and passing: Widget test of `shipped_picker_screen.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
