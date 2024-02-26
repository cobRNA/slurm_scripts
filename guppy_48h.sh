#!/bin/bash
#SBATCH --mem=250G
#SBATCH --gres=gpu:8
#SBATCH --partition=tesla
#SBATCH --time=48:00:00
#SBATCH --mail-type=BEGIN,END

# Unload all loaded modulefiles
module purge

# Load CUDA module
module load cuda/11.8.0_520.61.05

# Set absolute PATHs
export PATH=${HOME}${SLURM_JOB_ACCOUNT}

export GUPPY_PATH=${PATH}/project_data/soft/ont-guppy/bin/guppy_basecaller
export ABS_INPUT_DIR=${PATH}/${INPUT_DIR}
export ABS_OUTPUT_DIR=${PATH}/${OUTPUT_DIR}
export ABS_CONFIG=${PATH}/project_data/soft/ont-guppy/data/${CONFIG}

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


