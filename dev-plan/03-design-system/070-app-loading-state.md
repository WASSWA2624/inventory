# 070 — Loading and skeletons

**Phase** 03 · Design system  |  **Depends on** [068](068-app-empty-state.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

Skeleton placeholders instead of spinners for list and detail loads.

## Files

- `lib/core/widgets/states/app_loading_state.dart` (new)

## Contract

```dart
enum SkeletonShape { list, card, detail }
class AppSkeleton extends StatelessWidget { final SkeletonShape shape; final int count; }
```

## Steps

1. Provide list, card and detail skeletons plus a small inline spinner for actions.

## Constraints

- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Screens do not jump when data arrives.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
