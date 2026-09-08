# 214 — Capture session model

**Phase** 12 · Capture  |  **Depends on** [097](../04-data-layer/097-records-table.md), [099](../04-data-layer/099-photos-table.md), [031](../02-foundation/031-uuid-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The in-progress session that holds photos, captions and typed values before and after the first save.

## Files

- `frontend/lib/features/capture/domain/capture_session.dart` (new)

## Steps

1. Model session id, template, context snapshot, photo list, captions, field values and dirty state.
2. Every mutation is a method on the controller; widgets never edit the model directly.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A session can be serialised, restored and resumed after a crash.
- [ ] Tests written and passing: Unit tests of every mutation.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
