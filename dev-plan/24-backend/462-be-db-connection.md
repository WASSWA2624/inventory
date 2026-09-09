# 462 — Database connection and pooling

**Phase** 24 · The minimal backend  |  **Depends on** [457](457-be-config.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the Postgres pool with timeouts, health reporting and graceful shutdown.

## Files

- `backend/src/db/pool.ts` (new)

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/01-structure.md`, `backend/rules/02-coding-standards.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Shutdown drains the pool without dropping an in-flight transaction.
- [ ] Tests written and passing: Integration test against an ephemeral database.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
