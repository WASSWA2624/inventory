# 169 — Import a template from JSON

**Phase** 09 · Templates  |  **Depends on** [168](168-template-export-json.md), [122](../05-file-storage/122-file-validation.md)

## Goal

Read a shared template, validating its schema version.

## Files

- `lib/features/templates/presentation/template_import_action.dart` (new)

## Steps

1. Reject unknown versions with a clear message rather than a partial import.
