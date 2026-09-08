# 037 — Lifecycle observer

**Phase** 02 · Project foundation  |  **Depends on** [023](023-app-bootstrap.md)

## Goal

React to background and resume so in-progress capture is flushed and locks re-engage.

## Files

- `lib/core/lifecycle/lifecycle_observer.dart` (new)

## Steps

1. Emit lifecycle events; flush pending writes on pause; re-arm the app lock on resume.

## Acceptance

- [ ] Backgrounding during capture never loses an unsaved photo reference.
