# 358 — Export value formatter

**Phase** 18 · Export  |  **Depends on** [150](../09-templates/150-field-type-registry.md), [278](../13-processing/278-normalise-dates.md)

## Goal

One formatter that renders any field type for any output format.

## Files

- `lib/core/export/value_formatter.dart` (new)

## Steps

1. Handle dates, numbers with units, choices with codes, booleans, multi-values and nulls consistently.
2. Never coerce identifiers to numbers; preserve leading zeros.

## Acceptance

- [ ] XLSX, CSV, JSON and PDF show the same value in the same way.

## Tests

- Table-driven tests per type and format.
