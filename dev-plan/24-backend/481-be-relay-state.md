# 481 — Relay: version vector state

**Phase** 24 · The minimal backend  |  **Depends on** [480](480-be-relay-ack.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Expose the version vectors and queue state a device needs to know what to send and what to expect.

## Files

- `backend/src/routes/relay/state.ts` (new)

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/06-relay-and-retention.md`, `backend/rules/03-api-design.md`, `backend/rules/05-security.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Relay is the backend's one **optional** capability (§72): an organisation that never enables it must still have a complete, fully working product.
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Tests written and passing: Tests asserting the vectors returned match what was pushed and acknowledged.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
