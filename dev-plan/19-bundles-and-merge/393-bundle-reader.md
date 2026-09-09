# 393 — Bundle reader and validation

**Phase** 19 · Bundles and merge  |  **Depends on** [388](388-bundle-format.md), [126](../05-file-storage/126-file-validation.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Open a bundle, verify its checksums and format version, and refuse anything suspicious.

## Files

- `frontend/lib/core/bundle/bundle_reader.dart` (new)

## Steps

1. Reject traversal paths, mismatched checksums and unknown format versions with clear messages.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/11-security-privacy.md`, `frontend/rules/12-testing.md`.
- Merge is additive, idempotent and previewed; nothing is applied before the user confirms.
- Every automatic resolution writes an audit entry naming the rule that made it.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A corrupted bundle is refused before any row is written.
- [ ] Tests written and passing: Tests over tampered fixtures.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
