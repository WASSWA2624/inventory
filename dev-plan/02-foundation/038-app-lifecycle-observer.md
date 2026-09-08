# 038 — Lifecycle observer

**Phase** 02 · Foundation services  |  **Depends on** [023](023-app-bootstrap.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the observer that flushes pending work on pause and re-arms the lock on resume.

## Files

- `lib/core/lifecycle/lifecycle_observer.dart` (new)

## Contract

```dart
class LifecycleObserver with WidgetsBindingObserver { Stream<AppLifecycleState> get states; }
```

## Steps

1. Emit lifecycle events, flush pending writes on pause and notify listeners on resume.

## Constraints

- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Backgrounding during capture never loses an unsaved photo reference.
- [ ] Tests written and passing: `test/core/lifecycle/lifecycle_observer_test.dart` drives lifecycle transitions.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
