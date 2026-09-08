# 016 — Logging discipline checker

**Phase** 01 · Project setup and guardrails  |  **Depends on** [004](004-folder-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the checker that bans print statements and logging of forbidden values.

## Files

- `tool/check_logging.dart` (new)

## Steps

1. Fail on any print( or debugPrint( outside tool/ and `test/`.
2. Fail when a log call interpolates an identifier matching key, secret, token, password, credential, caption, transcript or value.
3. Require every log call to pass a level and a tag.

## Constraints

- Checkers and guardrail tests must pass on the current tree and fail on a deliberate violation; ship a fixture proving both.
- A guardrail reports every violation it finds, with file and line, rather than stopping at the first.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Logging an API key variable fails the check with the line number.
- [ ] Tests written and passing: `test/tool/check_logging_test.dart` covers each banned pattern.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
