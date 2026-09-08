# 448 — Failure injection suite

**Phase** 23 · Hardening  |  **Depends on** [015](../01-orchestration/015-error-handling-policy.md), [254](../12-capture/254-capture-recovery.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the fault-injection harness and the suite that drives every external dependency into failure.

## Files

- `frontend/integration_test/failure_paths_test.dart` (new)
- `frontend/test/support/fault_injection.dart` (new)

## Contract

```dart
class FaultInjector { void fail(Dependency d, Failure f); void clear(); }
```

## Steps

1. Implement the injector so any injectable service can be forced to fail on demand, per test.
2. Cover camera denied, microphone denied, storage full, provider unreachable, key invalid, response malformed, bundle corrupt, database locked and the process killed mid-capture.
3. Assert for each case: nothing lost, a recoverable message shown, and a retry path that actually works.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/05-responsiveness.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every injected failure leaves the app usable and the raw evidence intact.
- [ ] Tests written and passing: The failure-path suite, one case per dependency.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
