# 408 — Map spreadsheet columns to template fields

**Phase** 20 · Importing existing data  |  **Depends on** [173](../09-templates/173-xlsx-mapping-screen.md), [149](../09-templates/149-template-model.md)

## Goal

Reuse the mapping screen to import rows as records rather than as a template.

## Files

- `lib/features/import/presentation/record_mapping_screen.dart` (new)

## Steps

1. Require identity fields to be mapped before continuing.

## Reuse

- Reuses the workbook reader, header detection and type inference from the template phase.

## Acceptance

- [ ] The same mapping interface serves both purposes.
