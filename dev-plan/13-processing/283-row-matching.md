# 283 — Match to a predefined row

**Phase** 13 · Processing pipeline  |  **Depends on** [180](../09-templates/180-predefined-rows-import.md), [181](../09-templates/181-row-aliases-editor.md), [281](281-normalise-choices.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Exact, alias, normalised, fuzzy, then model classification, in that order.

## Files

- `lib/features/processing/domain/row_matching.dart` (new)

## Steps

1. Stop at the first confident match; record which strategy matched and its score.

## Constraints

- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] "Sphygmomanometer" reaches "Blood Pressure Machine" without a model call.
- [ ] Tests written and passing: Unit tests for each strategy.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
