# 279 — Ask the operator which template

**Phase** 13 · Processing pipeline  |  **Depends on** [278](278-template-detection-model.md), [073](../03-design-system/073-app-bottom-sheet.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The smallest possible interruption when detection is uncertain.

## Files

- `lib/features/processing/presentation/template_choice_sheet.dart` (new)

## Steps

1. Two or three large buttons plus the option to pin the choice to the current context level.

## Constraints

- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The question is asked once per room, not once per item.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
