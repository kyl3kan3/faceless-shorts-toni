# CLAUDE.md — agent guide for "Learn With Willow"

This repo is a faceless kids' YouTube channel: a cartoon Vizsla puppy, **Willow the
Wonder Pup**, teaches pre‑K skills (counting, ABCs, phonics, colors) in 9:16 sing‑along
Shorts. This file tells any Claude agent (Claude Code **or** Claude Cowork) what's here
and **what to do**.

## Project map
- `channel/config.json` — channel + video specs, cloned voice IDs, style. Source of truth.
- `channel/bible.md`, `characters/willow-character-brief.md` — story + locked Willow design.
- `channel/SEO-DISCOVERY.md` — title/desc/tag/thumbnail playbook (use literally).
- `channel/MONETIZATION.md`, `channel/STRATEGY.md` — business model + plan.
- `assets/brand/` — logo, avatar, thumbnail template (real Willow). `assets/concept/` — Willow art + pose/expression cutouts.
- `assets/voices/` — **gitignored** family voice recordings (local only; never commit).
- `assets/willow-photos/` — **gitignored** real-dog footage (local only; never commit).
- `videos/NNN-*/` — per‑episode `script.md` (multi‑voice lines), `visual-prompts.md`, `audio/narration.txt`, `PUBLISH.md` (upload metadata).
- `assets/preview/` — **rendered, ready‑to‑publish episode .mp4s** (the only mp4s committed).
- `topics/backlog.md` — ~50 future episode ideas.

## Voices (ElevenLabs, in config.json → models.tts_voices)
Willow = **designed** voice `N5KWZShvuwHXPTahyw3s` · Mama `STYxKP7DOwxgXBiQyRSr` ·
Papa `HgKmyw1SUU69yWHLJLsW` · Leo `vylPBu4ySOnOAuH9vjej`. (Daisy clone was scrapped.)

## How an episode is produced (recipe)
See `videos/001-counting-to-5/BUILD-NOTES.md`. In short: write a catchy **song**
(`generate_music`), animate **Willow on the beat**, overlay numbers/letters + captions,
sync to the music. Song‑first sing‑along is the format that performs.

## ▶️ WHAT TO DO: publish (this is the Cowork task)
Production is done in Claude Code with media MCPs. **Publishing/distribution is done via
Composio** (YouTube upload + analytics; TikTok/IG gated by those platforms' app review).

**In Claude Cowork:** Customize → Connectors → **+** → Add custom connector →
`https://connect.composio.dev/mcp` → Connect → authorize. Then ask it to connect YouTube.

**To publish an episode:**
1. Take the rendered file in `assets/preview/` (e.g. `ep001-count-to-5.mp4`).
2. Read that episode's `videos/NNN-*/PUBLISH.md` for the exact title, description, tags, category.
3. Upload to YouTube with **`selfDeclaredMadeForKids = true`** — this is **legally required (COPPA)** and non‑negotiable on every upload.
4. Default to **Unlisted** for owner review first, then flip to Public once approved.
5. Add to the series playlist named in PUBLISH.md. Optionally cross‑post per PUBLISH.md (only if TikTok/IG posting is approved for the account).

## Current status
- **Episode 001 (Count to 5)** — ✅ rendered → `assets/preview/ep001-count-to-5.mp4` → ready to publish (`videos/001-counting-to-5/PUBLISH.md`).
- **Episodes 002 (Letter S), 003 (Colors)** — scripted only, **not rendered yet** (produce before publishing).
