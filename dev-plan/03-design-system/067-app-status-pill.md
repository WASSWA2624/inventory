# 067 — Status pill and badge

**Phase** 03 · Design system  |  **Depends on** [042](042-color-tokens.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Render record and job status with colour plus icon plus text.

## Files

- `frontend/lib/core/widgets/app_status_pill.dart` (new)

## Contract

```dart
class AppStatusPill extends StatelessWidget { final RecordStatus status; }
abstract final class StatusStyle { static (Color, IconData, String) of(RecordStatus s); }
```

## Steps

1. Map every status in the lifecycle to a pill; never rely on colour alone.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/04-theming.md`, `frontend/.rules/05-responsiveness.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/09-accessibility.md`.
- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A colour-blind user can still read status.
- [ ] Tests written and passing: Golden test of every status.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
