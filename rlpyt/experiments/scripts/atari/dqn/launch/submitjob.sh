#!/bin/bash

#SBATCH --time=196:00:00
#SBATCH -p gpu --gres=gpu:1
#SBATCH -n 4
#SBATCH --mem=100G
#SBATCH --account=carney-tserre-condo
#SBATCH -C quadrortx
#SBATCH -J r2d1

# Specify an output file
#SBATCH -o r2d1.out
#SBATCH -e r2d1_err.out

module load anaconda/3-5.2.0
module load cuda/10.1.105
module load gcc/5.4
module load ninja/1.9.0
source activate torch

python launch_atari_r2d1_gpu_breakout.py > out.txt

