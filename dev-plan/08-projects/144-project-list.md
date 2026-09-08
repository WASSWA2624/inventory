# 144 — Project list screen

**Phase** 08 · Projects  |  **Depends on** [143](143-project-model.md), [071](../03-design-system/071-async-value-view.md), [065](../03-design-system/065-app-list-tile.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The landing screen: projects with counts, sorted by most recently worked.

## Files

- `lib/features/projects/presentation/project_list_screen.dart` (new)

## Steps

1. Show record count, unprocessed count and last-worked time per project.
2. Empty state offers "Create a project" and "Import a bundle".

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Opening the app lands here in under two seconds.
- [ ] Tests written and passing: Widget test of loading, empty and populated states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
