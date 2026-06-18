# Concept art — STYLE LOCK (placeholders)

These were generated to **lock the visual style** and prove the production pipeline.
They are **placeholders** — the puppy here is a generic cartoon dog, *not* the real
Willow. Once the real dog photos land (see [`../../INTAKE.md`](../../INTAKE.md)), we
regenerate Willow to match her actual colors/ears/markings using the master prompt in
[`../../characters/willow-character-brief.md`](../../characters/willow-character-brief.md),
and save the result as `willow-model-sheet.png` (the real, locked reference).

| File | What it shows | Use |
|------|---------------|-----|
| `willow-model-sheet-PLACEHOLDER.png` | 5 poses (sit / think / jump / point / wave), teal bandana | locks line, color, proportions, expressions |
| `ep001-count-to-5-frame-PLACEHOLDER.png` | Willow + 5 apples, 9:16, mint bg | proves the flashcard look + where number/title overlays go |

**Style confirmed by these frames:** bright flat 2D cartoon storybook, bold clean
outlines, candy colors, big friendly eyes, puppy-cute proportions, teal `#19B5A5`
bandana accent, simple uncluttered pastel backgrounds, generous top negative space for
overlays. This matches `channel/config.json → style.image_suffix`.

> Tip: until the real photos arrive, the placeholder model sheet can serve as a
> *temporary* character reference to start test-rendering episodes — but do NOT publish
> with it; publish only the real-Willow design so fans recognize the family dog.

Generated with Pika `generate_image` (nano-banana-pro), 2K. Production stills use
Higgsfield `nano_banana_2` per the skill.
