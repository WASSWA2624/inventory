# 026 — Result type and failure taxonomy

**Phase** 02 · Foundation services  |  **Depends on** [025](025-app-constants.md), [015](../01-orchestration/015-error-handling-test.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the sealed failure hierarchy and the Result type every fallible call returns.

## Files

- `frontend/lib/core/errors/failure.dart` (new)
- `frontend/lib/core/errors/result.dart` (new)

## Contract

```dart
sealed class Failure { String get message; String? get recoveryAction; }
sealed class Result<T> { R fold<R>(R Function(Failure) onFailure, R Function(T) onSuccess); }
```

## Steps

1. Define StorageFailure, PermissionFailure, NetworkFailure, ProviderFailure, ValidationFailure, CorruptionFailure and CancelledFailure, each with a plain-language message and a recovery action.
2. Implement Success and FailureResult with map, flatMap, fold and getOrElse.
3. Add a helper that wraps a throwing call and converts known exceptions into the right Failure.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/02-coding-standards.md`, `frontend/.rules/03-state-and-data.md`.
- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Domain methods can return Result without importing Flutter.
- [ ] Tests written and passing: `frontend/test/core/errors/result_test.dart` covers mapping, folding and exception conversion.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
