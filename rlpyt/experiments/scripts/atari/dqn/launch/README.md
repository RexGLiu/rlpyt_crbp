interact -t 48:00:00 -n 24 -m 32g -q gpu -g 4 -a carney-tserre-condo -f quadrortx

module load anaconda/3-5.2.0
module load cuda/10.1.105
module load gcc/5.4
module load ninja/1.9.0
source activate torch



