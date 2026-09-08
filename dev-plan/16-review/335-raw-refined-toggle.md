# 335 — Raw and refined toggle

**Phase** 16 · Review and approval  |  **Depends on** [287](../13-processing/287-caption-refinement.md), [333](333-review-screen.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Show both versions and let the user choose which is authoritative.

## Files

- `lib/features/review/presentation/raw_refined_toggle.dart` (new)

## Steps

1. Per-field and per-caption toggle; the choice sets valueFinal and is remembered per project as a default.

## Constraints

- AI output is a proposal until a person approves it; nothing is written as final automatically.
- Raw and refined values are both preserved and both selectable.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Neither version is ever destroyed by the choice.
- [ ] Tests written and passing: Widget test of both selections.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
