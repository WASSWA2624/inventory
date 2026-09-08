# 451 — Device matrix runner

**Phase** 23 · Hardening  |  **Depends on** [437](437-responsive-audit.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the script that runs the integration suite across the configured device classes and compares timings between runs.

## Files

- `frontend/tool/device_matrix.dart` (new)
- `frontend/tool/devices.yaml` (new)

## Contract

```dart
Future<int> main(List<String> args)  // --devices low,mid,tablet
```

## Steps

1. Declare the device classes and their identifiers in the devices file.
2. Run the integration suite on each attached device, capturing cold start, shutter latency, export duration and merge duration.
3. Write a comparison report against the stored baseline and fail when a metric regresses beyond its tolerance.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A regression on the low-end device fails the run, naming the metric and the margin.
- [ ] Tests written and passing: `frontend/test/tool/device_matrix_test.dart` parses fixture output and asserts the comparison logic.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
