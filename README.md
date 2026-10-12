# mocap-audio

Local-first audio experimentation for the Mocap Studio project.

This repository is the audio workhorse: reusable tools and a local stack for sound and music exploration. It is film-agnostic. Each film's sound decisions, cue maps and briefs live in that film's project root (e.g. `<project-root>/analysis/work/`), and render outputs from this stack are written for a named project and task, never kept here as film material.

## Purpose

- keep all audio experiments local and reproducible;
- separate approved sound direction from prototype-generation work;
- support a future score workflow without locking the project into a single AI tool;
- document the realistic minimum stack for our environment.

## Non-negotiable rule

No AI-generated music is treated as approved material unless the creator explicitly approves it. This repository is for exploratory prototyping only.

## Recommended direction

1. start from the film's creator-approved sound direction (its sound map / cue sheet in the project root);
2. explore generative audio only when that film's creator asks for it;
3. pick the generator from the survey in [`docs/local-audio-stack.md`](docs/local-audio-stack.md): ACE-Step 1.5 (music), MOSS-SoundEffect (effects, ambience), Chatterbox / Kokoro (voice); foley-from-picture and stem separation have no allowed model yet;
4. use only models whose **weights** license allows commercial use (no `-NC`, not even for tests), and log prompt, seed, model version and license for every run.

## Layout

```text
mocap-audio/
├── README.md
├── .gitignore
├── requirements-audio.txt
├── docs/
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

## Quick start

```bash
bash scripts/bootstrap_local_audio.sh   # Python 3.12 .venv with shared utilities only
```

Each generator is installed in its own environment with the CUDA 12.8 torch
build, because generators pin conflicting torch versions. Weights go to
`/mnt/g/mocap-studio-downloads/models/`, never into git.

## Working policy

- Score/underscore prototypes stay clearly labeled as `prototype`, never `approved`.
- Any created music must be matched to a narrative reason, not generated blindly.
- Local open-source tools are preferred over cloud-first tools for reproducibility.
- Non-commercial or capped licenses are never used, not even for private tests.

## Files to keep in the repo

- prompts and seeds
- reference audio used for mood testing
- rendered concept clips
- evaluation notes for each test
- model notes and environment assumptions

## Future growth

Each of these becomes a task when a film needs it:

- one pinned environment (Dockerfile + hashed lockfile) per adopted generator,
- a run-log format shared with the dashboard,
- reusable prompt catalogs by sound category (ambience, foley, underscore),
- a reproducible render/export workflow to the film's delivery format.
