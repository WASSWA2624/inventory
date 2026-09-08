# 505 — Audit and security event recording

**Phase** 25 · Optional team backend  |  **Depends on** [482](482-be-schema-audit.md), [490](490-be-permissions.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Record every administrative and security-relevant action in the append-only log.

## Files

- `backend/src/services/audit.ts` (new)

## Steps

1. Cover user creation, role change, key rotation, retention change, relay enablement, device revocation and purge runs.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/08-observability.md`, `backend/rules/05-security.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The application must remain fully usable when this server does not exist.
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every privileged action is attributable to an actor and a time.
- [ ] Tests written and passing: Tests asserting one row per action with actor, target and outcome.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
