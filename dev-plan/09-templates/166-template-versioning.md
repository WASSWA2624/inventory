# 166 — Template version bump

**Phase** 09 · Templates  |  **Depends on** [149](149-template-model.md), [081](../04-data-layer/081-migration-strategy.md)

## Goal

Editing a template creates a new version, leaving captured records on theirs.

## Files

- `lib/features/templates/domain/template_versioning.dart` (new)

## Steps

1. Bump on any structural change; record what changed between versions.

## Acceptance

- [ ] Old records still render and export correctly after an edit.

## Tests

- Test that a record keeps its captured version.
