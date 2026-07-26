# Script — The "S" Sound with Willow 🐍

**Series:** Letter Sounds (phonics) · **Promise:** the /s/ sound + 3 S-words ·
**Payoff:** "S says sss!" · **Target:** ~35s · ~72 words · 6 beats · **Made for Kids: YES**

[B1 — HOOK 0–3s]
**[Willow]** "Sss... sss... what letter makes that sound? Let's find out!"

[B2 · big letter S]
**[Mama]** "This is the letter S. S says sss — like a sleepy snake."

[B3 · sun]
**[Mama]** "Sss... SUN! The sun starts with S."

[B4 · snake]
**[Leo]** "Sss... SNAKE!" **[Mama]** "Yes! Snake starts with S too."

[B5 · sock]
**[Mama + Willow]** "Sss... SOCK! S, s, s!"

[B6 — PAYOFF + CTA]
**[Willow]** "Sun, snake, sock — they all say sss! Great job! Come learn with Willow!"

---
## Plain narration (→ audio/narration.txt; single-voice fallback)
Sss... sss... what letter makes that sound? Let's find out. This is the letter S. S
says sss, like a sleepy snake. Sss... sun! The sun starts with S. Sss... snake! Yes,
snake starts with S too. Sss... sock! S, s, s! Sun, snake, sock — they all say sss.
Great job! Come learn with Willow!

## Audio build
Multi-voice: render tagged lines per voice, `edit_audio_stitch` in order. Stretch the
"sss" sounds a touch in delivery. Single-voice fallback: `tts.ps1 -ScriptFile
audio/narration.txt`. **Caption hint_terms:** ["sss"] so ASR doesn't mangle it.

## On-screen overlay
Big letter **S** badge stays top-corner the whole video; each word's first letter S
highlights in brand teal as it's said.
