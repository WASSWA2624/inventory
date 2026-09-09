# Tapture — Brand Guidelines

**Tap it. It's data.**

Tapture turns a photograph, a sentence or a barcode into a structured record. The identity says exactly that and
nothing more: frame the thing, tap it, get a record. It is drawn for a phone held at arm's length in direct sunlight,
so every part of it survives being small, being one colour, and being printed badly.

---

## 1. The mark

Four corner brackets frame the subject. A ripple marks the tap. A rounded cell at the centre is the record it
becomes — a spreadsheet cell, because that is what comes out the other end.

```text
brackets  →  capture   (§19 Capture screen)
ripple    →  the tap   (the whole promise of the name: tap + capture)
cell      →  the data  (§49 Export formats)
```

It is a single stroke weight, round-capped, on a 1000 × 1000 grid. There is no gradient in the mark itself, no
shadow, and no detail that disappears below 24 px.

**Construction.** Frame centreline 140–860, corner radius 104, stroke 98, arms 156 past each corner arc. Ripple
r 222, stroke 44. Centre cell 220 square, radius 64. All of it lives in
[`tool/generate.py`](tool/generate.py) — change it there, never in an exported file.

### Clear space

Keep clear space of **c** on all four sides, where `c` is one quarter of the mark's height. Nothing — no text, no
rule, no photograph edge — enters that band. In the lockups the same `c` governs the gap between mark and wordmark.

### Minimum sizes

| Asset               | Minimum        | Notes                                        |
| ------------------- | -------------- | -------------------------------------------- |
| Mark                | 24 px tall     | 16 px is allowed for a favicon only          |
| Horizontal lockup   | 120 px wide    | below this, use the mark alone                |
| Stacked lockup      | 96 px wide     |                                              |
| App icon            | 48 px          | the size the icon was proportioned against    |

---

## 2. The wordmark

*Tapture* is drawn, not typed. It is a monoline geometric lowercase built from the same stroke weight and the same
round terminals as the mark: circular bowls on `a`, `p` and `e`, a single-storey `a`, a flat-cut `e` aperture at
four o'clock. Because it is outlined geometry, it needs no font installed anywhere.

Never re-set the wordmark in a typeface. Never letterspace it, condense it, or set it in capitals. The one
approved form is [`logo/tapture-wordmark.svg`](logo/tapture-wordmark.svg).

### Which lockup

| Situation                                                     | Use                          |
| ------------------------------------------------------------- | ---------------------------- |
| Anywhere the name already appears in text — app bar, store page | mark alone                   |
| Wide space: web header, letterhead, e-mail footer, README      | horizontal lockup            |
| Square or tall space: splash, poster, social avatar card       | stacked lockup               |
| App icon, launcher, favicon, notification                     | icon set (never the lockup)  |

---

## 3. Colour

**One hue, deliberately.** Red, amber and green stay reserved for `danger`, `warning` and `success`. A field worker
in bright sun reads status by colour before anything else, and the brand must never compete with that signal
(`frontend/rules/04-theming.md`, FE-THEME-05).

| Token      | Hex       | Role                                              |
| ---------- | --------- | ------------------------------------------------- |
| `teal-50`  | `#EAF7F6` | tinted surface, light theme                       |
| `teal-100` | `#CCEBE8` |                                                   |
| `teal-200` | `#9BD7D2` |                                                   |
| `teal-300` | `#63BDB6` | **primary, dark theme**; splash mark on dark      |
| `teal-400` | `#31A099` |                                                   |
| `teal-500` | `#12857D` |                                                   |
| `teal-600` | `#0F766E` | **primary, light theme** — Tapture Teal           |
| `teal-700` | `#0C5F59` | pressed state                                     |
| `teal-800` | `#0A4F4A` | app-icon gradient, bottom-right                   |
| `teal-900` | `#073331` |                                                   |
| `teal-950` | `#06312F` | **brand ink** — wordmark, dark surface            |

The app icon is the one place a gradient is allowed: `#0F7C74` top-left to `#0A4F4A` bottom-right. It gives the
tile depth on a crowded home screen without a shadow (FE-THEME-06).

The machine-readable copy is [`palette.json`](palette.json). It is the input to dev-plan task
[042 — Colour tokens](../dev-plan/03-design-system/042-color-tokens.md); the Dart token file is the only place
these values may be re-declared.

### Measured contrast

Every pairing below is computed, not estimated. All clear WCAG AA for body text (4.5:1).

| Pair                                        | Ratio     |
| ------------------------------------------- | --------- |
| White on `teal-600` (primary button)        | 5.47 : 1  |
| `teal-600` on `teal-50`                     | 4.99 : 1  |
| `teal-300` on `teal-950` (dark theme)       | 6.37 : 1  |
| `teal-950` on white (wordmark)              | 14.11 : 1 |
| White on the icon gradient, lightest stop   | 5.05 : 1  |
| White on the icon gradient, darkest stop    | 9.42 : 1  |

Outdoor theme raises contrast further and thickens outlines; it changes no geometry, so the mark is identical in
all three themes (FE-THEME-03).

---

## 4. Typography

The wordmark is the only lettering that is drawn. Everything else is set in the app's type ramp, whose roles and
sizes belong to dev-plan task [043](../dev-plan/03-design-system/043-typography-scale.md).

For brand material outside the app — store listings, documentation, slides — set text in a neutral geometric or
humanist sans at a generous size and weight. **Inter** pairs well and is metrically safe on both platforms. Do not
attempt to extend the wordmark's letterforms into body copy; they are drawn for one word at one size.

Write the tagline as **Tap it. It's data.** — sentence case, both full stops, never in capitals and never inside
the lockup as an image.

---

## 5. Misuse

Do not:

- recolour the mark outside the palette, or fill it with a photograph or gradient;
- add a shadow, glow, bevel, outline or stroke to any asset;
- rotate, skew, stretch or condense the mark, the wordmark or a lockup;
- rebuild the lockup by placing the mark next to typed text;
- place the mark on a background that drops below 3 : 1 against it — use the inverse variant instead;
- crop the mark, or use a single bracket as a standalone device;
- put the mark inside another shape, badge or ring.

On photographs, use `-inverse` over a darkened area, never the teal mark directly on imagery.

---

## 6. Naming

Fixed by §68 of [`app-write-up.md`](../app-write-up.md); repeated here so the brand and the build never drift:

```text
App display name   Tapture              (users, stores, the UI)
Repository         tapture
Package / app id   com.tapture.app      (Dart package: tapture)
Storage folder     <Documents>/Tapture/
Bundle format      tapture-bundle
Tagline            Tap it. It's data.
```

Always *Tapture* — never TapTure, Tap-ture, TAPTURE, or "the Tapture app".

Before public release the name still needs confirming on the Google Play Store and clearing by trademark search in
Uganda and the wider EAC, with the matching package id and domain secured (§68).
