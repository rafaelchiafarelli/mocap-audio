#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "==> Creating local virtual environment"
python3 -m venv .venv
source .venv/bin/activate

python -m pip install --upgrade pip setuptools wheel

echo "==> Installing core audio and ML packages"
python -m pip install \
  numpy \
  scipy \
  soundfile \
  librosa \
  pydub \
  ffmpeg-python \
  pyyaml \
  tqdm \
  transformers \
  accelerate \
  diffusers \
  huggingface-hub \
  sentencepiece \
  pandas \
  matplotlib \
  seaborn \
  pytest \
  black \
  ruff

echo "==> Installing PyTorch + TorchAudio"
python -m pip install \
  torch \
  torchaudio \
  --index-url https://download.pytorch.org/whl/cu121

echo "==> Installing AudioCraft"
python -m pip install audiocraft

cat <<'EOF'

Bootstrap complete.

Next steps:
1. Put your reference audio and prompt notes under ./playground/
2. Test a single short prompt before generating longer clips
3. Archive every rendering in ./outputs/
4. Keep scores clearly labeled as prototype-only

Recommended local flow:
- AudioCraft for first short constrained experiments
- ComfyUI for more custom pipeline experiments if needed
EOF
