#!/bin/bash
#SBATCH --mem=250G
#SBATCH --gres=gpu:8
#SBATCH --partition=tesla
#SBATCH --time=100:00:00

# Unload all loaded modulefiles
module purge

# Load CUDA module
module load cuda/11.8.0_520.61.05

# Set absolute PATHs
#export PATH=${HOME}${SLURM_JOB_ACCOUNT}

export GUPPY_PATH=${HOME}/pl0203-01/project_data/soft/ont-guppy/bin/guppy_basecaller
export ABS_INPUT_DIR=${HOME}/pl0208-01/${INPUT_DIR}
export ABS_OUTPUT_DIR=${HOME}/pl0208-01/${OUTPUT_DIR}
export ABS_CONFIG=${HOME}/pl0203-01/project_data/soft/ont-guppy/data/${CONFIG}

# Check loaded CUDA version
nvcc --version 

# Perform calculations
$GUPPY_PATH -i ${ABS_INPUT_DIR} \
--save_path ${ABS_OUTPUT_DIR} \
-c ${ABS_CONFIG} \
--min_qscore 9 \
--compress_fastq \
-x cuda:all:100% \
--chunks_per_runner 1024

# Footer
cat << EOF
-------------------------------------------------------------------------------

End of calculations [$(date)].

-------------------------------------------------------------------------------
EOF


