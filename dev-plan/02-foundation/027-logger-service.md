# 027 — Logger service

**Phase** 02 · Foundation services  |  **Depends on** [026](026-result-and-failures.md), [016](../01-orchestration/016-logging-checker.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the logger with levels, tags, a bounded buffer and redaction.

## Files

- `frontend/lib/core/logging/logger.dart` (new)

## Contract

```dart
abstract interface class Logger { void trace/info/warn/error(String tag, String message, {Object? error}); }
```

## Steps

1. Implement a ring buffer of the configured size, persisted to a rotating file, with an in-memory fake for tests.
2. Redact any value matching the secret patterns before it is written.
3. Expose the buffer as a stream for the diagnostics screen.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/02-coding-standards.md`, `frontend/rules/03-state-and-data.md`.
- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No log line contains a redacted pattern, even when one is passed deliberately.
- [ ] Tests written and passing: `frontend/test/core/logging/logger_test.dart` proves redaction, level filtering and buffer bounds.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
