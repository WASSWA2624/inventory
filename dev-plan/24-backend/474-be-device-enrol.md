# 474 — Device enrolment

**Phase** 24 · The minimal backend  |  **Depends on** [473](473-be-auth-middleware.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Bind a device identifier to a user account, which is what makes server-side roles meaningful.

## Files

- `backend/src/routes/devices.ts` (new)

## Steps

1. Record model, application version and enrolment time; allow an administrator to revoke a device.

## Constraints

- Obey `backend/.rules/`. The ones that bite here: `backend/.rules/05-security.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A revoked device cannot refresh a token or reach the relay.
- [ ] Tests written and passing: Tests for enrol, list and revoke.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
