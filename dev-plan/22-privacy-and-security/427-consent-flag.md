# 427 — Consent flag for personal data

**Phase** 22 · Privacy and security  |  **Depends on** [150](../09-templates/150-field-type-registry.md), [149](../09-templates/149-template-model.md)

## Goal

A standard consent field for projects that record people.

## Files

- `lib/features/quality/domain/consent_field.dart` (new)

## Steps

1. Block export of records lacking consent when the project requires it.

## Acceptance

- [ ] Consent is recorded per record, with who recorded it and when.
