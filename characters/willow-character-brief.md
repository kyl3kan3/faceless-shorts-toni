# Character Brief — Willow the Wonder Pup

**This is the most important consistency document in the repo.** A recurring,
*identical* Willow is what turns a pile of videos into a brand kids recognize and
parents trust. Keep this open whenever generating any image of Willow.

---

## ✅ Status: REAL FOOTAGE RECEIVED — reference frames staged
Willow is a **real family dog: a Vizsla** (warm rust/copper coat). Reference frames
were extracted from the owner's clips and staged **locally** (gitignored for privacy —
they show the real home) at:
- `assets/willow-photos/willow_ref_01_face.jpg` — sharp 4K face, front, eyes to camera
- `assets/willow-photos/willow_ref_02_sit_front.jpg` — full-body sitting, proportions
- `assets/willow-photos/willow_ref_03_sit_profile.jpg` — 3/4 profile, muzzle + ear shape

**Next:** run the "Master regeneration prompt" below with these frames as reference
images, produce a **character turnaround + expression sheet**, save the chosen frames
to `assets/concept/willow-model-sheet.png` (safe to commit — it's the cartoon, not the
home), then every future `generate_image` call passes that model sheet as a reference.

> **Design call (rust Vizsla → toddler-cute):** Vizslas are sleek and lanky, but the
> brand wants a warm, rounded, preschool-friendly pup. We keep her unmistakable
> identity markers — **warm rust/copper coat, long high-set floppy ears, honey-amber
> eyes, long tapered (but softened) muzzle, slim build** — and gently round her into a
> cute cartoon. We do NOT go full stubby-legged blob (that erases the Vizsla); we keep
> her elegant lines, just friendlier. Solid coat = no complex markings to reproduce =
> easy consistency.

---

## Locked spec (matched to the real Willow)
- **Breed / build:** **Vizsla**, cartoon-rounded but keeping her lean, elegant
  silhouette and long legs (do NOT make her a stubby blob). Friendly puppy-cute via a
  slightly larger head + softer curves, not by shortening her legs.
- **Coat color & markings:** **smooth short rust / copper / golden-brown coat**,
  slightly lighter around the muzzle; **brown nose**. Solid color, NO patches/markings
  (this is what makes her easy to redraw identically every time).
- **Eyes:** big, round, **warm honey-amber** (her real eye color), friendly highlight;
  expressive eyebrows.
- **Ears:** **long, high-set, floppy with rounded tips**; she tilts her head when
  thinking.
- **Muzzle:** long and tapered like a real Vizsla, but **softened/rounded** for
  cuteness.
- **Signature accessory:** a **teal bandana** (brand accent `#19B5A5`) — always on.
- **Tail:** long and waggy; emits little **sparkles** ✨ when something is learned.
- **Proportions rule:** head a touch oversized for cuteness, but keep recognizably a
  Vizsla — slim body, long legs. Stylized, not photoreal; cute, not lanky-realistic.
- **Palette:** warm rust/copper + the teal accent; soft candy background colors.

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
Character model sheet of "Willow the Wonder Pup", a friendly cartoon Vizsla puppy
based on the reference photos of this real dog — keep her warm rust/copper coat, long
high-set floppy ears, honey-amber eyes, and long softened muzzle. Bright flat 2D
cartoon storybook style for young children: bold clean outlines, candy-saturated
colors, soft rounded shapes, big round friendly amber eyes. Cute, slightly
big-headed proportions but keep her lean Vizsla build and long legs (NOT a
stubby-legged blob). She wears a small teal bandana. Plain soft pastel background.
Show the SAME puppy in a row of poses: sitting happy front view, head-tilt thinking,
excited jump with sparkly tail, pointing with one paw, waving goodbye. Consistent
design across all poses, wholesome, no text, no scary elements. Vertical 9:16.
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
