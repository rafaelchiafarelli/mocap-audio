# Local audio stack: open-source generation survey

**Surveyed 2026-10-11.** Licenses change. Re-check a project's LICENSE and
model card before its output goes into a film, and record the version you
checked in the run log.

## The two rules that decide everything

1. **The weights' license, not the code's.** Several projects ship MIT code
   with non-commercial weights. A film we may sell or screen needs weights
   that allow commercial use. Non-commercial models are fine for private
   reference tests only, and their output never goes into a deliverable.
2. **The Mocap Studio environment.** Python 3.12, CUDA 12.8 torch wheels
   (`DEPENDENCIES.md`), RTX 4080 with 16 GB. Each generator pins its own torch,
   so **each generator gets its own isolated environment** (container or venv).
   Don't install two generators into one environment.

## Recommendation by need

| Need | First choice | Why | Fallback |
|---|---|---|---|
| Music / score | **ACE-Step 1.5** | MIT code; Python 3.11–3.12; < 4 GB VRAM for the turbo model; 10 s–10 min; repainting (regenerate a section), LoRA training, 50+ languages with lyrics | Stable Audio Open (short textures, no vocals) |
| Sound effects, ambience, room tone | **MOSS-SoundEffect v2.0** | Apache-2.0 per its Hugging Face tags; 48 kHz, up to 30 s, English/Chinese prompts | **Stable Audio Open 1.0**: 44.1 kHz stereo, up to 47 s, strongest on SFX/field recordings; Stability AI Community License |
| Foley synced to picture (video → audio) | **HunyuanVideo-Foley** | Generates sound from the rendered shot itself. Tencent Hunyuan Community License: commercial use allowed (licence needed above 100 M MAU); **not licensed in the EU, UK or South Korea**; outputs may not be used to train other models | MMAudio: about 6 GB VRAM, 8 s default, but **CC-BY-NC weights** (reference tests only) |
| Dialogue / temp voice | **Chatterbox** (Resemble AI) | MIT; voice cloning from a few seconds; `exaggeration` emotion control; multilingual model with a **Brazilian Portuguese** pack; every file is watermarked (Perth), which keeps synthetic audio identifiable | Kokoro (Apache-2.0, fixed voices, no cloning) for scratch narration |
| Stem separation (reference tracks, cleanup) | **audio-separator** | MIT Python package wrapping the UVR model zoo (incl. RoFormer-class models) | Demucs: MIT but no longer actively maintained by its author |
| Conversion, trimming, listening | FFmpeg, SoX, Audacity | Already in the house stack | — |

## Not recommended as a base

| Project | Why not |
|---|---|
| **AudioCraft** (MusicGen, AudioGen) | Requires Python 3.9 + PyTorch 2.1 (conflicts with 3.12 / cu128), and its weights are CC-BY-NC 4.0. This was the earlier "primary" pick, now replaced by ACE-Step 1.5. |
| MusicGen Stereo, YuE2 | Non-commercial weights. |
| F5-TTS, IndexTTS-2, Higgs Audio v3 | Strong voices, but checkpoints are non-commercial or "contact us" for commercial use. |
| Coqui XTTS-v2 | Weight license restricts commercial use. |

Not checked yet: DiffRhythm, TangoFlux, AudioLDM 2, CosyVoice 2. Survey
them before adopting.

## Voice cloning and consent

Cloning a real person's voice, including an actor's, needs that person's
documented consent for the specific film, the same rule as actor face data in
the capture pipeline. Keep the consent reference in the run log. Prefer
watermarked generators for any synthetic dialogue.

## How an experiment is run

1. Start from the film's approved sound direction (its sound map or cue
   sheet in the project root). This repository holds no film's direction.
2. Generate short clips first (10–30 s).
3. Log every run: project root, task ID, model name and version, weights
   license checked, prompt, seed, settings, runtime.
4. Write outputs under the film's project root, or under `outputs/` here
   only for tool tests with neutral prompts.
5. Every generated clip is labelled `prototype` until the film's creator
   approves it.

## Where things live

- Model weights: `/mnt/g/mocap-studio-downloads/models/<name>/<version>/`
  with SHA256 (`DEPENDENCIES.md`, section D), never in git.
- Generator environments: one per generator, pinned. Turning each one into a
  Dockerfile with a hashed lockfile is a task to scope when a generator is
  actually adopted.

## Sources

- ACE-Step 1.5: https://github.com/ace-step/ACE-Step-1.5
- MOSS-SoundEffect: https://huggingface.co/OpenMOSS-Team/MOSS-SoundEffect
- Stable Audio Open 1.0: https://huggingface.co/stabilityai/stable-audio-open-1.0
- HunyuanVideo-Foley license: https://github.com/Tencent-Hunyuan/HunyuanVideo-Foley/blob/main/LICENSE
- MMAudio: https://github.com/hkchengrex/MMAudio
- Chatterbox: https://github.com/resemble-ai/chatterbox
- AudioCraft: https://github.com/facebookresearch/audiocraft
- TTS license overview (secondary): https://localaimaster.com/blog/best-local-tts-models
- Separation overview (secondary): https://stemsplit.io/blog/free-stem-separation-software
