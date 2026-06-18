# Gotchas (learned the hard way — read before producing)

1. **Voice cloning for TTS = ElevenLabs API, not the `clone_voice` MCP.** That MCP only yields
   Kling *video-avatar* voice IDs; `generate_speech` rejects them (Kling-TTS "voice not found",
   MiniMax silently falls back to a stock voice). Clone via ElevenLabs REST with the owner's key.

2. **Animation model = `cinematic_studio_video`, never `kling2_6`.** Kling failed all 7 jobs in one
   batch (params stored `aspect_ratio:null`) and the credits were **NOT refunded** (-35).

3. **Higgsfield concurrency cap.** Starter = 2 concurrent video jobs, Plus = 6. Submitting more
   returns a rate-limit error on the extras — but only after the FIRST batch was charged. Wave it.

4. **Preset hijack.** `generate_video` may return `{notice: preset_recommendation}` instead of a job
   for evocative prompts ("in the dark", "drown in music", rocket launch, etc.). Resubmit with
   `declined_preset_id` from the notice; rewording to drop the trigger phrase also helps.

5. **fps depends on script length.** 7 clips ≈ 35s. If the VO is ~30s you SPEED UP (factor >1) and
   fps rises (>=30, crisp). If the VO is >35s you must SLOW DOWN (factor <1) and fps drops (~21,
   choppy). So write ~30s scripts. `edit_reframe` fixes dimensions but NOT fps.

6. **ASR caption errors.** Always read the `add_captions` transcript. Real example: "found one
   fifty light-years" -> caption "150 light-years" (wrong; it's ~50). Reword the narration, rerun
   `tts.ps1`, and rebuild the audio chain. Use `hint_terms` for brand/technical/proper nouns.

7. **upload.json encoding.** Keep it ASCII (no em-dashes/smart quotes) and pass via `-d @file`.
   Composio `--file` stages the local mp4 into the upload tool's file_uploadable input.

8. **`edit_concat` output is ~1076x1924**, not exactly 1080x1920. Always finish with `edit_reframe`
   target_aspect 9:16 for a clean canonical 1080x1920.

9. **Branding limits.** YouTube API/Composio cannot change channel name, avatar, or banner — only
   videos/playlists/sections/comments. Do branding in Studio (Chrome extension can drive it).
   `file_upload` in the browser only accepts files **attached to the chat**, not project paths.
   Channel banner: keep all text inside the central **1546x423** all-device safe box (stack long
   names onto two lines).

10. **Composio lives in WSL** and is only on the interactive PATH -> `wsl bash -ic "..."`, not
    `bash -lc`. Map Windows paths to `/mnt/c/...`.
