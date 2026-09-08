# 039 — Riverpod observer

**Phase** 02 · Foundation services  |  **Depends on** [023](023-app-bootstrap.md), [027](027-logger-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the observer that logs provider failures and slow rebuilds in development only.

## Files

- `frontend/lib/app/provider_observer.dart` (new)

## Contract

```dart
class AppProviderObserver extends ProviderObserver
```

## Steps

1. Log provider errors with their name and stack; record rebuild counts above a threshold in development builds.
2. Install it in the provider scope; disable it entirely in production.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/02-coding-standards.md`, `frontend/rules/03-state-and-data.md`.
- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A provider that throws produces exactly one logged error.
- [ ] Tests written and passing: `frontend/test/app/provider_observer_test.dart` asserts logging on failure.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
