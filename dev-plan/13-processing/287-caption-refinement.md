# 287 — Refine captions

**Phase** 13 · Processing pipeline  |  **Depends on** [041](../02-foundation/041-ai-service-interface.md), [101](../04-data-layer/101-captions-table.md), [242](../12-capture/242-transcript-preservation.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Produce the cleaned caption, stored beside the raw one, never over it.

## Files

- `lib/features/processing/domain/caption_refinement.dart` (new)

## Steps

1. Refine only on request or when the project enables automatic refinement.
2. Forbid additions: the refiner may reword, not introduce facts.

## Constraints

- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Raw and refined are both retrievable and both exportable.
- [ ] Tests written and passing: Test asserting the raw row is unchanged.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
