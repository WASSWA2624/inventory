# 397 — Automatic settlement rules

**Phase** 19 · Bundles and merge  |  **Depends on** [396](396-merge-field-level.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The four rules that settle a conflict without asking.

## Files

- `frontend/lib/features/merge/domain/merge_rules.dart` (new)

## Steps

1. Verified beats unverified; barcode or reference beats inferred; non-empty beats never-edited empty; otherwise conflict.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/11-security-privacy.md`, `frontend/rules/12-testing.md`.
- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every automatic decision is recorded in the audit log with the rule that made it.
- [ ] Tests written and passing: Unit tests per rule and for the fall-through.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
