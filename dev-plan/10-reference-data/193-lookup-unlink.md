# 193 — Break the link on edit

**Phase** 10 · Reference data and lookups  |  **Depends on** [192](192-lookup-prefill-apply.md)

## Goal

Editing one prefilled field detaches only that field.

## Files

- `lib/features/reference/domain/lookup_unlink.dart` (new)

## Acceptance

- [ ] Editing the phone number does not detach the supplier name.
