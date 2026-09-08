# 464 — Release build configuration

**Phase** 24 · Testing and release  |  **Depends on** [447](../23-hardening/447-branding-assets.md), [462](462-ci-pipeline.md)

## Goal

Signing, shrinking, split ABIs and a reproducible build command.

## Files

- `android/app/build.gradle` (edit)

## Steps

1. Document the signing key handling; never commit a keystore.

## Acceptance

- [ ] A release build is produced from one documented command.
