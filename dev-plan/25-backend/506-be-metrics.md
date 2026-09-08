# 506 — Metrics endpoint

**Phase** 25 · Optional team backend  |  **Depends on** [497](497-be-retention-job.md), [502](502-be-ai-quota.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Expose the counters that reveal whether the boundary is holding.

## Files

- `backend/src/routes/metrics.ts` (new)

## Steps

1. Request rate, latency, errors, packages stored, acknowledged and purged, storage bytes, AI requests and cost, authentication failures.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/08-observability.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The application must remain fully usable when this server does not exist.
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Storage growing while purge counts stay flat is visible immediately.
- [ ] Tests written and passing: Tests asserting each counter moves for its event.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
