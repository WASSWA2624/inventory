# 427 — Upload history

**Phase** 21 · Cloud upload  |  **Depends on** [426](426-upload-runner.md), [108](../04-data-layer/108-exports-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Record destination, file, size, time and result.

## Files

- `frontend/lib/features/cloud/presentation/upload_history_screen.dart` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/11-security-privacy.md`.
- Nothing is uploaded without an explicit per-file confirmation; credentials live only in secure storage.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
