# 446 — Database index review

**Phase** 23 · Hardening  |  **Depends on** [303](../14-records/303-records-search.md), [304](../14-records/304-records-filters.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Profile the real queries and add the indexes they need.

## Files

- `frontend/lib/core/db/migrations.dart` (edit)

## Steps

1. Measure list, search, filter, duplicate lookup and queue queries with realistic data.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every screen query is measured and documented.
- [ ] Tests written and passing: Performance test with a large seeded database.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
