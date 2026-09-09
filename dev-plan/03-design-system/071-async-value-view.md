# 071 — Async value view

**Phase** 03 · Design system  |  **Depends on** [070](070-app-loading-state.md), [069](069-app-error-state.md), [068](068-app-empty-state.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

One widget that renders loading, error, empty and data for any async provider.

## Files

- `frontend/lib/core/widgets/async_value_view.dart` (new)

## Contract

```dart
class AsyncValueView<T> extends StatelessWidget { final AsyncValue<T> value; final Widget Function(T) data; final Widget Function()? empty; final bool Function(T)? isEmpty; final VoidCallback? onRetry; }
```

## Steps

1. Accept builders for data and empty, defaulting the other two to the shared states.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/04-theming.md`, `frontend/.rules/05-responsiveness.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/09-accessibility.md`.
- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Feature screens contain no manual state switches.
- [ ] Tests written and passing: Widget test across all four states.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
