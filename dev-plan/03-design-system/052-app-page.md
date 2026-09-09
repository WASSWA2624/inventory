# 052 — Page scaffold

**Phase** 03 · Design system  |  **Depends on** [046](046-theme-assembly.md), [051](051-content-constraint.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The standard page frame: title, actions, safe areas, scroll behaviour and error boundary.

## Files

- `frontend/lib/core/widgets/app_page.dart` (new)

## Contract

```dart
class AppPage extends StatelessWidget { final String title; final String? subtitle; final List<Widget> actions; final Widget body; final Widget? footer; final Future<void> Function()? onRefresh; }
```

## Steps

1. Compose app bar, optional subtitle line, body slot, footer action slot and pull-to-refresh hook.
2. Apply the content constraint and the responsive padding automatically.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/04-theming.md`, `frontend/.rules/05-responsiveness.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/09-accessibility.md`.
- Colours, spacing, radii, durations and text styles come from tokens only — never literals.
- Minimum 48dp tap target, a semantic label on every interactive element, and no clipping at 200 percent text scale.
- Add the component to the widget gallery and give it a golden test in light, dark and outdoor themes.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] Every screen in later phases uses this and none builds its own Scaffold.
- [ ] Tests written and passing: Golden test in both themes and three widths.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Anything not named above. Raise it as its own task rather than widening this one.
