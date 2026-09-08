# 143 — Project home screen

**Phase** 08 · Projects  |  **Depends on** [142](142-project-open.md), [060](../03-design-system/060-app-card.md), [127](../06-app-shell/127-status-line.md)

## Goal

The screen that answers "what should I do next" with one dominant action.

## Files

- `lib/features/projects/presentation/project_home_screen.dart` (new)

## Steps

1. Show counts, the current context, and Continue capturing as the primary action.
2. Secondary row: Review, Process, Export, Share, each with its pending count.

## Acceptance

- [ ] Every number on the screen is tappable and leads to the matching list.
