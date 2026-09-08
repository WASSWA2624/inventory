# 077 — Photo thumbnail

**Phase** 03 · Design system  |  **Depends on** [044](044-spacing-tokens.md), [042](042-color-tokens.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Square thumbnail with type badge, caption indicator, selection state and error placeholder.

## Files

- `lib/core/widgets/app_photo_thumb.dart` (new)

## Contract

```dart
class AppPhotoThumb extends StatelessWidget { final PhotoAsset photo; final double size; final bool selected; final VoidCallback? onTap, onLongPress; }
```

## Steps

1. Load from a cached thumbnail path; never decode a full image for a thumbnail.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Scrolling a tray of thirty photos stays smooth.
- [ ] Tests written and passing: Golden test of badge and selection states.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
