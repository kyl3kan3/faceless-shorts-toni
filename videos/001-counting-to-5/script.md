# Script — Count to 5 with Willow (apples) 🍎

**Series:** Counting with Willow · **Promise:** count 1–5 · **Payoff:** "I can count to 5!"
**Target:** ~36s · ~75 words · 6 beats · **Made for Kids: YES**

> Speaker tags drive which cloned voice renders each line (`tts.ps1 -VoiceId`).
> Default voice = Mama. Willow = Daisy's clone (bright). Keep delivery slow + warm.

[B1 — HOOK 0–3s · Willow peeks in]
**[Willow]** "Hi friends! Willow needs your help — can you count with me?"

[B2 · one apple appears]
**[Mama]** "Here is ONE red apple. One!"

[B3 · second apple]
**[Mama]** "Look — another one! That makes... TWO."

[B4 · apples keep landing, kid joins]
**[Leo]** "Three! Four!" **[Mama]** "Keep going, you've got it!"

[B5 · fifth apple, big number 5]
**[Mama + Willow]** "FIVE apples! Hooray!"

[B6 — PAYOFF + CTA 0–4s · Willow waves, sparkle tail]
**[Willow]** "You counted to five! Wag your tail! Come learn with Willow!"

---
## Plain narration (→ audio/narration.txt; single-voice fallback = Mama reads all)
Hi friends! Willow needs your help — can you count with me? Here is one red apple.
One! Look, another one. That makes two. Three! Four! Keep going, you've got it. Five
apples! Hooray! You counted to five. Wag your tail. Come learn with Willow!

## Audio build (multi-voice version)
Render each tagged line separately, then stitch in beat order:
- `tts.ps1 -Text "Hi friends! ..." -VoiceId <willow/daisy> -Out audio/l1.mp3`
- `tts.ps1 -Text "Here is one red apple. One!" -VoiceId <mama> -Out audio/l2.mp3` … etc.
- Pika `edit_audio_stitch` the line clips → `audio/voiceover.mp3` (add ~0.3s gaps).
- For B5 "FIVE apples! Hooray!" render in both voices and layer, or just Mama+excited.
Single-voice fallback: just run `tts.ps1 -ScriptFile audio/narration.txt -Out audio/voiceover.mp3`.

## On-screen counting overlay
Big number badge (1→5) appears with each apple (Pika `edit_text_overlay`, brand teal).
Numbers are overlays, NOT baked into the generated art.
