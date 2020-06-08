#!/bin/bash

#SBATCH --time=196:00:00
#SBATCH -p gpu --gres=gpu:4
#SBATCH -n 24
#SBATCH --mem=100G
#SBATCH --account=carney-tserre-condo
#SBATCH -C quadrortx
#SBATCH -J gravitar2

# Specify an output file
#SBATCH -o gravitar2.out
#SBATCH -e gravitar_err2.out

module load anaconda/3-5.2.0
module load cuda/10.1.105
module load gcc/5.4
module load ninja/1.9.0
source activate torch

python mreuter_launch_atari_r2d1_async_alt_gravitar_v2.py > mreuter_gravitar_out2.txt

