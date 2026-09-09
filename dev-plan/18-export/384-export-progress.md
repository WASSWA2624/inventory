# 384 — Export progress and cancellation

**Phase** 18 · Export  |  **Depends on** [383](383-export-screen.md), [076](../03-design-system/076-app-progress-steps.md), [033](../02-foundation/033-isolate-runner.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Show per-stage progress and allow cancellation without leaving partial files.

## Files

- `frontend/lib/features/exports/presentation/export_progress.dart` (new)

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/08-localization.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/12-testing.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A cancelled export leaves no half-written archive.
- [ ] Tests written and passing: Widget test of `export_progress.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
