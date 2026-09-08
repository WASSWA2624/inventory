# 107 — Repository interfaces

**Phase** 04 · Local database  |  **Depends on** [004](../01-orchestration/004-architecture-rules.md), [083](083-dao-conventions.md)

## Goal

Declare the domain-facing contracts so features never see Drift types.

## Files

- `lib/features/*/domain/*_repository.dart` (new)

## Steps

1. Define interfaces for project, template, record, photo, reference, processing, export and merge repositories.

## Acceptance

- [ ] Presentation code compiles without importing the database package.
