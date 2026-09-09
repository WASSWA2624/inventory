# 458 — Structured logger with redaction

**Phase** 24 · The minimal backend  |  **Depends on** [457](457-be-config.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the JSON logger with levels, request identifiers and a redaction list that cannot be bypassed.

## Files

- `backend/src/observability/logger.ts` (new)

## Contract

```ts
log.info(event: string, fields: Record<string, unknown>): void
```

## Steps

1. Emit one JSON line per event with timestamp, level, request id, route, user and outcome.
2. Redact keys, tokens, package bytes, captions, transcripts and field values before serialisation.

## Constraints

- Obey `backend/.rules/`. The ones that bite here: `backend/.rules/08-observability.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The backend is required for accounts, roles and AI, and never required to be *reachable*: capture, review, editing and export must all work on the last cached session (§70.4).
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No forbidden pattern can reach the output, even when passed deliberately.
- [ ] Tests written and passing: A leak test drives representative payloads and scans the emitted lines.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
