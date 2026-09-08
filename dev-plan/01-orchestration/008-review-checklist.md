# 008 — The verify command

**Phase** 01 · Project setup and guardrails  |  **Depends on** [005](005-dependency-allowlist.md), [006](006-how-to-use-this-plan.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the single command that runs every gate, so a developer and continuous integration run exactly the same checks.

## Files

- `tool/verify.dart` (new)

## Contract

```dart
Future<int> main(List<String> args)  // --fast skips golden and integration suites
```

## Steps

1. Run in order: format check, analyzer, dependency allowlist, structure check, plan check, guardrail tests, unit and widget tests.
2. Print a single summary table of gate names and outcomes, and exit non-zero if any gate fails.
3. Support --fast for the pre-commit path and the full run for continuous integration.

## Constraints

- Checkers and guardrail tests must pass on the current tree and fail on a deliberate violation; ship a fixture proving both.
- A guardrail reports every violation it finds, with file and line, rather than stopping at the first.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] One command reproduces the entire review gate locally.
- [ ] Tests written and passing: `test/tool/verify_test.dart` asserts the exit code aggregates gate failures correctly.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
