# 287 — Link values to their evidence

**Phase** 13 · Processing  |  **Depends on** [104](../04-data-layer/104-evidence-table.md), [278](278-proposal-application.md), [266](266-ocr-on-device.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Record which photo region, page or transcript produced each value.

## Files

- `frontend/lib/features/processing/domain/evidence_linking.dart` (new)

## Steps

1. Store photo id and bounding region when the provider supplies one; fall back to the whole photo.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/03-state-and-data.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- On-device first; an online call happens only when local extraction cannot finish the job.
- A verified or manual value is never overwritten by processing.
- Every applied value carries source, confidence and at least one evidence link.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every extracted value can be traced to a source in the review screen.
- [ ] Tests written and passing: Test that each applied value writes at least one evidence row.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
