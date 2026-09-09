# 132 — Offline banner wiring

**Phase** 06 · Application shell  |  **Depends on** [131](131-status-line.md), [075](../03-design-system/075-app-banner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Show the offline explanation from the specification, not an error.

## Files

- `frontend/lib/app/widgets/offline_banner.dart` (new)

## Steps

1. Appear on transition to offline, dismissible, reappearing only on the next transition.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Going offline never interrupts capture with a dialog.
- [ ] Tests written and passing: Unit tests of `offline_banner.dart`.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
