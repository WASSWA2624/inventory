# 141 — Create a project

**Phase** 08 · Projects  |  **Depends on** [139](139-project-model.md), [074](../03-design-system/074-app-form-scaffold.md), [112](../05-file-storage/112-project-folder-service.md)

## Goal

A short form that creates the row and the folder tree in one transaction.

## Files

- `lib/features/projects/presentation/project_create_screen.dart` (new)

## Steps

1. Fields: name, optional description and organisation; everything else defaulted.
2. Create the folder tree and the default context definition in the same transaction.

## Acceptance

- [ ] A project exists and is ready for capture after one screen.

## Tests

- Test that a failed folder creation rolls back the row.
