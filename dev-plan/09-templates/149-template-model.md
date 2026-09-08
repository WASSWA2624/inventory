# 149 — Template domain model and repository

**Phase** 09 · Templates  |  **Depends on** [089](../04-data-layer/089-templates-table.md), [090](../04-data-layer/090-template-fields-table.md), [107](../04-data-layer/107-repository-interfaces.md)

## Goal

Immutable models for TemplateDef, FieldDef and TemplateRow plus their mappers.

## Files

- `lib/features/templates/domain/template_def.dart` (new)
- `lib/features/templates/data/template_repository_impl.dart` (new)

## Steps

1. Model every field attribute from the specification, including stickable, contextLevel, autoFill and refine.

## Acceptance

- [ ] Domain models contain no Drift or Flutter import.

## Tests

- Round-trip mapper test covering every attribute.
