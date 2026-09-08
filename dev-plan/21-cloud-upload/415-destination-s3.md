# 415 — Amazon S3 and compatible stores

**Phase** 21 · Manual cloud upload  |  **Depends on** [413](413-destination-model.md), [018](../01-orchestration/018-dependency-allowlist.md)

## Goal

Configure and upload to an S3-compatible bucket with user-supplied keys.

## Files

- `lib/features/cloud/data/s3_destination.dart` (new)

## Steps

1. Fields: access key, secret, region, bucket, optional prefix, optional endpoint.

## Acceptance

- [ ] A test upload of a small file proves the configuration before any real upload.
