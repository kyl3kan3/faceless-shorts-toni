# Channel Bible — Learn With Willow 🐶

The single source of truth for *who Willow is*, *who voices what*, and *how every
video must look and sound*. If a video breaks a rule here, the video is wrong, not
the rule. Consistency is the entire brand — kids (and the algorithm) reward sameness.

---

## 1. The channel
- **Name:** Learn With Willow
- **Handle:** @LearnWithWillow (claim the same handle on YouTube, TikTok, Instagram,
  Facebook, Pinterest — see [`../INTAKE.md`](../INTAKE.md))
- **Character / mascot:** **Willow the Wonder Pup** — the cartoon version of the
  family's real dog, Willow.
- **Audience:** children **2–7** (and the parent watching with them).
- **Promise:** every short teaches **one** tiny thing — a number, a letter sound, a
  color, a shape, an animal, a feeling — in under a minute, with Willow.
- **Tagline / sign-off (every video):** *"Come learn with Willow!"*
- **Why a character, not a topic:** Numberblocks, Cocomelon, Blippi — the durable
  money is in an **owned character** that can become toys, songs, books, an app.
  Willow is the asset. See [`STRATEGY.md`](STRATEGY.md).

---

## 2. Willow the Wonder Pup (the star)
> ⚠️ The art below is the *target design*. Willow must be drawn from the **real
> dog's photos** so fans recognize her. Until those land (see INTAKE.md), we use a
> placeholder design to lock the *style*. The locked spec + master prompt lives in
> [`../characters/willow-character-brief.md`](../characters/willow-character-brief.md).

- **Species/role:** a sweet, bouncy cartoon puppy who is endlessly curious and
  *learns alongside the child* (never a know-it-all — she makes friendly mistakes
  and figures things out, which models learning).
- **Personality:** warm, gentle, giggly, encouraging, a little silly. Never sarcastic,
  never scary, never loud-startling. Celebrates the kid: "You did it!"
- **Signature:** a tiny colored bandana/collar (brand accent color), a waggy tail
  that "sparkles" when something is learned, and a head-tilt when she's thinking.
- **Catchphrases:** "Let's find out together!" · "Wag if you can do it too!" ·
  "Come learn with Willow!"
- **Hard rules:** same proportions, same markings, same collar, same color palette
  in *every* frame. Always pass her reference image into image generation.

### Supporting cast (animated, voiced by the family — see §3)
- **Daisy** — a cheerful kid character, Willow's best friend (voiced by the 5-yo girl).
- **Leo** — the curious "big kid" who asks the questions little ones are thinking
  (voiced by the 7-yo boy).
- **Mama** — warm teacher/narrator presence (voiced by Mom).
- **Papa** — gentle counting/song buddy (voiced by Dad).
- **Baby Pip** — a giggly toddler character; *not* a speaking role. We use the
  2-yo's real giggles/"yay!" as occasional SFX only (toddlers can't reliably voice-act).

---

## 3. Voice cast (the family) — mapping + how cloning works
This is the channel's superpower: **real family warmth** (the thing parents trust,
the "Ms Rachel effect") at the scale of AI production.

| Character | Voiced by | Direction (record in this energy) |
|-----------|-----------|-----------------------------------|
| **Mama** (narrator/teacher) | Mom | calm, warm, slow, clear — "story-time" voice |
| **Papa** (buddy) | Dad | friendly, playful, a little goofy |
| **Leo** (big-kid sidekick) | 7-yo boy | curious, excited, asks questions |
| **Daisy** (Willow's friend) | 5-yo girl | sweet, giggly, encouraging |
| **Willow** | see note ↓ | bright, bouncy, gentle puppy voice |
| **Baby Pip** (SFX only) | 2-yo girl | real giggles / "yay!" — captured, not scripted |

**Willow's voice options (pick one):** (a) clone the **5-yo's** voice and use it for
Willow too (simplest, very cute), (b) clone **Mom** in a lighter/brighter read, or
(c) a dedicated playful clone. Default recommendation: **option (a)**.

**Cloning is done ONCE per person** via the **ElevenLabs REST API** with the owner's
key (NOT the `clone_voice` MCP — see [`../faceless-shorts/reference/GOTCHAS.md`](../faceless-shorts/reference/GOTCHAS.md)
gotcha #1). Each clone returns a `voice_id` → paste into
[`config.json`](config.json) `models.tts_voices`. Recording instructions for each
family member are in [`../INTAKE.md`](../INTAKE.md) and the deeper guide in
[`VOICE-GUIDE.md`](VOICE-GUIDE.md). `tools/tts.ps1 -VoiceId <id>` picks the voice per line.

> Toddler (2-yo): do **not** clone for speech. Record a few real "yay!", giggles,
> and "woof!" clips → use as button SFX. It keeps her in the show, safely.

---

## 4. Visual style (locked)
- **Look:** bright, flat **2D cartoon storybook** for young children — bold clean
  outlines, candy-saturated colors, soft rounded shapes, simple uncluttered
  backgrounds, big friendly eyes. (Think Numberblocks/Super Simple, NOT cinematic.)
- **`image_suffix`** (appended to every prompt) lives in [`config.json`](config.json)
  → `style.image_suffix`.
- **No text inside images** — all words come from captions + flashcard overlays we
  add in assembly (keeps text crisp and translatable for other-language versions).
- **Brand accent color:** pick one (e.g. sunny teal `#19B5A5` on Willow's bandana) and
  use it on the collar, title cards, captions highlight, and thumbnails — everywhere.
- **Safe & calm:** no jump-scares, no fast strobing, gentle motion only (`style.motion`).

### Flashcards / "simple pictures"
The "simple pictures" the goal asks for = clean flashcard frames: a big number with
that many objects, a letter with a picture that starts with it, a shape, a color
swatch with example objects. Generate as stills (Higgsfield `nano_banana_2`) and add
the big label as a caption/overlay in assembly (Pika `edit_text_overlay`).

---

## 5. Production deltas from the base skill (READ THIS)
We use [`../faceless-shorts/SKILL.md`](../faceless-shorts/SKILL.md) as the engine, with
these **kids-specific changes**:

1. **Style suffix → cartoon storybook** (not cinematic/photoreal). Set in config.
2. **Multiple voices**, one per character/line, via `tts.ps1 -VoiceId`. Each `script.md`
   beat is tagged with the speaker (e.g. `[Mama]`, `[Willow]`).
3. **Recurring character consistency:** pass Willow's reference image into *every*
   `generate_image` call; keep her brief open. (The base skill assumes fresh subjects.)
4. **Pace:** ~75 words / slower delivery / 6 beats; little kids need air. Re-check
   fps after `edit_speed`.
5. **Captions → friendly/bottom**, 1–3 words, big & rounded (not aggressive hormozi).
6. **Music → happy nursery bed**, and for "song" episodes, generate a simple melodic
   hook with `generate_music`. Songs travel furthest in this niche.
7. **Willow talking → add a lipsync pass** (Pika `generate_lipsync`) so her mouth
   matches her lines on close-ups.
8. **Intro/outro sting** every video (`config.audio`) for instant brand recognition
   and loopability.
9. **Upload = Made for Kids = true** (law). See [`MONETIZATION.md`](MONETIZATION.md)
   for why the money therefore comes from sponsorships/licensing/merch/printables, not ads.
10. **One master, many platforms** — post the 9:16 to YT Shorts/TikTok/IG/FB/Pinterest;
    batch into long-form compilations + a 24/7 live loop.

---

## 6. Series (recurring formats = predictable batching)
Pick a daily rotation so production is a template, not a blank page:
- **Counting with Willow** (1–10, then 10–20, then simple adding)
- **Letter Sounds with Willow** (phonics: one sound + 3 words that start with it)
- **Color Magic** (mix two colors → new color)
- **Shape Hunt** (find the shape in everyday objects)
- **Animal Sounds / Animal Facts** (one animal, the sound, one fun fact)
- **Big Feelings with Willow** (name a feeling + a tiny coping trick — huge with parents)
- **Willow's Song of the Day** (a 30s sing-along — the format most likely to go viral)

Full idea list: [`../topics/backlog.md`](../topics/backlog.md).
