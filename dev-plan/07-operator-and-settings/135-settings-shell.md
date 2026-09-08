# 135 — Settings screen shell

**Phase** 07 · Operator profile and settings  |  **Depends on** [128](../06-app-shell/128-nav-shell.md), [065](../03-design-system/065-app-list-tile.md), [066](../03-design-system/066-app-section-header.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The settings screen with the sections named in the specification, each a separate route.

## Files

- `lib/features/settings/presentation/settings_screen.dart` (new)

## Steps

1. Sections: Operator, Capture, AI, Language, Storage, Data, Security, About.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Adding a setting later means adding one tile, not restructuring.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
