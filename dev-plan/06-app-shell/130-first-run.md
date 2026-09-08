# 130 — First-run flow

**Phase** 06 · Application shell  |  **Depends on** [128](128-nav-shell.md), [034](../02-foundation/034-device-identity.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The shortest possible path from install to first capture, with no account.

## Files

- `lib/features/onboarding/presentation/first_run_screen.dart` (new)

## Steps

1. Ask only for an operator name, then offer "Start a project" with a shipped template.
2. Skippable: a user can reach capture without answering anything.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A new install can capture within thirty seconds.
- [ ] Tests written and passing: Widget test of the skip path.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
