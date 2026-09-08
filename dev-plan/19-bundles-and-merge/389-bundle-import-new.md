# 389 — Import as a new project

**Phase** 19 · Bundles and merge  |  **Depends on** [388](388-bundle-reader.md), [141](../08-projects/141-project-create.md)

## Goal

Bring in a project this device has never seen.

## Files

- `lib/features/merge/domain/bundle_import_new.dart` (new)

## Steps

1. Recreate the folder tree, copy files, insert rows and preserve all identifiers.

## Acceptance

- [ ] The imported project is fully editable and exportable.

## Tests

- Integration test importing an exported project.
