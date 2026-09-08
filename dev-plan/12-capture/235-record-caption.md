# 235 — Record caption field

**Phase** 12 · Capture  |  **Depends on** [216](216-capture-screen.md), [056](../03-design-system/056-app-text-field.md), [101](../04-data-layer/101-captions-table.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The main description of the item, typed or spoken, stored raw.

## Files

- `lib/features/capture/presentation/record_caption_field.dart` (new)

## Steps

1. Persist as the raw caption immediately; never send it anywhere on its own.

## Constraints

- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Text survives backgrounding without an explicit save.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
