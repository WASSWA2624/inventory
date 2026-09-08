# 034 — Device identity

**Phase** 02 · Foundation services  |  **Depends on** [031](031-uuid-service.md), [030](030-clock-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the service that creates the stable device identifier and exposes device facts for audit entries.

## Files

- `lib/core/device/device_identity.dart` (new)

## Contract

```dart
Future<String> deviceId();  Future<DeviceInfo> deviceInfo();
```

## Steps

1. Generate the identifier once, persist it, and never regenerate it.
2. Expose model, operating system version and application version for audit rows.

## Constraints

- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The identifier is identical after a restart and after an app update.
- [ ] Tests written and passing: `test/core/device/device_identity_test.dart` asserts persistence across two reads.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
