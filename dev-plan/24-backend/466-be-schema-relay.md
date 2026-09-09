# 466 — Schema: relay packages and acknowledgements

**Phase** 24 · The minimal backend  |  **Depends on** [465](465-be-schema-projects.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the migration for package metadata, acknowledgements and version vectors, with retention columns from the start.

## Files

- `backend/migrations/003_relay.sql` (new)

## Steps

1. Packages carry id, project, author device, byte size, created, expires and storage reference — no content columns.
2. Acknowledgements record device, package and time; version vectors record project, device and revision.

## Constraints

- Obey `backend/.rules/`. The ones that bite here: `backend/.rules/04-data-and-migrations.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Relay is the backend's one **optional** capability (§72): an organisation that never enables it must still have a complete, fully working product.
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every transient row carries created and expiry columns so purge needs no special cases.
- [ ] Tests written and passing: Integration tests for insert, acknowledge and expiry queries.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
