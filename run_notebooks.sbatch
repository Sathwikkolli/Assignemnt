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

module load python3.10-anaconda/2023.03
source "$(conda info --base)/etc/profile.d/conda.sh"   # makes `conda activate` work in batch jobs
conda activate ece-5831-2026

nvidia-smi || echo "No GPU visible"

# run each notebook top to bottom and save outputs into the same file
jupyter nbconvert --to notebook --execute --inplace --ExecutePreprocessor.timeout=-1 Two_layer_net.ipynb
jupyter nbconvert --to notebook --execute --inplace --ExecutePreprocessor.timeout=-1 CNN_cat_dog.ipynb

echo "Done"
