# 244 — Preserve the raw transcript

**Phase** 12 · Capture  |  **Depends on** [243](243-voice-input-button.md), [101](../04-data-layer/101-captions-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The spoken words are stored verbatim and never overwritten by refinement.

## Files

- `frontend/lib/features/capture/domain/transcript_store.dart` (new)

## Steps

1. Store transcript, language and confidence alongside the caption row.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/06-simplicity.md`, `frontend/.rules/09-accessibility.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Refinement later writes a separate column, leaving this untouched.
- [ ] Tests written and passing: Test that refining does not alter the raw row.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
