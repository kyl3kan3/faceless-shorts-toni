# Character Brief — Willow the Wonder Pup

**This is the most important consistency document in the repo.** A recurring,
*identical* Willow is what turns a pile of videos into a brand kids recognize and
parents trust. Keep this open whenever generating any image of Willow.

---

## ⚠️ Status: AWAITING REAL DOG PHOTOS
Willow is a **real family dog**. The cartoon must clearly read as *her* (her real
colors, ear shape, markings) so the family — and eventually fans — recognize her.
Until photos land, we work from a **placeholder design** purely to lock the *art
style*. See [`../INTAKE.md`](../INTAKE.md) for exactly what photos to drop in.

**When the photos arrive:** run the "Master regeneration prompt" below with the real
photos as reference images, produce a **character turnaround + expression sheet**,
save the chosen frames to `assets/concept/willow-model-sheet.png`, and update the
"Locked spec" bullets to match the real dog (colors/breed/markings). Every future
`generate_image` call passes that model sheet as a reference image.

---

## Locked spec (fill the [brackets] from the real photos)
- **Breed / build:** [breed — e.g. "fluffy medium golden-doodle"], cartoon-rounded,
  puppy-cute proportions (big head, small body, stubby legs — toddler-friendly).
- **Coat color & markings:** [real color, e.g. "soft cream with caramel ears and a
  white chest blaze"]. Keep markings simple and repeatable.
- **Eyes:** big, round, warm brown, friendly highlight; expressive eyebrows.
- **Ears:** [floppy / pointy per real dog]; she tilts her head when thinking.
- **Signature accessory:** a **teal bandana** (brand accent `#19B5A5`) — always on.
- **Tail:** waggy; emits little **sparkles** ✨ when something is learned.
- **Proportions rule:** head ≈ 1.4× body width; never realistic, never lanky.
- **Palette:** warm creams + the teal accent; soft candy background colors.

## Personality (drives expression + pose, see bible §2)
Curious, gentle, giggly, encouraging; *learns alongside the child*, makes friendly
mistakes, then celebrates ("You did it!"). Never scary, sarcastic, or startling.

## Expression sheet to generate (the reusable kit)
Generate these poses once, reuse forever (paste as references for new scenes):
1. **Neutral happy** (front, sitting, tail up) — the default reference.
2. **Thinking** (head tilt, paw to chin).
3. **Excited / "You did it!"** (jumping, sparkle tail).
4. **Pointing/showing** (one paw raised toward where a flashcard goes).
5. **Waving goodbye** (for the outro).
6. **Curious peek** (for hooks).

## Master regeneration prompt (use with the REAL photos as references)
> Paste into `generate_image` (Higgsfield `nano_banana_2`, aspect 9:16) **with the
> real dog photos attached as reference images**. Generate 3–4 and pick the best.

```
Character model sheet of "Willow the Wonder Pup", a friendly cartoon puppy based on
the reference photos of this real dog — keep her exact coat color, ear shape, and
markings. Bright flat 2D cartoon storybook style for young children: bold clean
outlines, candy-saturated colors, soft rounded shapes, big round warm-brown friendly
eyes, puppy-cute proportions (big head, small rounded body, stubby legs). She wears a
small teal bandana. Plain soft pastel background. Show the SAME puppy in a row of
poses: sitting happy front view, head-tilt thinking, excited jump with sparkly tail,
pointing with one paw, waving goodbye. Consistent design across all poses, wholesome,
no text, no scary elements. Vertical 9:16.
```

## Consistency checklist (every Willow frame)
- [ ] Same coat color + markings as the model sheet
- [ ] Teal bandana present
- [ ] Big round friendly eyes, puppy proportions (head ≈1.4× body)
- [ ] No text baked into the image (text comes from captions/overlays)
- [ ] Same flat cartoon storybook style / palette
- [ ] Passed the model sheet in as a reference image

## Supporting characters (keep simple, secondary to Willow)
- **Daisy** — a cheerful kid character (simple, diverse-friendly, not the real child's
  likeness); soft dress in a secondary brand color.
- **Leo** — curious "big kid" character; cap or backpack as a recognizable prop.
- **Baby Pip** — a giggly toddler character; appears rarely, SFX only.
Generate model sheets for each the same way; keep them visually subordinate to Willow.
