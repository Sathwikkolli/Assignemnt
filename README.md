# Keras Neural Network and CNN

| Notebook | Task |
|---|---|
| `Two_layer_net.ipynb` | `TwoLayerNetKeras` on MNIST (train + test) |
| `CNN_cat_dog.ipynb` | CNN for cat vs. dog, 10 epochs, validation + test, prediction examples |

`data_from_kaggle.zip` (570 MB) is not in git; copy it into this folder with `scp`. The CNN notebook unzips it and builds `dataset/train`, `dataset/validation` (80/20 split of the original train folder) and `dataset/test`.

## Run on Great Lakes

```bash
git clone <repo-url> ece5831_keras_hw
cd ece5831_keras_hw
# from your laptop: scp data_from_kaggle.zip <uniqname>@greatlakes.arc-ts.umich.edu:~/ece5831_keras_hw/
bash setup_env.sh                 # one time only
sbatch run_notebooks.sbatch       # set --account first
squeue -u $USER
tail -f logs/keras_hw-<jobid>.out
```

When the job finishes, both notebooks contain their outputs. Commit and push them.
