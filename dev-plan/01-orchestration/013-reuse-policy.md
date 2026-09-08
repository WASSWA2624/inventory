# 013 — Design-token enforcement test

**Phase** 01 · Project setup and guardrails  |  **Depends on** [004](004-folder-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the test that fails when feature code hardcodes a colour, spacing value, radius, duration or text style.

## Files

- `test/architecture/tokens_test.dart` (new)

## Steps

1. Scan `lib/features/` for Color(, Colors., EdgeInsets.all( with a literal, BorderRadius.circular( with a literal, Duration( and TextStyle(.
2. Allow these constructs only under `lib/app/theme/` and `lib/core/widgets/`.
3. Emit the token that should have been used in each violation message.

## Constraints

- Checkers and guardrail tests must pass on the current tree and fail on a deliberate violation; ship a fixture proving both.
- A guardrail reports every violation it finds, with file and line, rather than stopping at the first.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A literal colour added to a feature widget fails the test.
- [ ] The same literal inside the theme folder passes.
- [ ] Tests written and passing: The test, with fixtures for an allowed and a forbidden location.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
