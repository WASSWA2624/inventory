# 383 — Export screen

**Phase** 18 · Export  |  **Depends on** [360](360-export-scope.md), [361](361-export-options.md), [052](../03-design-system/052-app-page.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One screen assembling format, scope, options and extras, with a live record count.

## Files

- `frontend/lib/features/exports/presentation/export_screen.dart` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/08-localization.md`, `frontend/rules/10-performance.md`, `frontend/rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A default export needs one tap after opening the screen.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
