# 157 — Shipped template loader

**Phase** 09 · Templates  |  **Depends on** [155](155-shipped-templates-assets.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Load the library, list it, and copy an entry into a project.

## Files

- `frontend/lib/features/templates/data/shipped_template_loader.dart` (new)

## Steps

1. Copying creates an editable project-owned template; the asset is never mutated.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Editing a copied template cannot affect the library.
- [ ] Tests written and passing: Repository tests for `shipped_template_loader.dart` against an in-memory database, plus the fake later tests use.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
