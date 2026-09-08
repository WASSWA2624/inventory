# 197 — Persist and restore context

**Phase** 11 · Context fields  |  **Depends on** [195](195-context-model.md), [142](../08-projects/142-project-open.md)

## Goal

Context survives screen changes, app restarts and device sleep.

## Files

- `lib/features/context/data/context_persistence.dart` (new)

## Acceptance

- [ ] Reopening the app resumes the same district, facility and department.

## Tests

- Test that state reloads after a simulated restart.
