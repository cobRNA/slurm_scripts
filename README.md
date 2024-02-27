# slurm_scripts

Slurm scripts to schedule most common computational tasks on HPC cluster.

## guppy_48h.sh

Usage:

`sbatch --job-name=Ovary_CapTrap_POSTCAP --export=INPUT_DIR="scratch/MK1/20220614_DR_Ovary_CapTrap_POSTCAP_SS500/fast5",OUTPUT_DIR="scratch/MK1/20220614_DR_Ovary_CapTrap_POSTCAP_SS500/fastq",CONFIG="dna_r9.4.1_450bps_sup.cfg" guppy_48h.sh`
