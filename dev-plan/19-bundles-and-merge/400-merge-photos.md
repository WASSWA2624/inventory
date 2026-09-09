# 400 — Merge photos by content hash

**Phase** 19 · Bundles and merge  |  **Depends on** [397](397-merge-entity-level.md), [099](../04-data-layer/099-photos-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Union photo sets, storing identical content once.

## Files

- `frontend/lib/features/merge/domain/merge_photos.dart` (new)

## Steps

1. Match on SHA-256; merge captions per field; keep the importing device's order and append new photos.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/11-security-privacy.md`, `frontend/.rules/12-testing.md`.
- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The same photo imported twice occupies one file.
- [ ] Tests written and passing: Test asserting a single stored file.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
