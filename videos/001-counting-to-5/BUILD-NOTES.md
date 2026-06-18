# Build notes — Episode 001 "Count to 5" (real reel)

Output: [`../../assets/preview/ep001-count-to-5.mp4`](../../assets/preview/ep001-count-to-5.mp4)
· 1080×1920 · 30fps · 21.3s.

## Assets used
- **Willow poses** (locked `assets/concept/willow-hero.png` design), background-removed to
  transparent cutouts: peek (B1), pointing (B2/B3), hero-sit (B4), excited-jump (B5), wave (B6).
- **Voices** (ElevenLabs `eleven_multilingual_v2`, cloned — see `channel/config.json`):
  - Willow = Daisy `zTwvFDqpcXCaEfcXze1U` · Mama `STYxKP7DOwxgXBiQyRSr` · Leo `vylPBu4ySOnOAuH9vjej`
- **Music**: `assets/music/willow-nursery-bed-60s.mp3` (looped, ~‑16 dB under VO, fade out).

## Voice lines → beats (measured durations incl. tails)
| Beat | Voice | Line | Dur |
|---|---|---|---|
| B1 hook | Willow | "Hi friends! Willow needs your help. Can you count with me?" | 5.07s |
| B2 | Mama | "Here is one red apple. One!" | 2.27s |
| B3 | Mama | "Look, another one! That makes... two." | 2.82s |
| B4 | Leo + Mama | "Three! Four!" / "Keep going, you've got it!" | 3.63s |
| B5 | Willow | "Five apples! Hooray!" | 2.74s |
| B6 payoff | Willow | "You counted to five! Wag your tail! Come learn with Willow!" | 4.78s |

## Pipeline (reproducible)
1. **VO**: render each line in its cloned voice via the ElevenLabs REST API; per-beat
   audio = line(s) + breathing tail; concat → `voiceover.mp3`.
2. **Beat scenes**: compose each beat as 1080×1920 HTML (brand palette + Fredoka, Willow
   cutout + 🍎 apples + teal number badge + bottom caption) → render with Pika `html_to_png`.
3. **Motion**: ffmpeg `zoompan` gentle push-in per still (force `-framerate 30` on the
   looped image input — else it defaults to 25fps and the video runs short/out of sync).
4. **Assemble**: concat beat clips (each = its beat-audio duration) → mix VO over the ducked
   music bed → H.264 / yuv420p / AAC.

## To make Episodes 002 / 003
Same recipe; scripts + visual prompts already exist in `videos/002-*` and `videos/003-*`.
Reuse the Willow cutouts; only the lesson props (letters/colors) + captions change.
