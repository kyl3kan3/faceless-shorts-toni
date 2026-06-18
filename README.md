# Learn With Willow 🐶 — a faceless kids-learning Shorts channel

A complete, ready-to-run setup for a **faceless kids-learning short-form channel**
built around an original animated character — **Willow the Wonder Pup** (the cartoon
version of the family dog) — voiced by the real family, aiming at **$60k/month**.

It uses the reusable **[`faceless-shorts/`](faceless-shorts/SKILL.md) skill** (the
production engine) and adds everything that makes it *this* channel: brand, character,
voices, strategy, money model, and the first episodes.

> **Read this first:** kids content is legally "Made for Kids," which caps ad revenue
> hard (~$1–3 RPM, no memberships/comments). So this is designed as a **character-IP
> business** — sponsorships, licensing, merch, music, printables, a parent membership —
> not an ad-revenue channel. The math is in [`channel/MONETIZATION.md`](channel/MONETIZATION.md).

## Start here → [`INTAKE.md`](INTAKE.md)
Two things from you unlock real production: **(1) photos of Willow** and **(2) the
family voice samples**. INTAKE.md says exactly what to drop in and where.

## Map of the repo
```
faceless-shorts/        ← THE SKILL (production engine: SKILL.md + reference/ + templates)
channel/
  config.json           ← this channel's settings (cartoon style, family voices, MFK flag)
  bible.md              ← Willow + the family voice cast + visual/voice rules  ⭐ read this
  STRATEGY.md           ← the business + 18-month plan to $60k/mo
  MONETIZATION.md       ← the honest revenue model + the math
  VOICE-GUIDE.md        ← how the family records clean voice samples
characters/
  willow-character-brief.md  ← locked design + master prompt to draw Willow from real photos
topics/backlog.md       ← 50+ episode ideas across 7 series
videos/                 ← self-contained episode folders (001–003 are written & ready)
templates/              ← copies of the skill's script/visual/metadata templates
tools/tts.ps1           ← ElevenLabs narration helper (multi-voice via -VoiceId)
assets/concept/         ← art-direction concept frames (style lock)
```

## How a video gets made (the loop, from the skill)
`pick topic → script (done for 001–003) → visual prompts → render voices (ElevenLabs)
→ stills (Higgsfield nano_banana_2) → animate (Higgsfield cinematic_studio_video) →
assemble + captions (Pika) → package upload.json (Made for Kids) → upload (Composio)`.
Full runbook: [`faceless-shorts/reference/PIPELINE.md`](faceless-shorts/reference/PIPELINE.md).
Kids-specific changes (cartoon style, multi-voice, recurring character, MFK): see
[`channel/bible.md`](channel/bible.md) §5.

## Current status
- ✅ Concept scaffolded per the skill's STEP 0 (config, bible, strategy, money model).
- ✅ Character locked (style); first 3 episodes fully scripted with visuals + narration.
- ✅ 50+ episode backlog.
- ⏳ **Blocked on you:** Willow's photos + family voice samples (see `INTAKE.md`).
- ⏳ Then: regenerate Willow from real photos → clone voices → render & batch episode 1.

## Toolchain (wired to this workspace)
Pika (image/video/voice-stitch/music/lipsync/captions/assembly), Higgsfield
(image/video + `virality_predictor`), Adobe Express/Firefly + Canva (thumbnails,
flashcards, branding), Ahrefs/Semrush (keyword/SEO). ElevenLabs (voice cloning) and
Composio (YouTube upload) run on your machine per the skill's setup.
