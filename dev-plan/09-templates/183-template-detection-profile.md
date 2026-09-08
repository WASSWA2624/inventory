# 183 — Detection profile editor

**Phase** 09 · Templates  |  **Depends on** [153](153-template-model.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Configure how a template is recognised automatically.

## Files

- `lib/features/templates/presentation/detection_profile_screen.dart` (new)

## Steps

1. Edit object classes, keywords, identifier patterns, linked datasets and negative keywords.

## Constraints

- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every template carries a profile, with sensible defaults for shipped ones.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
