# 416 — Google Drive

**Phase** 21 · Manual cloud upload  |  **Depends on** [413](413-destination-model.md), [018](../01-orchestration/018-dependency-allowlist.md)

## Goal

Sign in with the user's own account and upload to a chosen folder.

## Files

- `lib/features/cloud/data/google_drive_destination.dart` (new)

## Steps

1. Request the narrowest scope that permits creating files in the chosen folder.

## Acceptance

- [ ] The app never reads the user's other Drive content.
