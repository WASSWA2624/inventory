# 447 — Background work policy

**Phase** 23 · Hardening  |  **Depends on** [296](../13-processing/296-background-ocr.md), [295](../13-processing/295-auto-process-on-connect.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the policy object every background job must consult, and the test that enforces it.

## Files

- `frontend/lib/core/background/background_policy.dart` (new)
- `frontend/test/core/background/background_policy_test.dart` (new)

## Contract

```dart
class BackgroundPolicy { bool mayRun({required bool charging, required bool idle, required NetworkState net, required bool foreground}); }
```

## Steps

1. Implement the rules: on-device OCR only while charging and idle; automatic processing only when the setting and the network allow it; nothing at all while the app is in the foreground.
2. Route background OCR and automatic processing through the policy so the rule lives in exactly one place.
3. Assert every background job stops within one poll interval of the app returning to the foreground.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A job that bypasses the policy fails the test.
- [ ] Tests written and passing: The policy test, plus a job test proving work stops on resume.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
