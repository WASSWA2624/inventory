"""Tapture brand asset generator.

Every logo, icon, splash and social image in `branding/` is drawn from the
geometry defined in this one file, so a change to the mark or the palette
propagates to all of them in a single run.

    python branding/tool/generate.py

Requires Pillow for the PNG rasters. The SVG masters need nothing.
"""

from __future__ import annotations

import json
import math
from dataclasses import dataclass, field
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

# ---------------------------------------------------------------------------
# Palette
# ---------------------------------------------------------------------------
# One hue, deliberately. Red, amber and green stay reserved for danger,
# warning and success (frontend/rules/04-theming.md, FE-THEME-05), so the
# brand never competes with a status signal in the field.

PALETTE = {
    "teal-50": "#EAF7F6",
    "teal-100": "#CCEBE8",
    "teal-200": "#9BD7D2",
    "teal-300": "#63BDB6",
    "teal-400": "#31A099",
    "teal-500": "#12857D",
    "teal-600": "#0F766E",
    "teal-700": "#0C5F59",
    "teal-800": "#0A4F4A",
    "teal-900": "#073331",
    "teal-950": "#06312F",
}

TEAL = PALETTE["teal-600"]         # primary, light themes
TEAL_LIGHT = PALETTE["teal-300"]   # primary, dark themes
INK = PALETTE["teal-950"]          # brand ink, near-black
WHITE = "#FFFFFF"
ICON_TOP = "#0F7C74"               # app-icon gradient, top-left
ICON_BOTTOM = PALETTE["teal-800"]  # app-icon gradient, bottom-right

# ---------------------------------------------------------------------------
# Primitives
#
# Screen coordinates: x right, y down. Angles in degrees from the +x axis,
# increasing clockwise on screen, so 0 = right, 90 = bottom, 180 = left,
# 270 = top. An arc is drawn from a0 to a1 in the increasing direction.
# ---------------------------------------------------------------------------


def _fmt(v: float) -> str:
    return f"{v:.2f}".rstrip("0").rstrip(".")


@dataclass
class Line:
    x0: float
    y0: float
    x1: float
    y1: float
    w: float
    color: str

    def bbox(self):
        h = self.w / 2
        return (
            min(self.x0, self.x1) - h,
            min(self.y0, self.y1) - h,
            max(self.x0, self.x1) + h,
            max(self.y0, self.y1) + h,
        )

    def svg(self) -> str:
        d = f"M {_fmt(self.x0)} {_fmt(self.y0)} L {_fmt(self.x1)} {_fmt(self.y1)}"
        return (
            f'<path d="{d}" fill="none" stroke="{self.color}" '
            f'stroke-width="{_fmt(self.w)}" stroke-linecap="round"/>'
        )

    def draw(self, d, t):
        p0, p1 = t.pt(self.x0, self.y0), t.pt(self.x1, self.y1)
        w = t.length(self.w)
        d.line([p0, p1], fill=self.color, width=max(1, round(w)))
        for p in (p0, p1):
            _disc(d, p, w / 2, self.color)


@dataclass
class Arc:
    cx: float
    cy: float
    r: float
    a0: float
    a1: float
    w: float
    color: str

    def _span(self):
        a1 = self.a1
        while a1 <= self.a0:
            a1 += 360
        return self.a0, a1

    def _at(self, a):
        return (
            self.cx + self.r * math.cos(math.radians(a)),
            self.cy + self.r * math.sin(math.radians(a)),
        )

    def bbox(self):
        a0, a1 = self._span()
        pts = [self._at(a0), self._at(a1)]
        a = math.ceil(a0)
        while a <= a1:
            pts.append(self._at(a))
            a += 1
        h = self.w / 2
        xs = [p[0] for p in pts]
        ys = [p[1] for p in pts]
        return (min(xs) - h, min(ys) - h, max(xs) + h, max(ys) + h)

    def svg(self) -> str:
        a0, a1 = self._span()
        p0, p1 = self._at(a0), self._at(a1)
        large = 1 if (a1 - a0) > 180 else 0
        d = (
            f"M {_fmt(p0[0])} {_fmt(p0[1])} "
            f"A {_fmt(self.r)} {_fmt(self.r)} 0 {large} 1 "
            f"{_fmt(p1[0])} {_fmt(p1[1])}"
        )
        return (
            f'<path d="{d}" fill="none" stroke="{self.color}" '
            f'stroke-width="{_fmt(self.w)}" stroke-linecap="round"/>'
        )

    def draw(self, d, t):
        a0, a1 = self._span()
        c = t.pt(self.cx, self.cy)
        r, w = t.length(self.r), t.length(self.w)
        o = r + w / 2
        d.arc(
            [c[0] - o, c[1] - o, c[0] + o, c[1] + o],
            a0,
            a1,
            fill=self.color,
            width=max(1, round(w)),
        )
        for a in (a0, a1):
            _disc(d, t.pt(*self._at(a)), w / 2, self.color)


@dataclass
class Circle:
    """A full circle: filled when w is None, stroked otherwise."""

    cx: float
    cy: float
    r: float
    color: str
    w: float | None = None

    def bbox(self):
        h = 0 if self.w is None else self.w / 2
        return (
            self.cx - self.r - h,
            self.cy - self.r - h,
            self.cx + self.r + h,
            self.cy + self.r + h,
        )

    def svg(self) -> str:
        base = (
            f'<circle cx="{_fmt(self.cx)}" cy="{_fmt(self.cy)}" '
            f'r="{_fmt(self.r)}"'
        )
        if self.w is None:
            return base + f' fill="{self.color}"/>'
        return (
            base + f' fill="none" stroke="{self.color}" '
            f'stroke-width="{_fmt(self.w)}"/>'
        )

    def draw(self, d, t):
        c = t.pt(self.cx, self.cy)
        r = t.length(self.r)
        if self.w is None:
            _disc(d, c, r, self.color)
            return
        w = t.length(self.w)
        o = r + w / 2
        d.ellipse(
            [c[0] - o, c[1] - o, c[0] + o, c[1] + o],
            outline=self.color,
            width=max(1, round(w)),
        )


@dataclass
class RoundRect:
    x: float
    y: float
    width: float
    height: float
    r: float
    color: str

    def bbox(self):
        return (self.x, self.y, self.x + self.width, self.y + self.height)

    def svg(self) -> str:
        return (
            f'<rect x="{_fmt(self.x)}" y="{_fmt(self.y)}" '
            f'width="{_fmt(self.width)}" height="{_fmt(self.height)}" '
            f'rx="{_fmt(self.r)}" fill="{self.color}"/>'
        )

    def draw(self, d, t):
        p0 = t.pt(self.x, self.y)
        p1 = t.pt(self.x + self.width, self.y + self.height)
        d.rounded_rectangle([p0, p1], radius=t.length(self.r), fill=self.color)


def _disc(d, c, r, color):
    d.ellipse([c[0] - r, c[1] - r, c[0] + r, c[1] + r], fill=color)


@dataclass
class Transform:
    """Maps drawing units to pixels."""

    ox: float
    oy: float
    scale: float

    def pt(self, x, y):
        return ((x - self.ox) * self.scale, (y - self.oy) * self.scale)

    def length(self, v):
        return v * self.scale


def moved(shapes, dx=0.0, dy=0.0, s=1.0):
    """Copy `shapes`, scaled by `s` about the origin, then offset by dx, dy."""
    out = []
    for sh in shapes:
        if isinstance(sh, Line):
            out.append(
                Line(sh.x0 * s + dx, sh.y0 * s + dy, sh.x1 * s + dx,
                     sh.y1 * s + dy, sh.w * s, sh.color)
            )
        elif isinstance(sh, Arc):
            out.append(
                Arc(sh.cx * s + dx, sh.cy * s + dy, sh.r * s, sh.a0, sh.a1,
                    sh.w * s, sh.color)
            )
        elif isinstance(sh, Circle):
            out.append(
                Circle(sh.cx * s + dx, sh.cy * s + dy, sh.r * s, sh.color,
                       None if sh.w is None else sh.w * s)
            )
        elif isinstance(sh, RoundRect):
            out.append(
                RoundRect(sh.x * s + dx, sh.y * s + dy, sh.width * s,
                          sh.height * s, sh.r * s, sh.color)
            )
        else:
            raise TypeError(sh)
    return out


def bounds(shapes):
    boxes = [sh.bbox() for sh in shapes]
    return (
        min(b[0] for b in boxes),
        min(b[1] for b in boxes),
        max(b[2] for b in boxes),
        max(b[3] for b in boxes),
    )


# ---------------------------------------------------------------------------
# The mark
#
# Four corner brackets frame the subject, a ripple marks the tap, and a
# rounded cell at the centre is the record it becomes. Drawn on 1000 x 1000.
# ---------------------------------------------------------------------------

MARK_W = 98.0                     # bracket stroke weight
FRAME_LO, FRAME_HI = 140.0, 860.0  # frame centreline square
FRAME_R = 104.0                   # frame corner radius, centreline
ARM = 156.0                       # straight arm beyond each corner arc
RIPPLE_R, RIPPLE_W = 222.0, 44.0
CELL = 220.0                      # side of the centre cell
CELL_R = 64.0


def mark_shapes(color: str) -> list:
    lo, hi, r, w = FRAME_LO, FRAME_HI, FRAME_R, MARK_W
    a, b = lo + r, hi - r
    shapes: list = []

    corners = (
        (a, a, 180, ((lo, a, lo, a + ARM), (a, lo, a + ARM, lo))),
        (b, a, 270, ((b, lo, b - ARM, lo), (hi, a, hi, a + ARM))),
        (b, b, 0, ((hi, b, hi, b - ARM), (b, hi, b - ARM, hi))),
        (a, b, 90, ((a, hi, a + ARM, hi), (lo, b, lo, b - ARM))),
    )
    for cx, cy, a0, arms in corners:
        shapes.append(Arc(cx, cy, r, a0, a0 + 90, w, color))
        for x0, y0, x1, y1 in arms:
            shapes.append(Line(x0, y0, x1, y1, w, color))

    shapes.append(Circle(500, 500, RIPPLE_R, color, RIPPLE_W))
    shapes.append(
        RoundRect(500 - CELL / 2, 500 - CELL / 2, CELL, CELL, CELL_R, color)
    )
    return shapes


# ---------------------------------------------------------------------------
# The wordmark
#
# "Tapture" as a monoline geometric lowercase: one stroke weight throughout,
# round terminals, circles for every bowl. The same language as the mark.
# ---------------------------------------------------------------------------

STEM = 96.0
CAP_TOP = 60.0
X_TOP = 260.0
BASELINE = 760.0
DESCENDER = 970.0
BOWL_R = 202.0                     # centreline radius of the a/p/e bowls
HALF = STEM / 2
BOWL_CY = (X_TOP + BASELINE) / 2   # 510


def _g_T(x, c):
    w = 520.0
    y = CAP_TOP + HALF
    return [
        Line(x + HALF, y, x + w - HALF, y, STEM, c),
        Line(x + w / 2, y, x + w / 2, BASELINE - HALF, STEM, c),
    ], w


def _g_a(x, c):
    cx = x + HALF + BOWL_R
    return [
        Circle(cx, BOWL_CY, BOWL_R, c, STEM),
        Line(cx + BOWL_R, X_TOP + HALF, cx + BOWL_R, BASELINE - HALF, STEM, c),
    ], 2 * BOWL_R + STEM


def _g_p(x, c):
    sx = x + HALF
    return [
        Circle(sx + BOWL_R, BOWL_CY, BOWL_R, c, STEM),
        Line(sx, X_TOP + HALF, sx, DESCENDER, STEM, c),
    ], 2 * BOWL_R + STEM


def _g_t(x, c):
    left, right = 100.0, 130.0
    cx = x + HALF + left
    return [
        Line(cx, 120 + HALF, cx, BASELINE - HALF, STEM, c),
        Line(cx - left, X_TOP, cx + right, X_TOP, STEM, c),
    ], left + right + STEM


def _g_u(x, c):
    cx = x + HALF + BOWL_R
    lft, rgt = cx - BOWL_R, cx + BOWL_R
    return [
        Line(lft, X_TOP + HALF, lft, BOWL_CY, STEM, c),
        Arc(cx, BOWL_CY, BOWL_R, 0, 180, STEM, c),
        Line(rgt, X_TOP + HALF, rgt, BASELINE - HALF, STEM, c),
    ], 2 * BOWL_R + STEM


def _g_r(x, c):
    sx = x + HALF
    shoulder = 175.0
    return [
        Line(sx, X_TOP + HALF, sx, BASELINE - HALF, STEM, c),
        Arc(sx + shoulder, X_TOP + HALF + shoulder, shoulder, 180, 270, STEM, c),
    ], shoulder + STEM


def _g_e(x, c):
    cx = x + HALF + BOWL_R
    return [
        Line(cx - BOWL_R, BOWL_CY, cx + BOWL_R, BOWL_CY, STEM, c),
        Arc(cx, BOWL_CY, BOWL_R, 40, 360, STEM, c),
    ], 2 * BOWL_R + STEM


LETTERS = "Tapture"
GLYPHS = [_g_T, _g_a, _g_p, _g_t, _g_u, _g_r, _g_e]
TRACK = 44.0
# Optical corrections, added to the base tracking of each pair.
KERN = {
    ("T", "a"): -84.0,
    ("a", "p"): 14.0,
    ("p", "t"): -30.0,
    ("t", "u"): -24.0,
    ("u", "r"): -8.0,
    ("r", "e"): -34.0,
}


def wordmark_shapes(color: str) -> list:
    shapes: list = []
    x = 0.0
    for i, glyph in enumerate(GLYPHS):
        if i:
            x += TRACK + KERN.get((LETTERS[i - 1], LETTERS[i]), 0.0)
        drawn, advance = glyph(x, color)
        shapes += drawn
        x += advance
    return shapes


# ---------------------------------------------------------------------------
# Lockups
# ---------------------------------------------------------------------------


def _origin(shapes):
    x0, y0, x1, y1 = bounds(shapes)
    return moved(shapes, -x0, -y0), x1 - x0, y1 - y0


def lockup_horizontal(mark_color: str, word_color: str) -> list:
    mark, mw, mh = _origin(mark_shapes(mark_color))

    # The wordmark's cap height reads as roughly half the mark's height.
    scale = (0.52 * mh) / (BASELINE - CAP_TOP)
    word = wordmark_shapes(word_color)
    wx0, _, _, _ = bounds(word)
    gap = 0.29 * mh
    # Centre the cap-to-baseline block, not the ink: the p descender must not
    # drag the word off the mark's optical centre.
    optical_mid = ((CAP_TOP + BASELINE) / 2) * scale
    word = moved(word, mw + gap - wx0 * scale, mh / 2 - optical_mid, scale)
    return mark + word


def lockup_stacked(mark_color: str, word_color: str) -> list:
    mark, mw, mh = _origin(mark_shapes(mark_color))

    scale = (0.34 * mh) / (BASELINE - CAP_TOP)
    word = wordmark_shapes(word_color)
    wx0, wy0, wx1, _ = bounds(word)
    ww = (wx1 - wx0) * scale
    gap = 0.17 * mh
    word = moved(word, (mw - ww) / 2 - wx0 * scale, mh + gap - wy0 * scale, scale)
    return mark + word


# ---------------------------------------------------------------------------
# Output
# ---------------------------------------------------------------------------


@dataclass
class Composition:
    name: str
    shapes: list
    view: tuple                     # (x, y, w, h) in drawing units
    bg: tuple | None = None         # ("solid", colour, radius)
    #                               # ("gradient", from, to, radius)
    note: str = ""
    png: list = field(default_factory=list)   # widths in pixels
    opaque: bool = False   # drop the alpha channel: stores reject icons with one


def _svg(comp: Composition) -> str:
    x, y, w, h = comp.view
    out = [
        f'<svg xmlns="http://www.w3.org/2000/svg" '
        f'viewBox="{_fmt(x)} {_fmt(y)} {_fmt(w)} {_fmt(h)}" '
        f'width="{_fmt(w)}" height="{_fmt(h)}" role="img" aria-label="Tapture">',
        f"  <title>Tapture &#8212; {comp.note or comp.name}</title>",
    ]
    if comp.bg and comp.bg[0] == "gradient":
        out += [
            "  <defs>",
            '    <linearGradient id="tapture-bg" x1="0" y1="0" x2="1" y2="1">',
            f'      <stop offset="0" stop-color="{comp.bg[1]}"/>',
            f'      <stop offset="1" stop-color="{comp.bg[2]}"/>',
            "    </linearGradient>",
            "  </defs>",
            f'  <rect x="{_fmt(x)}" y="{_fmt(y)}" width="{_fmt(w)}" '
            f'height="{_fmt(h)}" rx="{_fmt(comp.bg[3])}" fill="url(#tapture-bg)"/>',
        ]
    elif comp.bg and comp.bg[0] == "solid":
        out.append(
            f'  <rect x="{_fmt(x)}" y="{_fmt(y)}" width="{_fmt(w)}" '
            f'height="{_fmt(h)}" rx="{_fmt(comp.bg[2])}" fill="{comp.bg[1]}"/>'
        )
    out += ["  " + sh.svg() for sh in comp.shapes]
    out.append("</svg>")
    return "\n".join(out) + "\n"


def _gradient(size, c0, c1):
    from PIL import Image

    n = 256
    a = tuple(int(c0[i:i + 2], 16) for i in (1, 3, 5))
    b = tuple(int(c1[i:i + 2], 16) for i in (1, 3, 5))
    ramp = Image.new("RGB", (n, n))
    px = ramp.load()
    for yy in range(n):
        for xx in range(n):
            t = (xx + yy) / (2 * (n - 1))
            px[xx, yy] = tuple(round(a[k] + (b[k] - a[k]) * t) for k in range(3))
    return ramp.resize(size, Image.BILINEAR).convert("RGBA")


def _png(comp: Composition, width_px: int):
    from PIL import Image, ImageDraw

    vx, vy, vw, vh = comp.view
    aspect = vh / vw
    base_w = min(4096, max(width_px * 4, 1400))
    base_h = max(1, round(base_w * aspect))
    scale = base_w / vw

    img = Image.new("RGBA", (base_w, base_h), (0, 0, 0, 0))
    if comp.bg:
        radius = comp.bg[-1] * scale
        if comp.bg[0] == "gradient":
            grad = _gradient((base_w, base_h), comp.bg[1], comp.bg[2])
            mask = Image.new("L", (base_w, base_h), 0)
            ImageDraw.Draw(mask).rounded_rectangle(
                [0, 0, base_w - 1, base_h - 1], radius=radius, fill=255
            )
            img.paste(grad, (0, 0), mask)
        else:
            ImageDraw.Draw(img).rounded_rectangle(
                [0, 0, base_w - 1, base_h - 1], radius=radius, fill=comp.bg[1]
            )

    draw = ImageDraw.Draw(img)
    transform = Transform(vx, vy, scale)
    for sh in comp.shapes:
        sh.draw(draw, transform)

    img = img.resize((width_px, max(1, round(width_px * aspect))), Image.LANCZOS)
    if comp.opaque:
        flat = Image.new("RGB", img.size, comp.bg[1] if comp.bg else "#FFFFFF")
        flat.paste(img, (0, 0), img)
        return flat
    return img


# ---------------------------------------------------------------------------
# The asset set
# ---------------------------------------------------------------------------


def _tight(shapes):
    x0, y0, x1, y1 = bounds(shapes)
    return (x0, y0, x1 - x0, y1 - y0)


def _centred_mark(canvas: float, color: str, frac: float = 0.62) -> list:
    """The mark, scaled to `frac` of a square canvas and centred in it.

    At 0.62 the mark's circumradius sits inside Android's 66/108
    guaranteed-visible circle, so no bracket corner is clipped by a round mask.
    """
    shapes = mark_shapes(color)
    x0, y0, x1, y1 = bounds(shapes)
    shapes = moved(shapes, 0, 0, (canvas * frac) / max(x1 - x0, y1 - y0))
    x0, y0, x1, y1 = bounds(shapes)
    return moved(
        shapes, (canvas - (x1 - x0)) / 2 - x0, (canvas - (y1 - y0)) / 2 - y0
    )


def compositions() -> list:
    comps: list = []

    # --- logo/ ------------------------------------------------------------
    for suffix, color, note, png in (
        ("", TEAL, "symbol", [512, 1024]),
        ("-inverse", WHITE, "symbol, for dark backgrounds", [512, 1024]),
        ("-ink", INK, "symbol, single-colour ink", []),
        ("-currentcolor", "currentColor",
         "symbol, inherits the surrounding text colour", []),
    ):
        s = mark_shapes(color)
        comps.append(
            Composition(f"logo/tapture-mark{suffix}", s, _tight(s), note=note, png=png)
        )

    for suffix, color, note in (
        ("", INK, "wordmark"),
        ("-inverse", WHITE, "wordmark, for dark backgrounds"),
    ):
        s = wordmark_shapes(color)
        comps.append(
            Composition(f"logo/tapture-wordmark{suffix}", s, _tight(s),
                        note=note, png=[2048])
        )

    for suffix, mc, wc, note in (
        ("", TEAL, INK, "horizontal lockup"),
        ("-inverse", WHITE, WHITE, "horizontal lockup, for dark backgrounds"),
    ):
        s = lockup_horizontal(mc, wc)
        comps.append(
            Composition(f"logo/tapture-lockup-horizontal{suffix}", s, _tight(s),
                        note=note, png=[2048])
        )

    for suffix, mc, wc, note in (
        ("", TEAL, INK, "stacked lockup"),
        ("-inverse", WHITE, WHITE, "stacked lockup, for dark backgrounds"),
    ):
        s = lockup_stacked(mc, wc)
        comps.append(
            Composition(f"logo/tapture-lockup-stacked{suffix}", s, _tight(s),
                        note=note, png=[1024])
        )

    # --- icon/ ------------------------------------------------------------
    c = 1024.0
    comps.append(Composition(
        "icon/app-icon", _centred_mark(c, WHITE, frac=0.68), (0, 0, c, c),
        bg=("gradient", ICON_TOP, ICON_BOTTOM, 0),
        note="app icon master, full bleed", png=[1024], opaque=True))
    comps.append(Composition(
        "icon/adaptive-foreground", _centred_mark(c, WHITE), (0, 0, c, c),
        note="Android adaptive foreground", png=[1024]))
    comps.append(Composition(
        "icon/adaptive-background", [RoundRect(0, 0, c, c, 0, ICON_BOTTOM)],
        (0, 0, c, c), bg=("gradient", ICON_TOP, ICON_BOTTOM, 0),
        note="Android adaptive background", png=[1024], opaque=True))
    comps.append(Composition(
        "icon/adaptive-monochrome", _centred_mark(c, "#000000"), (0, 0, c, c),
        note="Android themed icon, tinted by the system", png=[1024]))
    comps.append(Composition(
        "icon/favicon", _centred_mark(c, WHITE, frac=0.66), (0, 0, c, c),
        bg=("gradient", ICON_TOP, ICON_BOTTOM, 0.22 * c),
        note="favicon and touch icon", png=[32, 48, 180, 512]))

    # --- splash/ ----------------------------------------------------------
    s = 1152.0
    for suffix, color, note in (
        ("-light", TEAL, "splash mark for the light background"),
        ("-dark", TEAL_LIGHT, "splash mark for the dark background"),
    ):
        comps.append(Composition(
            f"splash/splash{suffix}", _centred_mark(s, color, frac=0.42),
            (0, 0, s, s), note=note, png=[1152]))

    # --- social/ ----------------------------------------------------------
    ow, oh = 1200.0, 630.0
    lock = lockup_horizontal(WHITE, WHITE)
    x0, y0, x1, y1 = bounds(lock)
    lock = moved(lock, 0, 0, (ow * 0.66) / (x1 - x0))
    x0, y0, x1, y1 = bounds(lock)
    lock = moved(lock, (ow - (x1 - x0)) / 2 - x0, (oh - (y1 - y0)) / 2 - y0)
    comps.append(Composition(
        "social/og-image", lock, (0, 0, ow, oh),
        bg=("gradient", ICON_TOP, ICON_BOTTOM, 0),
        note="social preview, 1200 by 630", png=[1200], opaque=True))

    return comps


def main() -> None:
    written = []
    for comp in compositions():
        svg_path = ROOT / f"{comp.name}.svg"
        svg_path.parent.mkdir(parents=True, exist_ok=True)
        svg_path.write_text(_svg(comp), encoding="utf-8")
        written.append(svg_path)

        for width in comp.png:
            if comp.name.startswith("logo/"):
                out = ROOT / "logo" / "png" / f"{Path(comp.name).name}-{width}.png"
            else:
                out = ROOT / f"{comp.name}-{width}.png"
            out.parent.mkdir(parents=True, exist_ok=True)
            _png(comp, width).save(out)
            written.append(out)

    (ROOT / "palette.json").write_text(
        json.dumps(
            {
                "name": "Tapture",
                "tagline": "Tap it. It's data.",
                "ramp": PALETTE,
                "roles": {
                    "primary.light": TEAL,
                    "primary.dark": TEAL_LIGHT,
                    "onPrimary": WHITE,
                    "ink": INK,
                    "icon.gradient": [ICON_TOP, ICON_BOTTOM],
                },
            },
            indent=2,
        )
        + "\n",
        encoding="utf-8",
    )
    written.append(ROOT / "palette.json")

    for path in written:
        print(path.relative_to(ROOT.parent).as_posix())
    print(f"\n{len(written)} files written.")


if __name__ == "__main__":
    main()
