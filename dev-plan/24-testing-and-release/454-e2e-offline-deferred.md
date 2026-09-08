# 454 — End-to-end: offline and deferred

**Phase** 24 · Testing and release  |  **Depends on** [453](453-e2e-capture-to-export.md), [247](../12-capture/247-save-raw.md)

## Goal

Capture forty records with the network off, process later, export.

## Files

- `integration_test/offline_deferred_test.dart` (new)

## Acceptance

- [ ] The test asserts zero outbound calls during capture.
