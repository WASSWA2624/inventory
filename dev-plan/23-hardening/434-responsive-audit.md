# 434 — Responsive audit

**Phase** 23 · Hardening  |  **Depends on** [010](../01-orchestration/010-responsiveness-policy.md), [124](../06-app-shell/124-nav-shell.md)

## Goal

Walk every screen at compact, medium and expanded widths and fix what breaks.

## Files

- `test/responsive/` (new)

## Steps

1. Check overflow, truncation, two-pane behaviour and reachability of primary actions.

## Acceptance

- [ ] No screen overflows or hides its primary action at any supported width.

## Tests

- Widget tests capturing each screen at three widths.
