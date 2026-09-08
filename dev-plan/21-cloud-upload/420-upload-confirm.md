# 420 — Upload confirmation

**Phase** 21 · Manual cloud upload  |  **Depends on** [414](414-destination-list.md), [068](../03-design-system/068-app-dialog-service.md)

## Goal

Show file, size and destination folder, and require an explicit tap.

## Files

- `lib/features/cloud/presentation/upload_confirm_sheet.dart` (new)

## Steps

1. Confirm every upload, every time; no remembered blanket consent.

## Acceptance

- [ ] No bytes leave the device without this confirmation.

## Tests

- Test that cancelling performs no request.
