# 334 — Attention-first field ordering

**Phase** 16 · Review and approval  |  **Depends on** [333](333-review-screen.md), [284](../13-processing/284-confidence-banding.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Sort low-confidence, missing, conflicting and duplicate-flagged fields to the top.

## Files

- `frontend/lib/features/review/domain/field_ordering.dart` (new)

## Steps

1. Collapse confident fields under a single expandable group.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`, `frontend/rules/09-accessibility.md`.
- AI output is a proposal until a person approves it; nothing is written as final automatically.
- Raw and refined values are both preserved and both selectable.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The common case is a glance and a tap.
- [ ] Tests written and passing: Unit test of ordering rules.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
