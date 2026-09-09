# 489 — Rate limiting

**Phase** 24 · The minimal backend  |  **Depends on** [460](460-be-http-server.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Apply global and endpoint-specific limits, strictest on authentication and relay upload.

## Files

- `backend/src/middleware/rate_limit.ts` (new)

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/01-structure.md`, `backend/rules/02-coding-standards.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Exceeding a limit returns 429 with a retry hint and logs a security event.
- [ ] Tests written and passing: Tests per limited endpoint.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
