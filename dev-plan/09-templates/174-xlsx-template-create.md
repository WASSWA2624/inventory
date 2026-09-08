# 174 — Create a template from the mapping

**Phase** 09 · Templates  |  **Depends on** [173](173-xlsx-mapping-screen.md), [149](149-template-model.md), [112](../05-file-storage/112-project-folder-service.md)

## Goal

Persist the template and copy the original workbook, unmodified, into templates/.

## Files

- `lib/features/templates/data/xlsx_template_import.dart` (new)

## Steps

1. Store sheet name, header row and column letters for export fidelity.

## Acceptance

- [ ] The original file on disk is byte-identical to the one the user chose.

## Tests

- Hash comparison test before and after import.
