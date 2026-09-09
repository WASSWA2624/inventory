# 492 — OpenAPI specification

**Phase** 24 · The minimal backend  |  **Depends on** [481](481-be-relay-state.md), [487](487-be-ai-quota.md), [476](476-be-users-api.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the API document that is the contract between the app and the server.

## Files

- `backend/openapi.yaml` (new)

## Steps

1. Describe every endpoint, schema, error code and limit; keep it in the same change as the route.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/03-api-design.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The document and the server never disagree, because a test proves it.
- [ ] Tests written and passing: Contract tests asserting the running server matches the document.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
