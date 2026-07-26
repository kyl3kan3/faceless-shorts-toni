# Composio — publishing & distribution (in-session MCP)

Composio is the **distribution** layer for Learn With Willow: it does NOT make videos
(that's Pika / Higgsfield / ElevenLabs). It publishes the finished episodes and pulls
analytics, via an MCP server wired into this Claude Code environment.

## What it can do for us
| Platform | Composio support | Reality check |
|---|---|---|
| **YouTube** | `Upload Video` (local file) + channel stats, playlists, captions, comments | ✅ Best fit. ⚠️ **Must** set `selfDeclaredMadeForKids = true` (COPPA). Verify the upload tool exposes it; if not, set it via YouTube API/Studio immediately after upload. |
| **TikTok** | `Publish video` (from public URL), `Upload video`, publish status, stats | ✅ but the TikTok Content Posting API requires an **approved** developer app; unaudited apps can only post **private/draft**. |
| **Instagram** | create + publish media container | ✅ **Business/Creator accounts only**; needs a Meta app + content-publishing review. |
| **Facebook** | not confirmed | ❓ TBD — no clear posting toolkit found. |

## Activate it (one-time)
1. Create a Composio account and get an **API key** → app.composio.dev
2. **Connect accounts** in Composio (OAuth): YouTube (Google), and TikTok / Instagram-Business if cross-posting.
3. Create a **Tool Router / MCP server** in Composio scoped to those toolkits → copy its **MCP URL**.
4. In this Claude Code web environment, add two **environment secrets** (Settings → env;
   do NOT paste them in chat):
   - `COMPOSIO_API_KEY`
   - `COMPOSIO_MCP_URL`
5. **Start a new session.** The committed [`.mcp.json`](../.mcp.json) wires Composio in as
   an MCP server (`type: http`, `X-API-Key` header), so the agent gets Composio's tools
   in-session. Approve the server's trust prompt.

Equivalent CLI (instead of env vars): `claude mcp add --transport http composio "<MCP_URL>" --headers "X-API-Key:<API_KEY>"` then restart.

## Publishing flow (once active)
1. Render the episode (existing pipeline) → `assets/preview/epNNN-*.mp4`.
2. Composio `YOUTUBE_UPLOAD_VIDEO` with title/description/tags from the episode folder,
   `categoryId: 27`, **made-for-kids = true**.
3. (Optional) push to TikTok/IG once their app approvals are in place.
4. Composio analytics tools → log views/retention back to `topics/` to steer the roadmap.

## Sources
- Composio + Claude Code: https://composio.dev/toolkits/composio/framework/claude-code
- YouTube toolkit: https://composio.dev/toolkits/youtube
- TikTok toolkit: https://docs.composio.dev/toolkits/tiktok
- Instagram toolkit: https://docs.composio.dev/toolkits/instagram
