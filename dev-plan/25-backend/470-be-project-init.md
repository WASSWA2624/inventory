# 470 — Initialise the backend project

**Phase** 25 · Optional team backend

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested TypeScript code — not a description of it.

## Implement

Create the Node and TypeScript project in backend/ with strict compiler settings and the module skeleton from the rules.

## Files

- `backend/package.json` (new)
- `backend/tsconfig.json` (new)
- `backend/src/` (new)

## Contract

```dart
npm run dev | npm run build | npm run test | npm run verify
```

## Steps

1. Enable strict, noImplicitAny, noUncheckedIndexedAccess and exactOptionalPropertyTypes; treat warnings as errors.
2. Create routes/, services/, repositories/, domain/, middleware/, jobs/, config/ and types/ with an index in each.

## Constraints

- Obey `backend/rules/`. The ones that bite here: `backend/rules/01-structure.md`, `backend/rules/02-coding-standards.md`.
- The server is transit, not truth: it never holds a durable copy of a project, never serves as backup, and never reads package content.
- Validate every input by schema, parameterise every query, and keep SQL inside repositories.
- The application must remain fully usable when this server does not exist.
- Build only what this file describes. Anything else you find becomes its own task file, never extra scope here.
- `npm run verify` green — format, lint, type check, unit, integration and contract tests — before this task closes.
- No `console.log`, no `any`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The project builds and starts, serving nothing but a health route.
- [ ] Tests written and passing: `backend/test/boot.test.ts` asserts the process starts and stops cleanly.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Type check clean, lint and formatter applied, `npm run verify` green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
