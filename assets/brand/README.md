# Brand kit — Learn With Willow

Reusable identity assets, now built around the **real locked Willow**
([`../concept/willow-hero.png`](../concept/willow-hero.png)). The rendered PNGs are
committed alongside the editable HTML templates; the system (colors, fonts, layouts)
is locked.

## Palette
| Token | Hex | Use |
|-------|-----|-----|
| Teal (brand) | `#19B5A5` | Willow's bandana, accents, frames, captions highlight |
| Teal deep | `#0E8C80` | shadows, outlines on teal |
| Cream | `#FFF7E8` | backgrounds, badges |
| Ink | `#3A2E2A` | outlines, body text (warm charcoal, never pure black) |
| Sun | `#FFC94D` | headline banners, highlights |
| Apple red | `#E8514B` | numerals / pop accents |

## Type
**Fredoka** (Google Fonts, weights 600/700) — rounded, friendly, legible at phone
size. Loaded via `@import` in each template. (Alternatives: Baloo 2, Nunito.)

## Files (render any of these to PNG)
| File | What | Render at |
|------|------|-----------|
| `logo-lockup.html` | horizontal logo (Willow badge + wordmark + tagline) | 1600×520, transparent, 2× |
| `channel-avatar.html` | square profile picture for every platform | 800×800, 2× |
| `thumbnail-template.html` | reusable 16:9 thumbnail (3 swap slots marked inside) | 1280×720, 2× |

**How to render:** open in any browser and screenshot; or feed the HTML to Pika
`html_to_png` (set the viewport above, `device_scale:2`); or import to Adobe Express /
Canva. The templates reference the local placeholder face in `../concept/`; swap the
`<img src>` (and the thumbnail's 3 EDIT slots) per video / once the real Willow exists.

## Rendered output (committed PNGs)
- `willow-logo.png` — 3200×1040, transparent (horizontal lockup)
- `willow-avatar.png` — 1600×1600 (square profile pic, every platform)
- `willow-thumbnail.png` — 2560×1440 (16:9 template, "COUNT TO 5!" sample)

## Source character art (real, locked)
- `../concept/willow-hero.png` — **canonical Willow**, owner-approved (single source of truth)
- `../concept/willow-face.png` — Willow head cutout, transparent (logo + avatar badge)
- `../concept/willow-cutout.png` — full-body Willow cutout, transparent (thumbnails)
- `../concept/willow-pose-*.png` — expression kit (thinking / excited / pointing / waving / peek)
- `../concept/daisy-model-sheet-PLACEHOLDER.png`, `leo-model-sheet-PLACEHOLDER.png` —
  supporting cast, **still placeholder** (regenerate from real refs later)

## Music
- `../music/willow-nursery-bed-60s.mp3` — 60s loopable nursery instrumental bed
  (xylophone/glockenspiel/ukulele). Reuse under narration at ~ -16 dB (see the skill's
  `edit_audio_mix`). Generate per-episode song hooks with `generate_music` as needed.
