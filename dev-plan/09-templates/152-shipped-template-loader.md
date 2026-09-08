# 152 — Shipped template loader

**Phase** 09 · Templates  |  **Depends on** [151](151-shipped-templates-assets.md)

## Goal

Load the library, list it, and copy an entry into a project.

## Files

- `lib/features/templates/data/shipped_template_loader.dart` (new)

## Steps

1. Copying creates an editable project-owned template; the asset is never mutated.

## Acceptance

- [ ] Editing a copied template cannot affect the library.
