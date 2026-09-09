# 426 — Upload with progress and resume

**Phase** 21 · Cloud upload  |  **Depends on** [425](425-upload-confirm.md), [033](../02-foundation/033-isolate-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Upload large archives reliably, with progress, cancel and resume.

## Files

- `frontend/lib/features/cloud/domain/upload_runner.dart` (new)

## Steps

1. Chunk large files where the provider supports it; retry transient failures with backoff.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/11-security-privacy.md`.
- Nothing is uploaded without an explicit per-file confirmation; credentials live only in secure storage.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A failed upload changes nothing locally and can be retried.
- [ ] Tests written and passing: Unit tests of `upload_runner.dart`, with no Flutter binding.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
