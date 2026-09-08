# 122 — Compressed upload copy

**Phase** 05 · File storage  |  **Depends on** [119](119-file-writer.md), [033](../02-foundation/033-isolate-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Produce the reduced copy used for online analysis, leaving the original untouched.

## Files

- `frontend/lib/core/files/compressed_copy.dart` (new)

## Steps

1. Resize to the configured long edge and quality; write into .cache; return path and size.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Original files are never modified or deleted; derived copies go to `.cache`.
- Every write is atomic: temporary name, then rename, so an interruption leaves no partial file.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The original file is byte-identical before and after.
- [ ] Tests written and passing: Test comparing the original hash before and after compression.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
