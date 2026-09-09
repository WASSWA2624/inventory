# 030 — Injectable clock

**Phase** 02 · Foundation services  |  **Depends on** [004](../01-orchestration/004-folder-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the clock abstraction so every timestamp is testable and consistently UTC.

## Files

- `frontend/lib/core/time/clock.dart` (new)

## Contract

```dart
abstract interface class Clock { DateTime nowUtc(); DateTime today(); Duration get offset; }
class SystemClock implements Clock;  class FixedClock implements Clock
```

## Steps

1. Expose nowUtc, today and the device offset; provide the fixed implementation for tests.
2. Add a lint-visible comment recording the rule that DateTime.now is never called directly elsewhere.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/02-coding-standards.md`, `frontend/.rules/03-state-and-data.md`.
- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A test can freeze time and assert a stamped value exactly.
- [ ] Tests written and passing: `frontend/test/core/time/clock_test.dart` covers both implementations.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
