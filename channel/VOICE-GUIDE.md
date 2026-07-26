# Voice Guide — recording the family so we can clone them

Our edge is **real family warmth**. To get it, each speaking family member records a
short, clean sample **once**; we clone it with ElevenLabs; then every script line is
spoken in that person's voice forever. This guide makes the samples *good* (bad
samples = robotic clones).

## Who records (4 speaking voices + 1 SFX)
| Voice | Person | What to read | Energy |
|-------|--------|--------------|--------|
| **Mama** | Mom | calm story-time narration | warm, slow, clear |
| **Papa** | Dad | playful counting/song buddy | friendly, a little goofy |
| **Leo** | 7-yo boy | excited questions | curious, bright |
| **Daisy** | 5-yo girl | sweet encouragement (also doubles as **Willow**) | giggly, gentle |
| **Baby Pip** (SFX) | 2-yo girl | real giggles, "yay!", "woof!" | natural — capture, don't direct |

> The 2-yo is **not** cloned for speech (toddlers can't voice-act reliably and there
> are extra consent reasons to keep it simple). We just capture a few happy noises to
> use as button sounds so she's still part of the show.

## How to record a clean sample (do this for each of the 4)
**You need ~60–90 seconds of clean speech per person** (ElevenLabs needs ~30s minimum;
more = better; 1–2 minutes is the sweet spot).

1. **Room:** small, soft room (closet with clothes, or sit on a bed). Avoid bathrooms/
   kitchens (echo) and open rooms.
2. **Mic:** phone is fine. Hold it ~8–10 inches away, slightly off to the side (avoid
   pop/breath). Voice Memos / any recorder app. Export **.m4a or .mp3**.
3. **Quiet:** no TV, fan, AC, or background voices. Record when the house is calm.
4. **Delivery:** speak the way you'd want Willow's show to sound — Mom slow and warm,
   the kids natural and happy. **No silly cartoon voices** — clone the *real* person;
   we shape the character in the writing.
5. **Content:** read the script for that voice below (or just talk naturally about a
   favorite snack/animal). Variety of sentences > repeating one line.
6. **One clean take.** A few stumbles are OK; just keep going. Trim long silences at
   the start/end before sending.

### Sample scripts to read (≈60–90s each)
**Mama (Mom):**
> "Hello, friends! It's so good to see you. Today we're going to learn something
> brand new, and we're going to do it together. Are you ready? Let's take a big deep
> breath... and here we go. One, two, three! Wonderful job. I knew you could do it.
> Learning is fun when we do it with friends. Let's find out what Willow has for us
> today. Ready? Let's go!"

**Papa (Dad):**
> "Whoa, look at that! Did you see it? Let's count them together — ready? One...
> two... three... four... five! High five! You're getting so good at this. Okay, one
> more time, but a little faster this time. Here we go! That was awesome. Give
> yourself a big clap. I'm so proud of you, friend."

**Leo (7-yo boy):**
> "Wait, wait — how does that work? That's so cool! Can we do it again? I want to try!
> Okay, I think the answer is... three! Is it three? Yes! I got it! Let's learn
> another one. What sound does that letter make? Sss, sss, snake! I love this game."

**Daisy (5-yo girl) — also Willow:**
> "Hi! I'm so happy you're here! Let's learn together, okay? You can do it, I know you
> can! Yay, you did it! Good job! Wag your tail if you're happy! Woof woof! That was
> so much fun. Let's do one more. I love learning with you!"

## Cloning the samples (the owner, once per person)
Per the skill's setup ([`../faceless-shorts/reference/SETUP.md`](../faceless-shorts/reference/SETUP.md)):
clone via the **ElevenLabs REST API** (NOT the `clone_voice` MCP — that only makes
Kling video-avatar voices that TTS rejects). Needs a **paid** ElevenLabs plan + API
key in the project `.env`.

```powershell
$KEY = [regex]::Match((Get-Content .env\.env.txt -Raw),'sk_[A-Za-z0-9_-]{20,}').Value
# Repeat per person, changing name + file. Save each returned voice_id into channel/config.json.
curl.exe -s -X POST "https://api.elevenlabs.io/v1/voices/add" -H "xi-api-key: $KEY" `
  -F "name=Mama"  -F "files=@C:\path\mom.m4a;type=audio/mp4"
curl.exe -s -X POST "https://api.elevenlabs.io/v1/voices/add" -H "xi-api-key: $KEY" `
  -F "name=Papa"  -F "files=@C:\path\dad.m4a;type=audio/mp4"
curl.exe -s -X POST "https://api.elevenlabs.io/v1/voices/add" -H "xi-api-key: $KEY" `
  -F "name=Leo"   -F "files=@C:\path\leo.m4a;type=audio/mp4"
curl.exe -s -X POST "https://api.elevenlabs.io/v1/voices/add" -H "xi-api-key: $KEY" `
  -F "name=Daisy" -F "files=@C:\path\daisy.m4a;type=audio/mp4"
```
Paste each `voice_id` into [`config.json`](config.json) → `models.tts_voices`
(`mama`, `papa`, `leo`, `daisy`; set `willow` = the `daisy` id if reusing it, and set
`tts_voice_id` default = `mama`). Then test:
`powershell -File tools/tts.ps1 -Text "Come learn with Willow!" -VoiceId <daisy_id> -Out test.mp3`

## Consent & safety (important for a kids brand)
- Both parents consent to cloning the **family's own** voices for the **family's own**
  channel. Keep the raw samples private; never share voice files publicly.
- This is "faceless" by design — **no children's faces or real names** on camera. Willow
  (a cartoon) is the on-screen identity; the kids are heard, not shown. That protects
  the children *and* is the safest, most scalable brand format.
- Use kids' **character names** (Leo, Daisy), not their real names, anywhere public.
