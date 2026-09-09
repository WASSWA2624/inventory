# 452 — App icon, splash and store branding

**Phase** 23 · Hardening  |  **Depends on** [046](../03-design-system/046-theme-assembly.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Apply the Tapture identity: icon, adaptive icon, splash and store assets.

## Files

- `frontend/assets/branding/` (new)

## Steps

1. Generate every density; keep the icon legible at 48 pixels.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/05-responsiveness.md`, `frontend/.rules/09-accessibility.md`, `frontend/.rules/10-performance.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] The icon is recognisable on a crowded home screen.
- [ ] Tests written and passing: A test asserting every declared branding asset exists at its generated
      constant path, at every density the platforms require.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
