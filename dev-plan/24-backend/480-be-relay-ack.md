# 480 — Relay: acknowledge and delete

**Phase** 24 · The minimal backend  |  **Depends on** [479](479-be-relay-fetch.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Implement acknowledgement, and delete the package in the same transaction once every enrolled device has acknowledged it.

## Files

- `backend/src/routes/relay/ack.ts` (new)
- `backend/src/services/relay/purge_decision.ts` (new)

## Steps

1. Compute completeness against currently enrolled devices; record the acknowledgement; delete when complete.

## Constraints

- Obey `backend/.rules/`. The ones that bite here: `backend/.rules/06-relay-and-retention.md`, `backend/.rules/03-api-design.md`, `backend/.rules/05-security.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Relay is the backend's one **optional** capability (§72): an organisation that never enables it must still have a complete, fully working product.
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A fully acknowledged package is gone immediately, not at the next job run.
- [ ] Tests written and passing: Tests for partial acknowledgement, completion and idempotent replay.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
