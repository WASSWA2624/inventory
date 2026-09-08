# 118 — Context-based photo path builder

**Phase** 05 · File storage  |  **Depends on** [117](117-path-sanitizer.md), [116](116-project-folder-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Build the photo folder path from the context hierarchy in force.

## Files

- `lib/core/files/photo_path_builder.dart` (new)

## Steps

1. Compose photos/<level1>/<level2>/<level3>/ from sanitised context values, falling back to _unfiled.
2. Support the alternative folder strategies: by template, by capture date, flat.

## Constraints

- Original files are never modified or deleted; derived copies go to `.cache`.
- Every write is atomic: temporary name, then rename, so an interruption leaves no partial file.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The tree on disk matches the specification example exactly.
- [ ] Tests written and passing: Unit tests for each strategy and for missing context.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
