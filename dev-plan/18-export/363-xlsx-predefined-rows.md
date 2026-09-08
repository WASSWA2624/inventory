# 363 — Write into predefined rows

**Phase** 18 · Export  |  **Depends on** [362](362-xlsx-template-copy.md), [279](../13-processing/279-row-matching.md)

## Goal

Populate the matched row rather than appending, when the template has predefined rows.

## Files

- `lib/core/export/xlsx_row_targeting.dart` (new)

## Acceptance

- [ ] Rows never found remain visibly empty or marked not found.
