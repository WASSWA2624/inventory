# 020 — Repository hygiene

**Phase** 02 · Project foundation  |  **Depends on** [019](019-flutter-project-init.md)

## Goal

Keep generated and secret material out of git from the first commit.

## Files

- `.gitignore` (edit)
- `.editorconfig` (new)

## Steps

1. Ignore build output, .dart_tool, generated Drift and freezed files if they are not committed, local keys and sample bundles.
2. Add editorconfig for line endings and indentation to stop cross-platform churn.

## Acceptance

- [ ] A clean checkout produces no untracked noise after a build.
