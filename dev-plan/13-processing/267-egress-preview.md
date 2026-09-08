# 267 — Data egress preview

**Phase** 13 · Processing pipeline  |  **Depends on** [264](264-provider-registry.md), [068](../03-design-system/068-app-dialog-service.md)

## Goal

Before the first online call of a session, show exactly what will be sent.

## Files

- `lib/features/processing/presentation/egress_preview_dialog.dart` (new)

## Steps

1. State image count, approximate size, and that captions and field names are included.

## Acceptance

- [ ] A user can decline and continue working offline.
