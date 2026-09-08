# 137 — Capture settings screen

**Phase** 07 · Operator profile and settings  |  **Depends on** [136](136-settings-store.md), [135](135-settings-shell.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Camera defaults, auto-fill dates, GPS, photo quality, folder strategy and naming pattern.

## Files

- `frontend/lib/features/settings/presentation/capture_settings_screen.dart` (new)

## Steps

1. Each setting shows its effect in one line of plain language.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`, `frontend/rules/11-security-privacy.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Changing the folder strategy affects only new files, with that stated on screen.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
