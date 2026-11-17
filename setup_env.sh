#!/bin/bash
# one-time setup on Great Lakes: creates ~/keras_hw_env with TensorFlow (GPU) + Jupyter
set -e

module load python
python3 -m venv ~/keras_hw_env
source ~/keras_hw_env/bin/activate

pip install --upgrade pip
pip install -r requirements.txt

python -c "import tensorflow as tf; print('TensorFlow', tf.__version__)"
