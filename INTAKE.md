# 📥 INTAKE — the 2 things only you can provide

Everything else is built. These two unlock real production. Do them in any order.

---

## 1) 📸 Photos of Willow (the real dog)
So the cartoon Willow actually looks like *your* dog (this is what makes fans bond
with her). Drop **5–10 clear photos** into `assets/willow-photos/` (create the folder):

- ✅ A few **straight-on face** shots (eyes open, good light).
- ✅ A couple of **full-body side** shots (shows her shape/markings).
- ✅ One or two **happy/playful** shots (for personality reference).
- ✅ Natural daylight, in focus, plain-ish background if possible.
- ❌ No filters, no costumes, no heavy shadow.

Then tell me, and I'll: generate Willow's **cartoon model sheet** from them, save it to
`assets/concept/willow-model-sheet.png`, and fill in the real colors/markings in
[`characters/willow-character-brief.md`](characters/willow-character-brief.md). That
model sheet becomes the reference for every future video.

*(How to add them: drag into the GitHub web UI on this branch, or `git add` locally —
or just attach them in chat and I'll place them.)*

---

## 2) 🎙️ Family voice samples
So the show is voiced by your real family (our biggest edge). Record **~60–90 seconds
each** for the 4 speaking voices, following [`channel/VOICE-GUIDE.md`](channel/VOICE-GUIDE.md)
(it has the exact scripts to read and how to get clean audio):

| File to add (in `assets/voices/`) | Who | Plays |
|-----------------------------------|-----|-------|
| `mom.m4a`   | Mom | Mama (narrator) |
| `dad.m4a`   | Dad | Papa (buddy) |
| `leo.m4a`   | 7-yo boy | Leo (big-kid sidekick) |
| `daisy.m4a` | 5-yo girl | Daisy + **Willow's voice** |
| `pip-sfx.m4a` *(optional)* | 2-yo girl | a few real giggles / "yay!" for SFX |

> The 2-yo is **not** cloned for speech — just optional giggle SFX.

---

## 3) 🔑 Your machine setup (one-time — needed to render & upload)
These run on **your** computer (the skill's pipeline), not in this cloud session. See
[`faceless-shorts/reference/SETUP.md`](faceless-shorts/reference/SETUP.md):

- [ ] **ElevenLabs** paid plan + API key saved to project `.env` (for voice cloning + TTS).
      Then clone each family voice via the REST API (commands in `channel/VOICE-GUIDE.md`)
      and paste the `voice_id`s into [`channel/config.json`](channel/config.json) → `models.tts_voices`.
- [ ] **Higgsfield** account with credits (~46 per finished video; Plus = faster batching).
- [ ] **Composio CLI** in WSL, with YouTube connected (`composio link youtube`) — for upload.
- [ ] Create the **channel** on YouTube (+ claim `@LearnWithWillow` on TikTok, Instagram,
      Facebook, Pinterest). Set the channel's audience to **"Made for Kids."**

*(I can do the image/video/music/caption/assembly steps from here via the Pika &
Higgsfield tools once Willow's photos exist; ElevenLabs cloning + Composio upload need
your keys, so those run on your side.)*

---

## What happens the moment 1 & 2 are in
1. I generate Willow's cartoon **model sheet** from her photos and lock her colors.
2. You clone the 5 voices (10 min) and paste the IDs into `config.json`.
3. I render the **stills + animation + music + captions** for episodes **001–003** and
   assemble the 9:16 masters.
4. You run the ElevenLabs voiceovers + the Composio upload (or paste your keys and I
   drive it), set **Made for Kids = true**, and we publish the first three.
5. We batch the next 7 and start the daily cadence. 🚀
