# Tapture

**Tap it. It's data.**

A local-first Flutter app for field data capture. Photograph or describe a thing — equipment, a building, stock, a plot, a meeting — and Tapture turns the evidence into structured records you can export as XLSX, CSV, JSON, PDF or a portable ZIP bundle.

- **Offline by default.** Capture, edit, search and export work with no network. Only the AI extraction, OCR and speech steps go online, and only when you enable them.
- **No backend, no account.** Everything lives on the device. Cloud upload happens only when you tap it.
- **Type as little as possible.** Context values persist across records, dates fill themselves, barcodes and reference data prefill the rest.
- **Nothing invented.** Raw input is kept beside the AI-refined version, and a person approves every record.
- **Anything, not just assets.** Behaviour comes from templates, so the same app inventories equipment, buildings, plants, animals, people or meetings.

## Repository layout

```text
frontend/        the Flutter application
  rules/         standardisation rules: structure, theming, responsiveness, simplicity, l10n, a11y, testing
backend/         the optional team server (post-MVP; specification Part XI)
  rules/         standardisation rules: structure, API, data, security, the relay boundary, AI proxy
dev-plan/        517 implementation prompts, in build order
app-write-up.md  the product and technical specification
```

## Documentation

- [app-write-up.md](app-write-up.md) — the full product and technical specification.
- [dev-plan/README.md](dev-plan/README.md) — how the build is sequenced, and where to start.
- [frontend/rules/](frontend/rules/) and [backend/rules/](backend/rules/) — the conventions every task obeys.

## Status

Specification and plan complete; implementation starts at dev-plan task 001. The backend is optional and deliberately
outside the first release.
