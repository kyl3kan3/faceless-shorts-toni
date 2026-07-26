# tts.ps1 — generate narration in the channel's cloned ElevenLabs voice.
# Copy this into your project's tools/ folder. It reads the API key from <project>/.env
# (never prints it) and voice_id/model from <project>/channel/config.json.
#
# Usage:
#   powershell -File tools\tts.ps1 -ScriptFile videos\001-slug\audio\narration.txt -Out videos\001-slug\audio\voiceover.mp3
#   powershell -File tools\tts.ps1 -Text "A quick line." -Out test.mp3
param(
  [string]$Text,
  [string]$ScriptFile,
  [Parameter(Mandatory = $true)][string]$Out,
  [string]$VoiceId,
  [string]$Model
)
$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$root = Split-Path $PSScriptRoot -Parent

# --- API key (folder .env\.env.txt or a plain .env file; matches an sk_... token) ---
$envFile = Join-Path $root '.env\.env.txt'
if (-not (Test-Path $envFile)) { $envFile = Join-Path $root '.env' }
if (-not (Test-Path $envFile)) { throw "No .env found at $root" }
$KEY = [regex]::Match((Get-Content $envFile -Raw), 'sk_[A-Za-z0-9_-]{20,}').Value
if (-not $KEY) { throw "No ElevenLabs key (sk_...) found in $envFile" }

# --- defaults from config ---
$cfg = Get-Content (Join-Path $root 'channel\config.json') -Raw -Encoding UTF8 | ConvertFrom-Json
if (-not $VoiceId) { $VoiceId = $cfg.models.tts_voice_id }
if (-not $Model)   { $Model   = $cfg.models.tts_model }

# --- text (read as UTF-8 so em-dashes/quotes survive) ---
if ($ScriptFile) { $Text = Get-Content $ScriptFile -Raw -Encoding UTF8 }
if (-not $Text)  { throw "Provide -Text or -ScriptFile" }

$body = @{
  text     = $Text
  model_id = $Model
  voice_settings = @{ stability = 0.5; similarity_boost = 0.8; style = 0; use_speaker_boost = $true }
} | ConvertTo-Json

# --- send body as UTF-8 bytes (PS 5.1 would otherwise corrupt non-ASCII) ---
New-Item -ItemType Directory -Force -Path (Split-Path $Out -Parent) | Out-Null
$bytes = [System.Text.Encoding]::UTF8.GetBytes($body)
Invoke-RestMethod -Uri "https://api.elevenlabs.io/v1/text-to-speech/$VoiceId" `
  -Method Post -Headers @{ 'xi-api-key' = $KEY } -ContentType 'application/json; charset=utf-8' `
  -Body $bytes -OutFile $Out
Write-Output ("Saved {0} ({1:N1} KB) in voice {2}" -f $Out, ((Get-Item $Out).Length / 1KB), $VoiceId)
