---
name: faceless-shorts
description: Produce faceless YouTube Shorts end-to-end for ANY niche/concept — script → cloned voiceover → AI cinematic visuals → captioned 1080x1920 video → public upload. Use when the user wants to start or run a faceless short-form video channel, make explainer/story/motivation/history/science shorts, batch-produce vertical AI videos, clone a voice for narration, or recreate this pipeline for a new concept.
---

# Faceless Shorts — AI video channel pipeline

You orchestrate the whole thing. You write the ideas/scripts/metadata yourself and call
external tools for voice, visuals, assembly, and upload. This skill is **concept-agnostic** —
it works for any niche (educational explainers, motivation, horror, history, "what if", etc.).

## The cast (what does each job)
| Job | Tool (find via ToolSearch by name) | Cost |
|-----|-----|------|
| Ideas / scripts / prompts / metadata | you | free |
| Voiceover (cloned voice) | **ElevenLabs API** via `assets/tts.ps1` (key in project `.env`) | ElevenLabs characters |
| Stills (per beat) | **Higgsfield** `generate_image` (model `nano_banana_2`) | ~1.5 credits each |
| Animate stills → clips | **Higgsfield** `generate_video` (model `cinematic_studio_video`) | ~5 credits / 5s clip |
| Music bed | **Pika** `generate_music` (kling-audio, 60s instrumental) | tiny |
| Concat / speed / mix / captions / reframe | **Pika** `edit_concat`, `edit_speed`, `edit_audio_mix`, `add_captions`, `edit_reframe` | tiny |
| Probe durations | **Pika** `probe_media` | free |
| Upload to YouTube | **Composio CLI in WSL** `YOUTUBE_MULTIPART_UPLOAD_VIDEO` | free |
| Thumbnail / banner / avatar | **Pika** `html_to_png` (crisp text) or `generate_image` | tiny |

MCP server names are hashed per session — locate each tool by its logical name with ToolSearch
(e.g. `select:...generate_image`). Always `get_cost:true`-preflight Higgsfield before generating.

## STEP 0 — Kick off a new concept
Ask the user (or infer) and write it into `channel/config.json` (copy `assets/config.template.json`):
1. **Niche / concept** + audience.
2. **Format** — default YouTube Shorts, vertical **1080x1920, <=58s**.
3. **Voice** — reuse an existing ElevenLabs clone, or clone a new one (see `reference/SETUP.md`).
4. **Visual style** — a fixed "style suffix" appended to every image prompt (keeps a look consistent).
5. **Caption style** — default `hormozi` (bold, centered, yellow word highlight).
Then scaffold: `channel/` (config + bible), `templates/`, `topics/backlog.md`, `videos/`, `tools/tts.ps1`.

## ONE-TIME SETUP (per machine / channel)
See `reference/SETUP.md`. Summary: (a) ElevenLabs paid plan + API key in `.env`, clone the
owner's voice via the API (NOT the `clone_voice` MCP — it only makes video-avatar voices),
save the `voice_id`; (b) Composio CLI logged in + YouTube connected; (c) Higgsfield credits.

## THE PER-VIDEO PIPELINE
Full detail with exact tool-call patterns is in `reference/PIPELINE.md`. The loop:

```
0 PICK topic  ........ from topics/backlog.md
1 SCRIPT (you) ....... aim ~34s / ~95 words so clips SPEED UP to fit (keeps fps >=30).
                       -> videos/NNN-slug/{script.md, audio/narration.txt}
2 VISUAL PROMPTS ..... 7 beats, each = image prompt + style suffix + a motion note.
3 VOICEOVER .......... powershell tools/tts.ps1 -ScriptFile ...narration.txt -Out ...voiceover.mp3
4 STILLS ............. Higgsfield generate_image x7  (9:16). Poll with job_display.
5 ANIMATE ............ Higgsfield generate_video x7 (cinematic_studio_video, 5s, sound:false),
                       start_image = the still's job_id. SUBMIT IN WAVES (see concurrency gotcha).
6 ASSEMBLE (Pika) .... concat 7 clips (target_aspect 9:16) -> probe VO + concat durations ->
                       edit_speed factor = concat_dur / VO_dur -> edit_audio_mix [VO 0dB, music -16dB]
                       -> add_captions (auto, hormozi, middle) -> edit_reframe 9:16 -> download short.mp4
7 PACKAGE ............ write final/upload.json {title,description,categoryId,privacyStatus,tags} (ASCII!)
                       + thumbnail via html_to_png.
8 QA ................ READ the add_captions transcript for wrong numbers/words; check <=58s.
9 UPLOAD ............ wsl bash -ic "composio execute YOUTUBE_MULTIPART_UPLOAD_VIDEO
                       -d @<abs upload.json> --file <abs short.mp4>"  -> public videoId.
```

Cost ≈ **46 Higgsfield credits + ~900 ElevenLabs chars** per finished video.

## CRITICAL GOTCHAS (these cost real money/time if ignored — full list in reference/GOTCHAS.md)
- **Voice:** the `clone_voice` MCP only makes Kling video-avatar voices that TTS rejects. Clone via
  the **ElevenLabs REST API** with the owner's key instead. That voice works with `tts.ps1`.
- **Animation model:** use **`cinematic_studio_video`**, NOT `kling2_6` — Kling failed an entire
  batch of 7 and was **still charged** (no refund).
- **Concurrency cap:** Higgsfield Starter = **2 concurrent video jobs**, Plus = 6. Submitting more
  fails the extras AND charges them. Animate in waves of 2 (or 6).
- **Preset hijack:** `generate_video` sometimes returns a "preset_recommendation" instead of running
  (prompts with "in the dark", "drown in music", rocket, etc.). Resubmit with `declined_preset_id`.
- **fps:** make the script SHORT (~30s) so the 35s of clips SPEED UP to fit (fps goes >=30). A long
  script forces a slow-down and drops fps (choppy). Speed-up good, slow-down bad.
- **Captions:** always read the returned transcript — ASR mishears numbers ("one fifty" -> "150").
  Reword the narration and regenerate the VO before publishing. Pass `hint_terms` for odd names.
- **upload.json:** keep it ASCII (no em-dashes / smart quotes) and pass via `-d @file` to dodge
  shell/encoding errors. Composio `--file` injects the local video into the upload tool.
- **Branding:** YouTube API/Composio CANNOT rename a channel or set avatar/banner. Do those in
  Studio. If the Claude Chrome extension is connected you can drive Studio (name+description work
  via the form; for image uploads the file must be **attached to the chat** — `file_upload` rejects
  raw project paths). Channel banner text must sit inside the central **1546x423** safe box.

## Resuming / batching
Each video is a self-contained `videos/NNN-slug/` folder, so a stopped batch resumes from whatever
exists. For "make N more", loop the pipeline; check Higgsfield `balance` first (~46/video).
