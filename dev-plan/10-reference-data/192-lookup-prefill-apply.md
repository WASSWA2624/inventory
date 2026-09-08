# 192 — Apply a lookup prefill

**Phase** 10 · Reference data and lookups  |  **Depends on** [191](191-lookup-multi-match.md), [094](../04-data-layer/094-record-fields-table.md)

## Goal

Fill the mapped fields, marked as lookup-sourced and linked to the row.

## Files

- `lib/features/reference/domain/lookup_prefill.dart` (new)

## Steps

1. Write source LOOKUP with the dataset row id in provenance; never overwrite a verified value.

## Acceptance

- [ ] Filled fields show the link affordance and remain editable.

## Tests

- Test that a verified field is left alone.
