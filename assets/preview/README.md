# Preview reels (proofs)

`ep001-counting-animatic.mp4` — a real **15.5s, 1080×1920** Episode 001 reel:
intro card → counting **1→5** over the apple frame → "Come learn with Willow!" outro,
with the nursery music bed under it. Built locally with ffmpeg from the placeholder
art in `../concept/` + `../music/`.

**What it proves:** the end-to-end *assembly* works — timing, captions/number overlays,
9:16 framing, branded cards, music. **What it is NOT:** the final pipeline output. The
real episode (per `../../faceless-shorts/SKILL.md`) uses:
- the **real Willow** (regenerated from your photos), not the placeholder badge,
- **Higgsfield** AI animation for living motion (this proof is static cards + overlays),
- **family ElevenLabs voiceover** (this proof is music-only — no voices yet),
- Pika `add_captions` / `edit_audio_mix` for the finish.

So: treat this as a **storyboard animatic** that already looks like the show. Swap in
the real Willow + voices + animation and it becomes publish-ready.
