# 239 — Barcode and QR scanner

**Phase** 12 · Capture  |  **Depends on** [212](212-camera-permission-flow.md), [018](../01-orchestration/018-dependency-allowlist.md)

## Goal

Scan the symbologies listed in the specification, fast and one-handed.

## Files

- `lib/features/capture/presentation/barcode_scanner_screen.dart` (new)

## Steps

1. Show a scan region, torch toggle and the decoded value with a confirm action.

## Acceptance

- [ ] A worn label still scans within a couple of seconds.
