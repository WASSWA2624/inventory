# 153 — Template domain model and repository

**Phase** 09 · Templates  |  **Depends on** [093](../04-data-layer/093-templates-table.md), [094](../04-data-layer/094-template-fields-table.md), [111](../04-data-layer/111-repository-interfaces.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Immutable models for TemplateDef, FieldDef and TemplateRow plus their mappers.

## Files

- `frontend/lib/features/templates/domain/template_def.dart` (new)
- `frontend/lib/features/templates/data/template_repository_impl.dart` (new)

## Steps

1. Model every field attribute from the specification, including stickable, contextLevel, autoFill and refine.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/03-state-and-data.md`, `frontend/rules/06-simplicity.md`, `frontend/rules/08-localization.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Domain models contain no Drift or Flutter import.
- [ ] Tests written and passing: Round-trip mapper test covering every attribute.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
