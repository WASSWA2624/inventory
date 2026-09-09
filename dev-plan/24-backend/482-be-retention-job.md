# 482 — Relay package purge job

**Phase** 24 · The minimal backend  |  **Depends on** [480](480-be-relay-ack.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the scheduled job that deletes expired packages unconditionally, and prove it with a controlled clock.

## Files

- `backend/src/jobs/purge.ts` (new)

## Contract

```ts
runPurge(now: Date): Promise<PurgeReport>
```

## Steps

1. Delete every package past its expiry whether acknowledged or not; enforce the hard maximum window in code.
2. Record counts, ages and bytes reclaimed; expose them as metrics and an administrator report.

## Constraints

- Obey `backend/.rules/`. The ones that bite here: `backend/.rules/06-relay-and-retention.md`, `backend/.rules/08-observability.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Relay is the backend's one **optional** capability (§72): an organisation that never enables it must still have a complete, fully working product.
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Advancing the clock past the window removes packages that no device ever fetched.
- [ ] Tests written and passing: Tests driving the injected clock across acknowledgement and expiry paths.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
