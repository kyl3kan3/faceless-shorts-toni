# One-time setup (per machine / channel)

## 1. ElevenLabs voice (the narration voice)
The owner's voice is cloned ONCE and reused across all videos/concepts.
- Requires an ElevenLabs account on a **paid plan** (Instant Voice Cloning is not on free).
- Get an API key (Profile -> API Keys). Save it to the project's `.env` as a raw `sk_...` token
  (a file `.env` or a folder `.env\.env.txt` both work; `tts.ps1` finds the `sk_` token either way).
- Record a clean **20-40s** voice sample (quiet room, natural narration energy), export mp3/m4a.
- Clone it via the **ElevenLabs REST API** (NOT the `clone_voice` MCP — that only makes Kling
  video-avatar voices that text-to-speech rejects):

```powershell
$KEY = [regex]::Match((Get-Content .env\.env.txt -Raw),'sk_[A-Za-z0-9_-]{20,}').Value
# verify plan allows cloning:
Invoke-RestMethod -Uri 'https://api.elevenlabs.io/v1/user/subscription' -Headers @{'xi-api-key'=$KEY}
# clone (returns voice_id):
curl.exe -s -X POST "https://api.elevenlabs.io/v1/voices/add" -H "xi-api-key: $KEY" `
  -F "name=Narrator" -F "files=@C:\path\to\sample.m4a;type=audio/mp4"
```
Put the returned `voice_id` into `channel/config.json` -> `models.tts_voice_id`. Test with `tts.ps1`.

## 2. Higgsfield (visuals)
- A Higgsfield account/credits (Starter or Plus). ~46 credits per finished video.
- Plus raises concurrency from 2 -> 6 video jobs and is worth it for batching.
- Top up via the `show_plans_and_credits` widget when low.

## 3. Composio CLI (YouTube upload) — lives in WSL
- Installed in WSL; only on the **interactive** PATH, so call it with `wsl bash -ic "..."`
  (NOT `bash -lc`). Windows paths map to `/mnt/c/...`.
- `composio whoami` should show the logged-in account; `composio search "upload video to youtube"
  --toolkits youtube` confirms the channel is connected (`connected_toolkits: ["youtube"]`).
- If not connected: `composio link youtube` (browser OAuth).

## 4. Optional: Claude Chrome extension (for channel branding)
Only needed to set the channel **name / picture / banner / bio** (the YouTube API can't).
Install + connect the extension, log into YouTube, then drive Studio. Image uploads require the
file to be **attached to the chat** (the browser `file_upload` rejects raw project paths).
