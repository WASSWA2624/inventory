# 065 — List tile

**Phase** 03 · Design system  |  **Depends on** [046](046-theme-assembly.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One row widget: leading, title, subtitle, trailing, status pill, long-press support.

## Files

- `lib/core/widgets/app_list_tile.dart` (new)

## Contract

```dart
class AppListTile extends StatelessWidget { final Widget? leading, trailing; final String title; final String? subtitle; final AppStatusPill? status; final bool dense, selected; final VoidCallback? onTap, onLongPress; }
```

## Steps

1. Support dense and comfortable densities and selection state for multi-select lists.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Projects, records, templates and datasets use the same row.
- [ ] Tests written and passing: Golden test of the row variants.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
