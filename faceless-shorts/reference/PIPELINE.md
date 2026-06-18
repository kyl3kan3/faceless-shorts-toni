# Per-video pipeline — detailed runbook

Each video = a self-contained `videos/NNN-slug/` folder. Locate every tool with ToolSearch
(server names are hashed per session). Preflight Higgsfield with `get_cost:true`.

## 0. Topic
Pick from `topics/backlog.md`. Each idea must be **surprising, true, and visualizable**.

## 1. Script  ->  `script.md` + `audio/narration.txt`
- HOOK (0-3s) + 5-7 beats + payoff/CTA. Short spoken sentences.
- **Target ~90-95 words (~30-34s).** Shorter than the visuals (7x5s=35s) so step 6 SPEEDS UP, not
  slows down -> fps stays >=30.
- `narration.txt` = clean paragraph, no tags. Spell out numbers that could be misheard, and AVOID
  adjacency like "found one fifty" (ASR hears "150"). Re-read for number traps.

## 2. Visual prompts  ->  `visual-prompts.md`
One image prompt per beat + the fixed `style_suffix` from config + a motion note. 9:16, one clear
subject, no text in image. Keep the subject consistent across beats for continuity.

## 3. Voiceover  ->  `audio/voiceover.mp3`
`powershell -File tools\tts.ps1 -ScriptFile videos\NNN-slug\audio\narration.txt -Out videos\NNN-slug\audio\voiceover.mp3`

## 4. Stills  ->  Higgsfield `generate_image` x7
model `nano_banana_2`, aspect_ratio "9:16", prompt = beat + style_suffix. Returns a pending job;
poll `job_display` by id (look for status `completed` + `results.rawUrl`). Cheap (~1.5 cr each) —
fine to fire all 7 at once (image concurrency is higher than video).

## 5. Animate  ->  Higgsfield `generate_video` x7
model `cinematic_studio_video`, duration 5, sound:false, aspect "9:16",
`medias:[{role:"start_image", value:"<image job_id>"}]`, prompt = the motion note.
- **Submit in waves of 2 (Starter) or 6 (Plus).** Extra concurrent jobs fail AND get charged.
- If a call returns a `preset_recommendation` notice, resubmit with
  `declined_preset_id:"<id from notice>"` (and reword to drop trigger words like "in the dark").
- Poll `job_display`; collect each clip's `results.rawUrl`.

## 6. Assemble (Pika) -> `final/short.mp4`
1. `edit_concat` { video_urls:[7 clip urls], target_aspect:"9:16", fit:"cover", target_fps:30 }
   -> ~35.3s concat.
2. Upload the local VO with `upload_asset` (get presigned), PUT the bytes, then `probe_media` it.
   `probe_media` the concat too.
3. `edit_speed` { video_url: concat, factor: concat_dur / vo_dur }  (≈1.05–1.18, a SPEED-UP).
4. `edit_audio_mix` { video_url: sped, tracks:[ {url:VO, gain_db:0}, {url:music, gain_db:-16} ],
   original_gain_db:-60 }. Music = one `generate_music` (kling-audio, 60s) reused across a batch.
5. `add_captions` { video_url: mixed, style:"hormozi", caption_mode:"auto", position:"middle",
   hint_terms:[odd names] }. **READ the returned transcript for errors.**
6. `edit_reframe` { video_url: captioned, target_aspect:"9:16", fill_mode:"crop" } -> exact 1080x1920.
7. Download to `final/short.mp4`.

## 7. Package -> `final/upload.json` + thumbnail
`upload.json` (ASCII only): `{title, description (with #shorts + hashtags), categoryId:"27",
privacyStatus:"public", tags:[...]}`. Thumbnail: `html_to_png` (a strong frame/bg + bold headline,
consistent accent color), 1080x1920.

## 8. QA
Captions accurate (numbers/names)? <=58s? Audio: VO clear over ducked music? Fix before upload.

## 9. Upload (Composio in WSL)
```
wsl bash -ic "composio execute YOUTUBE_MULTIPART_UPLOAD_VIDEO \
  -d @/mnt/c/.../videos/NNN-slug/final/upload.json \
  --file /mnt/c/.../videos/NNN-slug/final/short.mp4"
```
Add `--dry-run` first to validate. Returns `data.video.id` -> `https://youtube.com/shorts/<id>`.
Record the URL in `topics/backlog.md`.
