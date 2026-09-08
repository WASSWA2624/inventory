# 037 — Secure storage service

**Phase** 02 · Foundation services  |  **Depends on** [026](026-result-and-failures.md), [022](../01-orchestration/022-security-policy.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the only sanctioned home for keys and credentials, with typed accessors.

## Files

- `lib/core/security/secure_storage.dart` (new)

## Contract

```dart
Future<Result<void>> putSecret(SecretKey k, String v);  Future<Result<String?>> readSecret(SecretKey k);  Future<void> deleteAll();
```

## Steps

1. Wrap the platform secure storage; define SecretKey as a closed enum so no arbitrary key names appear.
2. Assert in debug that no secret value is ever passed to the preferences store or the database.

## Constraints

- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Secrets survive a restart and are absent from the database and every export.
- [ ] Tests written and passing: `test/core/security/secure_storage_test.dart` uses a fake backing store and asserts isolation.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
