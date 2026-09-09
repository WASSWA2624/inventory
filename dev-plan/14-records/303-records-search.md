# 303 — Search records

**Phase** 14 · Records  |  **Depends on** [302](302-records-list.md), [062](../03-design-system/062-app-search-field.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Search across field values, captions, transcripts and OCR text.

## Files

- `frontend/lib/features/records/data/record_search.dart` (new)

## Steps

1. Use an indexed search table kept in step by triggers or repository writes.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/07-consistency.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A search over ten thousand records returns in under 300 milliseconds.
- [ ] Tests written and passing: Performance test with a seeded database.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
