# 017 — Test presence checker

**Phase** 01 · Project setup and guardrails  |  **Depends on** [004](004-folder-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the tool that reports source files with no corresponding test, per the rules for each layer.

## Files

- `frontend/tool/check_tests.dart` (new)

## Contract

```dart
Future<int> main(List<String> args)  // --strict turns the report into a failure
```

## Steps

1. Require a test file for every file under domain/ and data/, and for every widget under core/widgets/.
2. Exempt barrels, generated files and presentation screens covered by an integration test.
3. Print a coverage-of-files table by layer, and fail in strict mode when a required test is missing.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/02-coding-standards.md`, `frontend/rules/13-workflow.md`.
- Checkers and guardrail tests must pass on the current tree and fail on a deliberate violation; ship a fixture proving both.
- A guardrail reports every violation it finds, with file and line, rather than stopping at the first.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Adding a domain service without a test fails the strict run.
- [ ] Tests written and passing: `frontend/test/tool/check_tests_test.dart` over a fixture tree.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
