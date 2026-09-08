# 128 — Adaptive navigation shell

**Phase** 06 · Application shell  |  **Depends on** [127](127-router-setup.md), [050](../03-design-system/050-responsive-builder.md), [052](../03-design-system/052-app-page.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The four-destination shell: bottom bar on compact, rail on medium, rail plus list pane on expanded.

## Files

- `lib/app/nav_shell.dart` (new)

## Steps

1. Destinations: Projects, Capture, Records, More, with Capture visually dominant.
2. Preserve each tab's navigation stack across switches.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Rotating a tablet moves the navigation without losing state.
- [ ] Tests written and passing: Widget test at three widths.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
