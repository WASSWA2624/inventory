# 203 — Define the context hierarchy

**Phase** 11 · Context  |  **Depends on** [202](202-context-model.md), [162](../09-templates/162-field-list-editor.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Choose which template fields are context levels and in what order.

## Files

- `frontend/lib/features/context/presentation/context_hierarchy_screen.dart` (new)

## Steps

1. Drag to order levels; each level binds to one field key; allow zero levels.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/07-consistency.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A project with no hierarchy behaves exactly as before, with no empty bar.
- [ ] Tests written and passing: Widget test of `context_hierarchy_screen.dart`, including its empty and failure states.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
