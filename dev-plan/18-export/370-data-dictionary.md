# 370 — Data dictionary writer

**Phase** 18 · Export  |  **Depends on** [369](369-json-writer.md), [150](../09-templates/150-field-type-registry.md)

## Goal

Emit the self-describing field catalogue for downstream analysts.

## Files

- `lib/core/export/data_dictionary.dart` (new)

## Steps

1. Include key, label, type, unit, options with codes, required and description per field.

## Acceptance

- [ ] An analyst can interpret the export without the app.
