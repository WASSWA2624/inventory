# 223 — Delete a photo

**Phase** 12 · Capture  |  **Depends on** [220](220-photo-tray.md), [068](../03-design-system/068-app-dialog-service.md), [070](../03-design-system/070-app-snackbar.md)

## Goal

Remove one photo from the session or record, with confirmation and undo.

## Files

- `lib/features/capture/presentation/photo_delete_action.dart` (new)

## Steps

1. Confirm with the destructive dialog; remove from the tray and the database; offer undo through the snackbar.
2. Keep the file until the retention purge, so undo is always possible.

## Acceptance

- [ ] Undo restores the photo in its original position with its caption and type.

## Tests

- Widget test of delete then undo.
