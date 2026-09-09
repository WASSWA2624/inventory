# branding/

The source of truth for the Tapture identity. [`BRAND.md`](BRAND.md) is the guideline; this file says which asset
to reach for and how to regenerate the set.

Everything here is drawn by [`tool/generate.py`](tool/generate.py) from one geometry definition, so the mark in the
favicon, the splash and the social card are the same shape to the unit. **Do not hand-edit an exported file** —
change the generator and re-run it.

## Contents

### `logo/`

| File                                     | Use                                                    |
| ---------------------------------------- | ------------------------------------------------------ |
| `tapture-mark.svg`                       | the symbol, Tapture Teal, on light backgrounds         |
| `tapture-mark-inverse.svg`               | the symbol in white, for dark backgrounds and photos   |
| `tapture-mark-ink.svg`                   | single-colour ink, for print and one-colour reproduction |
| `tapture-mark-currentcolor.svg`          | inherits the surrounding text colour — inline in HTML  |
| `tapture-wordmark.svg` / `-inverse`      | *Tapture* alone, drawn as outlines                     |
| `tapture-lockup-horizontal.svg` / `-inverse` | mark + wordmark, for wide spaces                   |
| `tapture-lockup-stacked.svg` / `-inverse`    | mark over wordmark, for square and tall spaces      |
| `png/`                                   | rasters of the above, at the widths named in the filename |

### `icon/`

| File                       | Use                                                                      |
| -------------------------- | ------------------------------------------------------------------------ |
| `app-icon-1024.png`        | the store and iOS master, full bleed — the input to `flutter_launcher_icons` |
| `adaptive-foreground-1024.png` | Android adaptive foreground; the mark sits inside the 66/108 safe circle |
| `adaptive-background-1024.png` | Android adaptive background                                          |
| `adaptive-monochrome-1024.png` | Android 13+ themed icon, tinted by the system                        |
| `favicon.svg`, `favicon-{32,48,180,512}.png` | web favicon and Apple touch icon                       |

The mark occupies 62 % of the adaptive canvas. That is not arbitrary: at 62 % the mark's circumradius fits inside
Android's 66/108 guaranteed-visible circle, so no bracket corner is clipped when the launcher applies a round mask.

### `splash/`

`splash-light` and `splash-dark` are the mark alone on transparency, at the proportion Flutter's native splash
expects. Set the background from the palette: `#FFFFFF` for light, `#06312F` for dark.

### `social/`

`og-image-1200.png` — 1200 × 630, for `og:image`, `twitter:image` and repository social previews.

### `palette.json`

Machine-readable colour. The ramp plus the semantic roles, and the input to dev-plan task
[042 — Colour tokens](../dev-plan/03-design-system/042-color-tokens.md).

## Regenerating

```bash
python branding/tool/generate.py
```

Writes every SVG and PNG listed above, plus `palette.json`. Pillow is needed for the rasters; the SVGs need
nothing. The run is deterministic — a clean tree after regenerating means nothing drifted.

## Where this meets the build

These are the masters. Dev-plan task
[452 — App icon, splash and store branding](../dev-plan/23-hardening/452-branding-assets.md) is what copies the
ones the app ships into `frontend/assets/branding/` and generates the per-density launcher icons. Nothing in
`frontend/` should re-draw the mark or re-declare a colour; it takes them from here.
