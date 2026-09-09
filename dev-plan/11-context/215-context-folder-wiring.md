# 215 — Wire context into the folder path

**Phase** 11 · Context  |  **Depends on** [208](208-context-apply-to-record.md), [118](../05-file-storage/118-photo-path-builder.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Photos land in the folder tree that matches their context.

## Files

- `frontend/lib/features/context/domain/context_folder_link.dart` (new)

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The on-disk tree mirrors the specification example exactly.
- [ ] Tests written and passing: Integration test capturing into a three-level context.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
