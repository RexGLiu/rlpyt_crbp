#!/bin/bash

#SBATCH --time=196:00:00
#SBATCH -p gpu --gres=gpu:8
#SBATCH -n 16
#SBATCH --mem=100G
#SBATCH --account=carney-tserre-condo
#SBATCH -C quadrortx
#SBATCH -J gpu_breakout

# Specify an output file
#SBATCH -o async_gpu.out
#SBATCH -e async_gpu_err.out

module load anaconda/3-5.2.0
module load cuda/10.1.105
module load gcc/5.4
module load ninja/1.9.0
source activate torch

python breakout_example_7.py > out.txt

