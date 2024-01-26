#!/bin/bash
#SBATCH --mem=90G
#SBATCH --gres=gpu:2
#SBATCH --partition=tesla
#SBATCH --time=5:00:00
#SBATCH --mail-type=BEGIN,END

# Load CUDA module
module load cuda/11.8.0_520.61.05

# Test modules
module avail > /mnt/storage_4/home/klug3/pl0203-01/project_data/scripts/modules.txt

# Perform calculations
/mnt/storage_4/home/klug3/pl0203-01/project_data/soft/ont-guppy/bin/guppy_basecaller -i ${INPUT_DIR} \
--save_path ${OUTPUT_DIR} \
-c ${CONFIG} \
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


