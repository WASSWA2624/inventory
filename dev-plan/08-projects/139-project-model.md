# 139 — Project domain model and repository

**Phase** 08 · Projects  |  **Depends on** [088](../04-data-layer/088-projects-table.md), [107](../04-data-layer/107-repository-interfaces.md)

## Goal

The domain model, mapper and repository implementation for projects.

## Files

- `lib/features/projects/domain/project.dart` (new)
- `lib/features/projects/data/project_repository_impl.dart` (new)

## Steps

1. Model status, dates, settings and folder name; map to and from the table row.

## Acceptance

- [ ] Presentation never sees a Drift row.

## Tests

- Round-trip mapper test.
