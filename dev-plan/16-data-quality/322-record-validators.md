# 322 — Record validators

**Phase** 16 · Validation, duplicates and verification  |  **Depends on** [321](321-field-validators.md), [164](../09-templates/164-identity-fields.md)

## Goal

Whole-record rules: required fields present, identity present, evidence present when demanded.

## Files

- `lib/core/validation/record_validators.dart` (new)

## Acceptance

- [ ] A record cannot be approved with an empty identity field when the template demands one.
