# 452 — In-app friction log

**Phase** 23 · Hardening  |  **Depends on** [027](../02-foundation/027-logger-service.md), [028](../02-foundation/028-log-export-action.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Build the one-tap "something went wrong here" action a field tester uses during a trial, and the exportable local log behind it.

## Files

- `frontend/lib/features/settings/domain/friction_log.dart` (new)
- `frontend/lib/features/settings/presentation/friction_log_button.dart` (new)

## Contract

```dart
Future<Result<void>> logFriction({required String screen, String? note, bool withScreenshot = false});
```

## Steps

1. Record screen, timestamp, operator, project, the last user action and an optional note and screenshot, all on the device.
2. Expose the action from the overflow menu on every screen while the trial flag is enabled.
3. Export the whole log, screenshots included, as one file from settings.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A tester flags a problem in one tap without leaving the task they were doing.
- [ ] Nothing is transmitted anywhere; the log stays local until exported by hand.
- [ ] Tests written and passing: Test that an entry captures the screen name and that export contains every entry.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
