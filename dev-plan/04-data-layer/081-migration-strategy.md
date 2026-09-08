# 081 — Migration strategy and schema version

**Phase** 04 · Local database  |  **Depends on** [080](080-drift-setup.md), [013](../01-orchestration/013-data-safety-rules.md)

## Goal

Establish how schema changes ship, so no later table task has to invent it.

## Files

- `lib/core/db/migrations.dart` (new)

## Steps

1. Implement the migration strategy with a version constant and per-version upgrade steps.
2. Rule: every schema change adds a step and a test; destructive changes require an export prompt first.

## Acceptance

- [ ] Upgrading from any earlier version preserves all rows.

## Tests

- Migration test from version 1 to head using a seeded database.
