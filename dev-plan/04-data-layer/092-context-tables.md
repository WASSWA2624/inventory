# 092 — Context definition and state tables

**Phase** 04 · Local database  |  **Depends on** [088](088-projects-table.md)

## Goal

Store the context hierarchy of a project and the values currently pinned.

## Files

- `lib/core/db/tables/context.dart` (new)

## Steps

1. Definitions: level, fieldKey, label. State: projectId, level, value, setAt.
2. Add a presets table: name, projectId, values JSON.

## Tests

- DAO test that setting a higher level clears lower levels.
