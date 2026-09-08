# 167 — Migrate records to a new template version

**Phase** 09 · Templates  |  **Depends on** [166](166-template-versioning.md), [068](../03-design-system/068-app-dialog-service.md)

## Goal

Show exactly what will change before moving records forward.

## Files

- `lib/features/templates/presentation/template_migration_screen.dart` (new)

## Steps

1. List fields added, removed and retyped, with affected record counts; require confirmation.

## Acceptance

- [ ] No record is migrated without the user seeing the consequences.
