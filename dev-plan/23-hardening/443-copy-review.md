# 443 — Copy and message review

**Phase** 23 · Hardening  |  **Depends on** [081](../03-design-system/081-copy-helper.md), [069](../03-design-system/069-app-error-state.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One pass over every user-facing string for plain language and consistency.

## Files

- `frontend/lib/core/copy/copy.dart` (edit)

## Steps

1. Replace jargon; make every error say what happened and what to do next.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/05-responsiveness.md`, `frontend/.rules/09-accessibility.md`, `frontend/.rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No message contains a technical term the user cannot act on.
- [ ] Tests written and passing: Unit tests of `copy.dart` against its fake.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
