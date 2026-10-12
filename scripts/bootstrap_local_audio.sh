#!/usr/bin/env bash
# Shared audio utilities only. Generators get their own environment each
# (docs/local-audio-stack.md); weights go to /mnt/g/mocap-studio-downloads/models/.
set -euo pipefail

cd "$(dirname "$0")/.."

PYTHON="${PYTHON:-python3.12}"

echo "==> Creating .venv with $PYTHON"
"$PYTHON" -m venv .venv
.venv/bin/python -m pip install --upgrade pip
.venv/bin/python -m pip install -r requirements-audio.txt

cat <<'MSG'

Shared utilities installed in .venv.

Next: pick a generator from docs/local-audio-stack.md, check its weights
license, and install it in its own environment with the CUDA 12.8 torch build.
MSG
