# 251 — Capture and analyse

**Phase** 12 · Capture  |  **Depends on** [215](215-capture-session-controller.md), [103](../04-data-layer/103-jobs-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Save the record and queue it for immediate processing.

## Files

- `lib/features/capture/domain/save_and_analyse.dart` (new)

## Steps

1. Persist everything first, then enqueue; if enqueueing fails the record still exists.

## Constraints

- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Losing connectivity between save and enqueue never loses the record.
- [ ] Tests written and passing: Test that a failed enqueue leaves a complete CAPTURED record.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
