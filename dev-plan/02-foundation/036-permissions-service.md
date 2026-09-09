# 036 — Runtime permissions service

**Phase** 02 · Foundation services  |  **Depends on** [026](026-result-and-failures.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the one service that requests camera, microphone, location and storage, with rationale and recovery.

## Files

- `frontend/lib/core/permissions/permissions_service.dart` (new)

## Contract

```dart
Future<Result<PermissionState>> request(AppPermission p);  Future<PermissionState> status(AppPermission p);
```

## Steps

1. Wrap each permission with request, status and a rationale string; handle permanent denial by offering the settings page.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/02-coding-standards.md`, `frontend/.rules/03-state-and-data.md`.
- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A denied permission returns PermissionFailure with a recovery action, never an exception.
- [ ] Tests written and passing: `frontend/test/core/permissions/permissions_service_test.dart` covers granted, denied and permanently denied.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
