# 389 — Bundle writer

**Phase** 19 · Bundles and merge  |  **Depends on** [388](388-bundle-format.md), [381](../18-export/381-zip-package.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Write a complete project bundle, streaming, with checksums.

## Files

- `frontend/lib/core/bundle/bundle_writer.dart` (new)

## Steps

1. Serialise every entity table plus files; write checksums for each entry.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/11-security-privacy.md`, `frontend/rules/12-testing.md`.
- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A bundle of two thousand photos writes without exhausting memory.
- [ ] Tests written and passing: Round-trip test writing then reading a seeded project.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
