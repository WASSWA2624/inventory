# 033 — Isolate runner

**Phase** 02 · Foundation services  |  **Depends on** [026](026-result-and-failures.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the helper that moves heavy work off the UI thread with progress and cancellation.

## Files

- `frontend/lib/core/concurrency/isolate_runner.dart` (new)

## Contract

```dart
Future<Result<R>> runIsolate<M, R>(FutureOr<R> Function(M) task, M message, {void Function(double)? onProgress, CancellationToken? cancel});
```

## Steps

1. Wrap the isolate spawn, forward progress messages, honour cancellation and map thrown errors to Failure.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/02-coding-standards.md`, `frontend/rules/03-state-and-data.md`.
- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Cancelling mid-run completes with CancelledFailure and leaves no orphan isolate.
- [ ] Tests written and passing: `frontend/test/core/concurrency/isolate_runner_test.dart` covers success, progress, failure and cancellation.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
