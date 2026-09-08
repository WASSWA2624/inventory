# 472 — Configuration loading and validation

**Phase** 25 · Optional team backend  |  **Depends on** [470](470-be-project-init.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Write the typed configuration module that reads the environment once, validates it and fails boot on anything missing.

## Files

- `backend/src/config/index.ts` (new)

## Contract

```dart
export const config: AppConfig;  // throws at import time on invalid environment
```

## Steps

1. Declare a schema for every variable with its default, requirement and description.
2. Export typed values; forbid process.env access anywhere else in the codebase by lint rule.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/01-structure.md`, `backend/rules/02-coding-standards.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The application must remain fully usable when this server does not exist.
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A missing secret stops the process at boot with a message naming the variable.
- [ ] Tests written and passing: Unit tests over valid, missing and malformed environments.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
