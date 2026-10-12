# mocap-audio

Local-first audio experimentation for the Mocap Studio project.

This repository is intentionally narrow: it supports the sound and music exploration work for the workshop scene, especially the selective ticking / silence strategy and any later, creator-approved restrained score experiments.

## Purpose

- keep all audio experiments local and reproducible;
- separate approved sound direction from prototype-generation work;
- support a future score workflow without locking the project into a single AI tool;
- document the realistic minimum stack for our environment.

## Non-negotiable rule

No AI-generated music is treated as approved material unless the creator explicitly approves it. This repository is for exploratory prototyping only.

## Recommended direction

For this project, the realistic path is:

1. keep SOUND-01 as the confirmed baseline: selective ticking, room tone, and silence-led rhythm;
2. treat SOUND-02 as an optional future exploration only when the creator says yes;
3. prototype with local models such as AudioCraft or ComfyUI + audio generation nodes;
4. keep all prompts, seeds, render settings, and reference clips in version control so experiments remain auditable.

## Layout

```text
mocap-audio/
├── README.md
├── .gitignore
├── requirements-audio.txt
├── docs/
│   ├── sound-02-draft.md
│   └── local-audio-stack.md
├── scripts/
│   └── bootstrap_local_audio.sh
├── models/
│   └── README.md
├── outputs/
│   └── README.md
├── playground/
│   └── README.md
└── scratch/
    └── README.md
```

## Local-first stack

### Recommended prototype path

- AudioCraft (best single-tool path for text-to-music experimentation)
- ComfyUI + audio nodes (best flexibility for custom pipelines)
- FFmpeg / Sox / Audacity workflow for cleanup and export

### Secondary tools

- librosa / SoundFile for analysis and reference scripting
- local waveform editors for trimming and mix review
- seeds + prompt logs for experimentation traceability

## Quick start

1. Create a local venv:
   ```bash
   cd /home/rafael/workspace/mocap-studio/mocap-audio
   python3 -m venv .venv
   source .venv/bin/activate
   ```
2. Install the recommended stack:
   ```bash
   pip install -r requirements-audio.txt
   ```
3. Bootstrap the recommended environment with the helper script:
   ```bash
   bash scripts/bootstrap_local_audio.sh
   ```
4. Keep all generated files under `outputs/` and all prompt/config logs under `playground/`.

## Working policy

- Score/underscore prototypes stay clearly labeled as `prototype`, never `approved`.
- Any created music must be matched to a narrative reason, not generated blindly.
- Local open-source tools are preferred over cloud-first tools for reproducibility.
- Prioritize texture, restraint, and silence over a dense score.

## Files to keep in the repo

- prompts and seeds
- reference audio used for mood testing
- rendered concept clips
- evaluation notes for each test
- model notes and environment assumptions

## Future growth

This repo is designed to expand into:

- a small creative brief for score direction,
- prompt catalogs for restrained underscore,
- a local sample library,
- evaluation notes on mood fit,
- a reproducible render/export workflow for the final scene.
# mocap-audio
