# 252 — Save raw, analyse later

**Phase** 12 · Capture  |  **Depends on** [251](251-save-immediate.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The deferred path: save evidence, set status CAPTURED, run nothing.

## Files

- `lib/features/capture/domain/save_raw.dart` (new)

## Steps

1. Make no network call and no AI call of any kind.

## Constraints

- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Forty records can be captured offline in sequence with no processing.
- [ ] Tests written and passing: Integration test asserting zero outbound calls.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
