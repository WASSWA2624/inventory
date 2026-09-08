# 364 — Raw and refined column pairs

**Phase** 18 · Export  |  **Depends on** [361](361-xlsx-writer.md), [297](../14-review/297-raw-refined-toggle.md)

## Goal

Emit paired columns for refined fields, as the specification describes.

## Files

- `lib/core/export/xlsx_refined_columns.dart` (new)

## Steps

1. Insert the companion column with a clear header suffix without disturbing existing mappings.

## Acceptance

- [ ] Both versions appear side by side and neither is lost.

## Tests

- Test asserting both columns and their headers.
