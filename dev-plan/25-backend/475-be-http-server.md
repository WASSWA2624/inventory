# 475 — HTTP server and middleware chain

**Phase** 25 · Optional team backend  |  **Depends on** [474](474-be-error-model.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Assemble the Express application with its middleware order fixed, plus health and version routes.

## Files

- `backend/src/server.ts` (new)
- `backend/src/routes/health.ts` (new)

## Steps

1. Order: request context, body limits, security headers, rate limiter, authentication, router, error handler.
2. Implement /health for liveness and a readiness check that includes the database and secret store.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/01-structure.md`, `backend/rules/02-coding-standards.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The application must remain fully usable when this server does not exist.
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A deployment does not receive traffic before it can serve it.
- [ ] Tests written and passing: Route tests for health, readiness and version.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
