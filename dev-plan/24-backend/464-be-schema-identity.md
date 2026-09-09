# 464 — Schema: organisations, users and devices

**Phase** 24 · The minimal backend  |  **Depends on** [463](463-be-migrations.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the first migration: organisations, users, enrolled devices.

## Files

- `backend/migrations/001_identity.sql` (new)

## Steps

1. Users carry email, password hash, role, organisation and status. Devices carry the device identifier, user, enrolled time and last seen.
2. Unique constraints on email per organisation and on device identifier.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/04-data-and-migrations.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: Repository integration tests for creation and lookup.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
