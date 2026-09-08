# 459 — End-to-end: bundle merge

**Phase** 24 · Testing and release  |  **Depends on** [453](453-e2e-capture-to-export.md), [402](../19-bundles-and-merge/402-merge-apply.md), [404](../19-bundles-and-merge/404-merge-undo.md)

## Goal

Export from one database, import into another, resolve a conflict, undo, redo.

## Files

- `integration_test/merge_test.dart` (new)

## Acceptance

- [ ] The test proves idempotency and a complete undo.
