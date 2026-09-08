# 446 — Memory ceiling test

**Phase** 23 · Hardening  |  **Depends on** [443](443-list-performance.md), [033](../02-foundation/033-isolate-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the instrumented test that fails when capture, export or merge exceeds its memory ceiling, then fix what it catches.

## Files

- `frontend/integration_test/memory_test.dart` (new)
- `frontend/tool/profile_memory.dart` (new)

## Contract

```dart
Future<MemoryReport> measure(Future<void> Function() scenario, {required int ceilingMb});
```

## Steps

1. Drive three scenarios: a two-hundred-record capture session, a five-thousand-record export and a two-thousand-photo merge.
2. Sample resident memory throughout; fail when the ceiling is exceeded or when memory does not return to baseline afterwards.
3. Fix every leak the run exposes: undisposed isolates, unclosed streams, retained image handles.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A deliberately leaked stream subscription fails the test.
- [ ] Tests written and passing: The memory test, run nightly in the pipeline.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
