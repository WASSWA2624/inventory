# 234 — Move photos to another record

**Phase** 12 · Capture  |  **Depends on** [233](233-photo-multi-select.md), [120](../05-file-storage/120-file-relocation.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Correct a mistake where photos landed on the wrong record.

## Files

- `lib/features/capture/presentation/photo_move_action.dart` (new)

## Steps

1. Move files and rows in one transaction; flag affected field values as evidence changed.

## Constraints

- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Moving photos never leaves a dangling evidence link.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
