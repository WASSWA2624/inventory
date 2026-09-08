# 371 — PDF engine and shared layout

**Phase** 18 · Export  |  **Depends on** [018](../01-orchestration/018-dependency-allowlist.md), [039](../03-design-system/039-typography-scale.md), [032](../02-foundation/032-isolate-runner.md)

## Goal

One PDF foundation: cover page, header, footer, page numbers and photo blocks.

## Files

- `lib/core/export/pdf/pdf_engine.dart` (new)

## Steps

1. Reuse the type scale and spacing tokens so reports look like the app.

## Acceptance

- [ ] Every report shares one visual language.

## Tests

- Golden test of a rendered page.
