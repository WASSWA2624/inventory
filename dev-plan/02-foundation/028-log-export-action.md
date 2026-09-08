# 028 — Diagnostics log export

**Phase** 02 · Foundation services  |  **Depends on** [027](027-logger-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the function that writes the buffer to a shareable file, so support needs no server.

## Files

- `lib/core/logging/log_export.dart` (new)

## Contract

```dart
Future<Result<File>> exportLog({required Directory into});
```

## Steps

1. Serialise the buffer with timestamps and tags; name the file with the date and device id.

## Constraints

- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The exported file contains no record values and no credentials.
- [ ] Tests written and passing: `test/core/logging/log_export_test.dart` scans the output against the secret patterns.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
