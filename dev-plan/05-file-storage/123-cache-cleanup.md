# 123 — Cache cleanup

**Phase** 05 · File storage  |  **Depends on** [121](121-thumbnail-cache.md), [122](122-compressed-copy.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Keep .cache bounded and disposable.

## Files

- `lib/core/files/cache_cleanup.dart` (new)

## Steps

1. Delete entries by age and by total size; run on launch and on demand from settings.

## Constraints

- Original files are never modified or deleted; derived copies go to `.cache`.
- Every write is atomic: temporary name, then rename, so an interruption leaves no partial file.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Deleting the whole cache loses nothing but speed.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
