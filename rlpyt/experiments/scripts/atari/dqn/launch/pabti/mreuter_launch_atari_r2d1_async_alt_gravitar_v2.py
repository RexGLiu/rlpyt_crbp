
from rlpyt.utils.launching.affinity import encode_affinity
from rlpyt.utils.launching.exp_launcher import run_experiments
from rlpyt.utils.launching.variant import make_variants, VariantLevel
from rlpyt.utils.logging import logger

logger.log('Executing mreuter_launch_atari_r2d1_async_alt_gravitar_v2.py...')

script = "/gpfs/data/tserre/akarkada/drl/rlpyt/rlpyt/experiments/scripts/atari/dqn/train/atari_r2d1_async_alt.py"
affinity_code = encode_affinity(
    n_cpu_core=24,
    n_gpu=4,
    async_sample=True,
    gpu_per_run=1,
    sample_gpu_per_run=2,
    # hyperthread_offset=24,
    # optim_sample_share_gpu=True,
    n_socket=1,  # Force this.
    alternating=True,
)
runs_per_setting = 1
experiment_title = "atari_r2d1_async_alt"
variant_levels = list()

games = ["gravitar"]
values = list(zip(games))
dir_names = ["{}".format(*v) for v in values]
keys = [("env", "game")]
variant_levels.append(VariantLevel(keys, values, dir_names))

variants, log_dirs = make_variants(*variant_levels)
print("asdf asdf asdf: ", log_dirs)

default_config_key = "async_alt_pabti"

logger.log('Running experiments...')
run_experiments(
    script=script,
    affinity_code=affinity_code,
    experiment_title=experiment_title,
    runs_per_setting=runs_per_setting,
    variants=variants,
    log_dirs=log_dirs,
    common_args=(default_config_key,),
)
