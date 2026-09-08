# 216 — Capture screen shell

**Phase** 12 · Capture  |  **Depends on** [215](215-capture-session-controller.md), [052](../03-design-system/052-app-page.md), [203](../11-context/203-context-bar.md), [055](../03-design-system/055-app-primary-action.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Assemble the screen from the specification: context bar, photo tray, caption, identifier, two save actions.

## Files

- `frontend/lib/features/capture/presentation/capture_screen.dart` (new)

## Steps

1. Lay out for compact first; on medium and expanded show the tray and form side by side.
2. Both primary actions are reachable with one thumb on a phone.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/06-simplicity.md`, `frontend/rules/09-accessibility.md`, `frontend/rules/10-performance.md`, `frontend/rules/11-security-privacy.md`.
- Nothing blocks capture: no network call, no AI call, no long computation on the UI thread.
- Persist immediately — a crash may lose at most the last keystroke.
- Raw photos, captions and transcripts are append-only.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Nothing on the screen is mandatory except one piece of evidence.
- [ ] Tests written and passing: Widget test at three widths.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
