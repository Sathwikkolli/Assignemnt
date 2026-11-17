#!/bin/bash
# one-time setup on Great Lakes: adds the needed packages to the ece-5831-2026 conda env
set -e

module load python3.10-anaconda/2023.03
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate ece-5831-2026

pip install -r requirements.txt

python -c "import tensorflow as tf; print('TensorFlow', tf.__version__)"
