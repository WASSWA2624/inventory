# 406 — Bulk conflict resolution

**Phase** 19 · Bundles and merge  |  **Depends on** [405](405-conflict-screen.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Resolve by field or by device in one action.

## Files

- `frontend/lib/features/merge/presentation/conflict_bulk_actions.dart` (new)

## Steps

1. Offer "apply to all remaining conflicts on this field" and "prefer this device".

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/11-security-privacy.md`, `frontend/rules/12-testing.md`.
- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Bulk choices are listed in the audit log individually.
- [ ] Tests written and passing: Widget test of `conflict_bulk_actions.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
