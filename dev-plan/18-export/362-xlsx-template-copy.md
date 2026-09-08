# 362 — Write into a copy of the original workbook

**Phase** 18 · Export  |  **Depends on** [361](361-xlsx-writer.md), [174](../09-templates/174-xlsx-template-create.md)

## Goal

Preserve the client's formatting by writing into a copy, never the original.

## Files

- `lib/core/export/xlsx_template_copy.dart` (new)

## Steps

1. Copy the stored template file, then write rows into the mapped sheet and columns.
2. Report in the export summary anything the library could not preserve.

## Acceptance

- [ ] The stored template file is byte-identical after every export.

## Tests

- Hash test of the template before and after.

## Notes

- Validate the chosen library against a real client workbook before committing to it.
