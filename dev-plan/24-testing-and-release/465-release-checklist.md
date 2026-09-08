# 465 — Release checklist

**Phase** 24 · Testing and release  |  **Depends on** [464](464-release-build.md), [432](../22-privacy-and-security/432-secret-scan-test.md), [459](459-e2e-merge.md)

## Goal

The gate before any build reaches a user.

## Files

- `dev-plan/24-testing-and-release/_release_checklist.md` (new)

## Steps

1. Items: suites green, secret scan clean, migrations tested from the previous version, offline run verified, export opened in a real spreadsheet, storage and permission prompts reviewed.

## Acceptance

- [ ] No build ships with an unticked box.
