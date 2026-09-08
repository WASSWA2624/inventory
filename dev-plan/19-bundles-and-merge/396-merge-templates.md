# 396 — Merge templates

**Phase** 19 · Bundles and merge  |  **Depends on** [392](392-merge-entity-level.md), [166](../09-templates/166-template-versioning.md)

## Goal

Resolve template differences without breaking existing records.

## Files

- `lib/features/merge/domain/merge_templates.dart` (new)

## Steps

1. Same version means no action; different versions raise a conflict offering choose one or keep both.

## Acceptance

- [ ] Records keep the template version they were captured under.
