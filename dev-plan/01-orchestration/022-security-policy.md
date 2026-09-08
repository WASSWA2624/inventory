# 022 — Hardcoded secret scan

**Phase** 01 · Project setup and guardrails  |  **Depends on** [004](004-folder-scaffold.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write the source scan that fails when a key, token or credential appears in the repository.

## Files

- `tool/check_secrets.dart` (new)
- `tool/secret_patterns.yaml` (new)

## Steps

1. Define patterns for provider keys, bearer tokens, private keys, connection strings and long base64 blobs.
2. Scan lib/, android/, ios/ and asset files; allow documented placeholders in test fixtures only.
3. Print file, line and the matched pattern name without echoing the secret itself.

## Constraints

- Checkers and guardrail tests must pass on the current tree and fail on a deliberate violation; ship a fixture proving both.
- A guardrail reports every violation it finds, with file and line, rather than stopping at the first.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A pasted provider key in a Dart file fails the scan.
- [ ] The scan never prints the matched secret value.
- [ ] Tests written and passing: `test/tool/check_secrets_test.dart` over fixtures for each pattern.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
