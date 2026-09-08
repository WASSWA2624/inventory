# 032 — Hashing service

**Phase** 02 · Foundation services  |  **Depends on** [026](026-result-and-failures.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the content-hash service used for file identity and duplicate detection.

## Files

- `lib/core/hash/hashing_service.dart` (new)

## Contract

```dart
Future<Result<String>> sha256OfFile(File f);  String sha256OfString(String s)
```

## Steps

1. Stream the file in chunks so a large photo is never loaded whole into memory.

## Constraints

- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Hashing a hundred-megabyte file holds memory flat.
- [ ] Tests written and passing: `test/core/hash/hashing_service_test.dart` uses known vectors and a large temporary file.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
