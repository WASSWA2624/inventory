# 133 — Global error and crash recovery screen

**Phase** 06 · Application shell  |  **Depends on** [029](../02-foundation/029-error-boundary-widget.md), [028](../02-foundation/028-log-export-action.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

A last-resort screen that keeps data safe and offers the log.

## Files

- `frontend/lib/app/widgets/global_error_page.dart` (new)

## Steps

1. Offer restart, export log and open recycle bin; never offer "clear data".

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/05-responsiveness.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A fatal error cannot lead a user into destroying their work.
- [ ] Tests written and passing: Unit tests of `global_error_page.dart`.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
