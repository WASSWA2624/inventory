# 035 — Connectivity service

**Phase** 02 · Foundation services  |  **Depends on** [026](026-result-and-failures.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the service reporting online, offline and metered, including the manual offline override.

## Files

- `lib/core/network/connectivity_service.dart` (new)

## Contract

```dart
enum NetworkState { online, metered, offline }  Stream<NetworkState> watch();
```

## Steps

1. Combine the platform connectivity stream with the settings override so offline mode always wins.

## Constraints

- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Enabling the manual override reports offline regardless of the radio.
- [ ] Tests written and passing: `test/core/network/connectivity_service_test.dart` uses a fake source and asserts the override.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
