# 165 — Required columns screen

**Phase** 09 · Templates  |  **Depends on** [162](162-field-list-editor.md), [163](163-field-add-basic.md), [164](164-field-advanced-attributes.md)

> **Implementation prompt.** Build exactly this task against the current repository state, then stop. The deliverable is working, analysed, tested Dart code — not a description of it.

## Implement

The one screen that lets a project decide, for a whole template at once, which columns it insists on. A shipped
template's requiredness is a suggestion; this screen is where the user overrules it (specification §13.2, §12.3).

## Files

- `frontend/lib/features/templates/presentation/required_columns_screen.dart` (new)
- `frontend/lib/features/templates/application/requiredness_controller.dart` (new)

## Contract

```dart
class RequirednessController {
  void set(String fieldKey, Requiredness value);
  void setHidden(String fieldKey, bool hidden);
  Future<TemplateVersion> commit();   // one version bump for the whole pass
}
```

## Steps

1. Render the template as one scrollable list: field label on the left, three radio columns — REQUIRED,
   RECOMMENDED, OPTIONAL — and a **Hide** toggle on the right.
2. Group rows by the template's field groups, with inherited groups (§13.3) collapsed by default.
3. Show the shipped default beside a changed value, so a user can see what they moved and put it back.
4. Commit the whole pass as **one** template version, not one per field (§18).
5. A hidden field leaves the capture screen and the export, and keeps every value already captured.

## Reuse

- The list rows, radios and section headers come from the design system; this screen invents no new control.
- Version bumping is the existing template versioning service, not a second implementation.

## Constraints

- Obey `frontend/.rules/`. The ones that bite here: `frontend/.rules/04-theming.md`, `frontend/.rules/06-simplicity.md`, `frontend/.rules/07-consistency.md`, `frontend/.rules/09-accessibility.md`.
- Build only what this file describes. Anything else you find becomes a new task file (`dart run tool/new_task.dart`), never extra scope here.
- `dart format` applied, `flutter analyze` clean, and `dart run tool/verify.dart --fast` green before this task closes.
- No `print`, no `TODO`, no hardcoded secret, no commented-out code left behind.

## Definition of done

- [ ] A shipped template can be re-scoped from forty suggested columns to eight required ones in a single pass.
- [ ] Changing requiredness produces exactly one new template version, and records captured under an earlier version are not marked incomplete.
- [ ] A field made REQUIRED blocks approval, never capture: an incomplete record still saves and lands in NEEDS_REVIEW.
- [ ] Tests written and passing: widget test over the three-radio grid and the hide toggle; unit test that a multi-field pass commits one version.
- [ ] Contract above is implemented exactly, with nothing else made public.
- [ ] Analyzer clean, formatter applied, guardrail suites green.

## Out of scope

- Editing anything other than requiredness and visibility — labels, types and options stay in the field editor.
- Anything not named above. Raise it as its own task rather than widening this one.
