# 004 — Create the folder skeleton

**Phase** 01 · Project setup and guardrails  |  **Depends on** [003](003-strict-lints.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Create every directory the architecture requires, each with a barrel file, so no later task invents a location.

## Files

- `lib/app/` (new)
- `lib/core/` (new)
- `lib/features/` (new)
- `tool/paths.dart` (new)

## Steps

1. Create app/, and core/ with db, files, ai, export, import, merge, validation, normalise, security, errors, logging, time, ids, hash, concurrency, network, permissions, device, feedback, copy and widgets.
2. Create features/ with one folder per feature named in the plan, each containing empty data/, domain/ and presentation/ directories.
3. Write `tool/paths.dart` exporting the canonical directory list as constants, so guardrail checkers read the structure from one place rather than hardcoding paths.

## Constraints

- Checkers and guardrail tests must pass on the current tree and fail on a deliberate violation; ship a fixture proving both.
- A guardrail reports every violation it finds, with file and line, rather than stopping at the first.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every directory named in the plan exists and contains a barrel file.
- [ ] Tests written and passing: `tool/check_structure.dart` fails when a required directory is missing or an unexpected top-level directory appears.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
