# 082 — Widget gallery screen

**Phase** 03 · Design system  |  **Depends on** [071](071-async-value-view.md), [065](065-app-list-tile.md), [067](067-app-status-pill.md), [077](077-app-photo-thumb.md), [072](072-app-dialog-service.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

A developer screen showing every catalogue widget in every state, in all themes and widths.

## Files

- `frontend/lib/core/widgets/gallery/widget_gallery_screen.dart` (new)

## Contract

```dart
class WidgetGalleryScreen extends StatelessWidget { static const route = '/_gallery'; }
```

## Steps

1. List each component with its variants; add a theme and width switcher.
2. Rule: adding a catalogue widget without adding it here fails review.

## Constraints

- Obey `frontend/rules/`. The ones that bite here: `frontend/rules/04-theming.md`, `frontend/rules/05-responsiveness.md`, `frontend/rules/07-consistency.md`, `frontend/rules/09-accessibility.md`.
- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A developer can see the whole vocabulary in one place before building a screen.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
