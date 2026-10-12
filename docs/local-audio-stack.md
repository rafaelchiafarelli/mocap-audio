# Local audio stack: open-source generation survey

**Surveyed 2026-10-11.** Licenses change. Re-check a project's LICENSE and
model card before its output goes into a film, and record the version you
checked in the run log.

## The rules that decide everything

1. **Only licenses Rafael can profit from** (decided 2026-10-12). The films
   must be sellable, so code, **weights** and assets need an open/free license
   that allows commercial use (MIT, Apache-2.0, BSD, CC0, CC-BY; GPL-family for
   tools). Non-commercial (`-NC`), research-only and capped "community"
   licenses are **not used at all, not even for private tests**. Several
   projects ship MIT code with restricted weights, so check the weights.
2. **The Mocap Studio environment.** Python 3.12, CUDA 12.8 torch wheels
   (`DEPENDENCIES.md`), RTX 4080 with 16 GB. Each generator pins its own torch,
   so **each generator gets its own isolated environment**.
3. **Local generation is allowed for audio** (decided 2026-10-12). This repo
   covers recording, editing, analysis and generation.

## Recommendation by need

| Need | Choice | License (checked 2026-10-12) | Notes |
|---|---|---|---|
| Music / score | **ACE-Step 1.5** | MIT code and weights; model card: generated music may be used commercially | Python 3.11–3.12; < 4 GB VRAM (turbo); 10 s–10 min; repainting, LoRA |
| Sound effects, ambience, room tone | **MOSS-SoundEffect** | Apache-2.0 (Hugging Face tag) | 48 kHz, up to ~30 s, English/Chinese prompts |
| Dialogue / temp voice | **Chatterbox** (Resemble AI) | MIT code and weights | Cloning, `exaggeration` emotion control, Brazilian Portuguese pack, Perth watermark |
| Scratch narration | **Kokoro** | Apache-2.0 | Fixed voices, no cloning, fast |
| Foley synced to picture | **gap: no allowed model** | — | HunyuanVideo-Foley (capped, territory-excluded community license) and MMAudio (CC-BY-NC weights) are excluded. Use MOSS-SoundEffect clips placed by hand, or record foley |
| Stem separation | **gap: weights license unclear** | — | Demucs/HTDemucs: MIT tag on Hugging Face, but the weights are reported elsewhere as research-only/CC-BY-NC and the author hasn't clarified. UVR models (via audio-separator) carry mixed licenses. Don't use until one is confirmed |
| Recording and editing | **Ardour** or **Audacity**; **FFmpeg**, **SoX** | GPL / LGPL (tools; outputs are yours) | DAW choice still open |
| Analysis | `librosa`, `soundfile`, `scipy` | ISC / BSD | Shared utilities in `.venv` |

## Excluded by the license rule

| Project | Why |
|---|---|
| AudioCraft (MusicGen, AudioGen), MusicGen Stereo | CC-BY-NC 4.0 weights (also Python 3.9 + torch 2.1) |
| Stable Audio Open | Stability AI Community License: free use only below a revenue cap |
| HunyuanVideo-Foley | Tencent Hunyuan Community License: not licensed in the EU, UK or South Korea, licence needed above 100 M MAU, outputs may not train other models |
| MMAudio | CC-BY-NC 4.0 weights |
| YuE2, F5-TTS, IndexTTS-2, Higgs Audio v3, Coqui XTTS-v2 | Non-commercial or "contact us" weights |

Not checked yet: DiffRhythm, TangoFlux, AudioLDM 2, CosyVoice 2. Check the
weights license first; most academic audio checkpoints are non-commercial.

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
- ACE-Step 1.5 model card: https://huggingface.co/ACE-Step/Ace-Step1.5
- Chatterbox model card: https://huggingface.co/ResembleAI/chatterbox
- HTDemucs weights license discussion: https://huggingface.co/adefossez/HTDemucs/discussions/1
- TTS license overview (secondary): https://localaimaster.com/blog/best-local-tts-models
- Separation overview (secondary): https://stemsplit.io/blog/free-stem-separation-software
