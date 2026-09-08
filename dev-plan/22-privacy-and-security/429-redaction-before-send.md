# 429 — Redact regions before sending

**Phase** 22 · Privacy and security  |  **Depends on** [118](../05-file-storage/118-compressed-copy.md), [221](../12-capture/221-photo-viewer.md)

## Goal

Let the user mark regions to be obscured in the copy sent for analysis.

## Files

- `lib/features/capture/presentation/redaction_editor.dart` (new)

## Steps

1. Apply redaction to the derived copy only; mark the photo as redacted-on-send.

## Acceptance

- [ ] A marked region cannot reach a provider.

## Tests

- Test asserting the sent copy differs from the original in the marked region.
