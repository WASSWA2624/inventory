# 250 — Per-project record numbering

**Phase** 12 · Capture  |  **Depends on** [249](249-auto-fields.md), [092](../04-data-layer/092-projects-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Allocate the human-facing sequence safely, even with rapid capture.

## Files

- `frontend/lib/features/capture/domain/record_number.dart` (new)

## Steps

1. Allocate inside the same transaction as the record insert to avoid gaps and collisions.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Twenty rapid captures produce twenty consecutive numbers.
- [ ] Tests written and passing: Concurrency test with parallel inserts.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
