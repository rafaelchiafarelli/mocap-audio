# Local audio stack for mocap-audio

## Executive recommendation

For this project, the most realistic and maintainable local path is:

- **Primary**: AudioCraft for short, restrained generative music tests
- **Secondary**: ComfyUI for custom audio generation pipelines and prompt iteration
- **Utility**: FFmpeg / Sox / Audacity for trimming, conversion, and quick listening review

This is the best balance of local-run viability, experimentation speed, and ability to keep the project reproducible.

## Option review

| Tool / stack | Local? | Best use | Pros | Risks / caveats |
|---|---|---|---|---|
| AudioCraft | Yes | short text-to-music and ambience prototypes | simple, direct, strong for generative music testing | GPU-heavy, can be resource-intensive |
| ComfyUI + audio nodes | Yes | flexible audio workflows and custom pipelines | customizable, visual, good for iterative testing | more setup and maintenance |
| Stable Audio Open | Potentially yes | local open-model exploration | promising open generative audio route | licensing / compatibility must be checked carefully |
| Bark | Yes | voice or speech experiments | lightweight and flexible | poor fit for restrained score work |
| Cloud tools (Suno/Udio/etc.) | No | quick demos | fast output | not local, not fully reproducible, not ideal for a production pipeline |

## Best-fit recommendation for this project

Because the project wants a restrained score, not an overt or conventional soundtrack, **AudioCraft is the most realistic first target**. It is a direct fit for ambient or low-density generative ideas and can be used to create a temporary score exploration without committing the production process to a specific tool.

The **ComfyUI path** is the best fallback when we want a more customized pipeline or multiple processing steps.

## Environment assumptions

- Linux or WSL2
- Python 3.10 or 3.11
- NVIDIA GPU strongly preferred for practical use
- minimum RAM: 16 GB, preferred: 32 GB
- project should live in a dedicated environment, not the shared system Python

## Concrete install path

### Option 1 — AudioCraft first

```bash
cd /home/rafael/workspace/mocap-studio/mocap-audio
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
python -m pip install torch torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
python -m pip install audiocraft
python -m pip install soundfile librosa ffmpeg-python pydub
```

### Option 2 — ComfyUI pipeline

```bash
cd /home/rafael/workspace/mocap-studio/mocap-audio
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
python -m pip install torch torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
```

Then install ComfyUI from its upstream repository and add any audio generation nodes required for the chosen model.

## Workflow for this project

1. Create a reference mood sheet: room tone, quiet ticking, low harmonic bed, silence beats.
2. Generate 10–30 second concept clips only.
3. Keep a log of prompt + seed + model version + runtime.
4. Rate each clip for fit with the workshop scene.
5. Drop any output that feels like a trailer or a full score.
6. Treat the winner as a prototype, not a final cue.

## Model selection principle

The model choice should optimize for:

- restrained texture,
- low energy,
- minimal melodic certainty,
- a sense of room / time / stillness,
- short, controllable segments.

The goal is not “big music”; it is “quiet narrative support.”

## Best use in this film

The ideal result is not a dramatic theme song. It is a subtle, minimal cue that makes the audience feel the weight of time without overpowering the monologue or the room.

That fits the current design principles and keeps the sound track aligned with the creator’s direction.
