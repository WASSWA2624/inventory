# 488 — Timeouts, retries and circuit breaker

**Phase** 24 · The minimal backend  |  **Depends on** [486](486-be-ai-proxy.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Bound every provider call and fail in a way the device can queue and retry.

## Files

- `backend/src/services/ai/resilience.ts` (new)

## Steps

1. Per-call timeout, backoff for transient failures, breaker that opens on sustained failure.

## Constraints

- Obey `backend/.rules/`. The ones that bite here: `backend/.rules/07-ai-proxy.md`, `backend/.rules/05-security.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A dead provider returns a typed, queueable error within the timeout rather than hanging a field device.
- [ ] Tests written and passing: Tests for timeout, retry and breaker transitions with a fake provider.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
