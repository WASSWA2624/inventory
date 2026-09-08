# 238 — Append or replace

**Phase** 12 · Capture  |  **Depends on** [237](237-caption-scope-selector.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Choose whether the new text replaces or is appended to existing captions.

## Files

- `lib/features/capture/domain/caption_apply.dart` (new)

## Steps

1. Append adds on a new line; replace keeps the previous text recoverable from history.

## Constraints

- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Applying to seven photos writes seven independent caption rows.
- [ ] Tests written and passing: Unit test that each photo can afterwards be edited alone.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
