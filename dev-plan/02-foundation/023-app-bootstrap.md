# 023 — Application bootstrap

**Phase** 02 · Foundation services  |  **Depends on** [004](../01-orchestration/004-folder-scaffold.md), [003](../01-orchestration/003-strict-lints.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the single entry point that installs error handling, the provider scope and the router before the first frame.

## Files

- `frontend/lib/main.dart` (edit)
- `frontend/lib/app/app.dart` (new)

## Contract

```dart
Future<void> main();  class TaptureApp extends ConsumerWidget
```

## Steps

1. Ensure widget bindings are initialised, then run the app inside runZonedGuarded.
2. Route FlutterError.onError and the zone error handler to the logger service once it exists, and to a temporary handler until then.
3. Install ProviderScope and a single MaterialApp.router placeholder.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/01-structure.md`, `frontend/.rules/02-coding-standards.md`, `frontend/.rules/03-state-and-data.md`.
- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] An uncaught error is captured rather than lost, and the app still renders.
- [ ] Tests written and passing: `frontend/test/app/bootstrap_test.dart` pumps the app and asserts a thrown error reaches the handler.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
