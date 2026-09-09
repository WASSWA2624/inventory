# 493 — Contract tests against the specification

**Phase** 24 · The minimal backend  |  **Depends on** [492](492-be-openapi.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Run the OpenAPI document against the running server so drift fails the build.

## Files

- `backend/test/contract/` (new)

## Constraints

- Obey `backend/.rules/`. The ones that bite here: `backend/.rules/03-api-design.md`, `backend/.rules/09-testing.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A route that changes shape without updating the document fails continuous integration.
- [ ] Tests written and passing: The contract suite runs green against the running server, and fails when a
      route is changed without the document.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
