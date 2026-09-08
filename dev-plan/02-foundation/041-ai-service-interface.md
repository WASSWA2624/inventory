# 041 — AI service interface

**Phase** 02 · Foundation services  |  **Depends on** [026](026-result-and-failures.md), [015](../01-orchestration/015-error-handling-test.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The one abstraction every provider implements, so providers are swappable.

## Files

- `frontend/lib/core/ai/ai_service.dart` (new)

## Steps

1. Declare readText, extractFields, refineText and transcribe with typed requests and results.
2. Include a null implementation that always returns unavailable, used when AI is disabled.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/01-structure.md`, `frontend/rules/02-coding-standards.md`, `frontend/rules/03-state-and-data.md`.
- Every service is an interface plus an implementation plus a fake, so later tests never touch the platform.
- Fallible calls return `Result<T>`; no raw exception crosses a layer boundary.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] No feature imports a provider SDK directly.
- [ ] Tests written and passing: Contract tests any implementation must pass.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
