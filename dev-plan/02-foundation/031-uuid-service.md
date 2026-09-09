# 031 — UUIDv7 identifier service

**Phase** 02 · Foundation services  |  **Depends on** [030](030-clock-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the time-ordered identifier generator that makes cross-device merge safe.

## Files

- `frontend/lib/core/ids/uuid_service.dart` (new)

## Contract

```dart
abstract interface class IdService { String newId(); }  class UuidV7Service implements IdService
```

## Steps

1. Implement UUIDv7 from the clock plus a random tail, with a deterministic sequence implementation for tests.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/02-coding-standards.md`, `frontend/.rules/03-state-and-data.md`.
- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Identifiers generated in order sort in order as strings.
- [ ] Ten thousand identifiers contain no duplicate.
- [ ] Tests written and passing: `frontend/test/core/ids/uuid_service_test.dart` asserts ordering, uniqueness and format.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
