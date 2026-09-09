# 130 — First-run flow

**Phase** 06 · Application shell  |  **Depends on** [128](128-nav-shell.md), [034](../02-foundation/034-device-identity.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The shortest possible path from install to first capture. Until the backend exists, that path starts at a local
operator profile; task 498 puts sign-in in front of it, which is the shipped behaviour (§56 rule 4, FE-SIMP-04).
Build the flow so adding that step is a route change, not a redesign.

## Files

- `frontend/lib/features/onboarding/presentation/first_run_screen.dart` (new)

## Steps

1. Ask only for an operator name, then offer "Start a project" with a shipped template.
2. Skippable: a user can reach capture without answering anything beyond the name.
3. Keep the flow a single gate the router consults, so 498 can replace the operator-name step with sign-in and
   enrolment without touching any screen after it. No onboarding tour, no wizard, no second step, ever.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/05-responsiveness.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A new install can capture within thirty seconds of clearing this screen.
- [ ] The gate is one decision in the router, so task 498 can put sign-in in front of it without a redesign.
- [ ] Tests written and passing: Widget test of the skip path.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
