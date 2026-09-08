# 474 — Typed errors and the error envelope

**Phase** 25 · Optional team backend  |  **Depends on** [473](473-be-logger.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the error hierarchy and the middleware that renders it as the single documented response envelope.

## Files

- `backend/src/domain/errors.ts` (new)
- `backend/src/middleware/error_handler.ts` (new)

## Contract

```dart
class AppError extends Error { code: ErrorCode; status: number; publicMessage: string; details?: object }
```

## Steps

1. Map each error to a status code from the API rules; never leak an internal message or stack to a client.
2. Log the cause internally with the request id while returning only the public message.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/01-structure.md`, `backend/rules/02-coding-standards.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The application must remain fully usable when this server does not exist.
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] An unexpected exception returns a 500 envelope and logs the cause once.
- [ ] Tests written and passing: Tests asserting the envelope shape and that internals never appear in a response.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
