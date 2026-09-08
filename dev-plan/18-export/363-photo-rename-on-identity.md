# 363 — Rename photos when identity is known

**Phase** 18 · Export  |  **Depends on** [362](362-photo-naming-service.md), [317](../15-data-quality/317-identity-hash.md), [120](../05-file-storage/120-file-relocation.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Rename provisional file names once a serial or asset number is confirmed.

## Files

- `lib/core/export/photo_rename.dart` (new)

## Steps

1. Rename inside a transaction with the path update; keep the original filename in metadata and history.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A photo taken before identification ends up correctly named.
- [ ] Tests written and passing: Test that references still resolve after renaming.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
