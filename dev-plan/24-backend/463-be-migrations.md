# 463 — Migration runner

**Phase** 24 · The minimal backend  |  **Depends on** [462](462-be-db-connection.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the numbered, forward-only migration runner and the test that upgrades from the previous release.

## Files

- `backend/src/db/migrate.ts` (new)
- `backend/migrations/` (new)

## Steps

1. Apply migrations in order inside a transaction, recording each in a schema history table.
2. Run migrations as an explicit step or job, never silently on every boot.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/04-data-and-migrations.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Upgrading from the last released schema preserves all rows.
- [ ] Tests written and passing: A migration test from the previous release schema with seeded data.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
