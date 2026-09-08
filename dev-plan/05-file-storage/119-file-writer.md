# 119 — Safe file writer

**Phase** 05 · File storage  |  **Depends on** [115](115-storage-root.md), [032](../02-foundation/032-hashing-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write files atomically and record their hash and size.

## Files

- `lib/core/files/file_writer.dart` (new)

## Steps

1. Write to a temporary name then rename; compute the hash in the same pass.
2. Fail cleanly with a storage failure when space runs out, leaving no partial file.

## Constraints

- Original files are never modified or deleted; derived copies go to `.cache`.
- Every write is atomic: temporary name, then rename, so an interruption leaves no partial file.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] An interrupted write never leaves a half-written photo.
- [ ] Tests written and passing: Test that a simulated failure leaves the target absent.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
