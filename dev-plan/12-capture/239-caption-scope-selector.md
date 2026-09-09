# 239 — Caption scope: this, selected, all

**Phase** 12 · Capture  |  **Depends on** [238](238-photo-caption.md), [235](235-photo-multi-select.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The explicit target selector from the specification, with the count always visible.

## Files

- `frontend/lib/features/capture/presentation/caption_scope_selector.dart` (new)

## Steps

1. Default to this photo from a single thumbnail and to selected from multi-select.
2. Show the exact counts, for example "Selected photos (3)" and "All photos (7)".

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/06-simplicity.md`, `frontend/.rules/09-accessibility.md`, `frontend/.rules/10-performance.md`, `frontend/.rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The user can never apply a caption without seeing how many photos it will touch.
- [ ] Tests written and passing: Widget test of default selection in both entry paths.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
