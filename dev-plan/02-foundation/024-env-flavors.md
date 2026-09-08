# 024 — Build flavours and environment

**Phase** 02 · Foundation services  |  **Depends on** [023](023-app-bootstrap.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the flavour configuration that separates development and production builds without conditional code in features.

## Files

- `frontend/lib/app/env.dart` (new)
- `frontend/android/app/build.gradle` (edit)

## Contract

```dart
enum Flavor { dev, prod }  abstract final class Env { static Flavor get flavor; static bool get isDev; }
```

## Steps

1. Define the flavours in Gradle with distinct application id suffixes and display names.
2. Read the flavour from a compile-time constant and expose it through Env; never branch on it inside a feature.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/02-coding-standards.md`, `frontend/rules/03-state-and-data.md`.
- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A development build installs alongside a production build.
- [ ] Tests written and passing: `frontend/test/app/env_test.dart` asserts defaults and overrides.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
