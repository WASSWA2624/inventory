# 320 — Validation engine

**Phase** 16 · Validation, duplicates and verification  |  **Depends on** [150](../09-templates/150-field-type-registry.md), [025](../02-foundation/025-result-and-failures.md)

## Goal

One engine that validates a value, a record and an export set, used everywhere.

## Files

- `lib/core/validation/validation_engine.dart` (new)

## Steps

1. Return structured results with field key, severity and a plain-language message.
2. Separate errors, which block, from warnings, which do not.

## Acceptance

- [ ] Capture, review, import and export all call this one engine.

## Tests

- Unit tests per rule type.
