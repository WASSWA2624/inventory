# 206 — Optional auto-clear timer

**Phase** 11 · Context fields  |  **Depends on** [197](197-context-persistence.md), [132](../07-operator-and-settings/132-settings-store.md)

## Goal

Optionally clear the lowest level after a period of inactivity.

## Files

- `lib/features/context/domain/context_auto_clear.dart` (new)

## Steps

1. Off by default; configurable interval; a single undo toast when it fires.

## Acceptance

- [ ] With the setting off, context never changes on its own.
