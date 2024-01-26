# slurm_scripts
Slurm scripts to schedule most common computational tasks on HPC cluster.



## guppy_5h.sh
Usage:
sbatch --job-name=g5h_2-4cell_TSO --export=INPUT_DIR="/mnt/storage_4/home/klug3/pl0203-01/project_data/MK/20230817/20230817_DR_2-4cell_TSO_PRECAP/fast5",OUTPUT_DIR="/mnt/storage_4/home/klug3/pl0203-01/project_data/MK/20230817/20230817_DR_2-4cell_TSO_PRECAP/output",CONFIG="/mnt/storage_4/home/klug3/pl0203-01/project_data/soft/ont-guppy/data/dna_r9.4.1_450bps_sup.cfg" guppy_6h.sh
