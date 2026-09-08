# 240 — Continuous scan mode

**Phase** 12 · Capture  |  **Depends on** [239](239-barcode-scanner.md)

## Goal

Keep the scanner open for stock counting, one scan per item.

## Files

- `lib/features/capture/presentation/barcode_continuous_mode.dart` (new)

## Steps

1. Debounce repeat reads of the same code; show a running count; allow undo of the last scan.

## Acceptance

- [ ] Fifty items can be counted without leaving the screen.
