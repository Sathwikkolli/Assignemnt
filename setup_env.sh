#!/bin/bash
# one-time setup on Great Lakes: installs packages into the ece-5831-2026 conda env
set -e

PY="$HOME/.conda/envs/ece-5831-2026/bin/python"   # full path so the shared anaconda module can't take over

"$PY" -m pip install --upgrade pip
"$PY" -m pip install -r requirements.txt
"$PY" -m ipykernel install --user --name ece-5831-2026   # kernel used by run_notebooks.sbatch

"$PY" -c "import tensorflow as tf; print('TF', tf.__version__)"
