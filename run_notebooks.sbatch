#!/bin/bash
#SBATCH --job-name=keras_hw
#SBATCH --account=YOUR_ACCOUNT          # replace: run `my_accounts` on Great Lakes to see yours
#SBATCH --partition=gpu
#SBATCH --gpus=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=32G
#SBATCH --time=02:00:00
#SBATCH --output=logs/%x-%j.out

set -e
cd "$SLURM_SUBMIT_DIR"

PY="$HOME/.conda/envs/ece-5831-2026/bin/python"   # full path so the shared anaconda module can't take over
"$PY" -c "import tensorflow as tf; print('TF', tf.__version__, tf.config.list_physical_devices('GPU'))"

nvidia-smi || echo "No GPU visible"

# run each notebook top to bottom with the env's kernel and save outputs into the same file
for nb in Two_layer_net.ipynb CNN_cat_dog.ipynb; do
    "$PY" -m jupyter nbconvert --to notebook --execute --inplace \
        --ExecutePreprocessor.kernel_name=ece-5831-2026 --ExecutePreprocessor.timeout=-1 "$nb"
done

echo "Done"
