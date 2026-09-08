# 151 — Shipped template assets

**Phase** 09 · Templates  |  **Depends on** [149](149-template-model.md)

## Goal

Author the shipped library as versioned JSON assets.

## Files

- `assets/templates/` (new)

## Steps

1. Write one JSON file per shipped template listed in the specification, using stable field keys.
2. Include a schema version so the loader can migrate old copies.

## Acceptance

- [ ] The library covers equipment, medical equipment, building, room, vehicle, furniture, ICT, stock, inspection, meeting, person, land, plant, livestock and generic item.

## Tests

- Test that every asset parses and validates.
