# Brand kit — Learn With Willow

Reusable identity assets. The character art is **placeholder** until Willow's real
photos arrive (see [`../../INTAKE.md`](../../INTAKE.md)); the *system* (colors, fonts,
layouts) is locked.

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

## Source character art (placeholders)
- `../concept/willow-model-sheet-PLACEHOLDER.png` — Willow, 5 poses
- `../concept/willow-face-PLACEHOLDER.png` — Willow hero face (logo/thumbnail)
- `../concept/daisy-model-sheet-PLACEHOLDER.png` — Daisy (5-yo's character), 3 poses
- `../concept/leo-model-sheet-PLACEHOLDER.png` — Leo (7-yo's character), 3 poses
- `../concept/ep001-count-to-5-frame-PLACEHOLDER.png` — sample episode frame

## Music
- `../music/willow-nursery-bed-60s.mp3` — 60s loopable nursery instrumental bed
  (xylophone/glockenspiel/ukulele). Reuse under narration at ~ -16 dB (see the skill's
  `edit_audio_mix`). Generate per-episode song hooks with `generate_music` as needed.
