# 090 — Template fields table

**Phase** 04 · Local database  |  **Depends on** [089](089-templates-table.md)

## Goal

Store field definitions with every attribute the capture and export engines need.

## Files

- `lib/core/db/tables/template_fields.dart` (new)

## Steps

1. Columns: fieldKey, label, type, outputColumn, required, inputMode, stickable, contextLevel, autoFill, defaultValue, options, unit, validation, lookup, refine, sortOrder.
2. Unique index on templateId plus fieldKey.

## Tests

- DAO test asserting the unique constraint.
