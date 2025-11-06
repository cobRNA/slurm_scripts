#!/usr/bin/env bash

# DON'T FORTGET TO INSERT YOUR GRANT_ID!!!!
# run within interactive shell:
# srun --pty /bin/bash
# source: https://wiki.man.poznan.pl/kdm/Instalacja_Conda_z_poziomu_u%C5%BCytkownika

GRANT_ID="pl0203-01"
SOFT_PATH="tomek/soft/miniconda3"
REAL_PATH=$(realpath "$HOME""$GRANT_ID""/project_data")
MINICONDA_DIR="$REAL_PATH""$SOFT_PATH"
mkdir -p $MINICONDA_DIR
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $MINICONDA_DIR/miniconda.sh
bash $MINICONDA_DIR/miniconda.sh -b -u -p $MINICONDA_DIR
rm -rf $MINICONDA_DIR/miniconda.sh

# To make conda work you can:
# 1. bloat .bashrc and slow down your startup significantly
# 2. add path to conda manually and run `source activate base` when working conda is needed

####### FIRST WAY:
######################
# bloat .bashrc and wish for the best:
#$MINICONDA_DIR/bin/conda init bash

# disable starting conda with (base) env run this:
#conda config --set auto_activate_base false

# Didn't help to speed up starting time in my case

####### SECOND WAY:
######################
# Add conda to PATH (to make conda commands work)
#echo "# Add conda to PATH" >> $HOME/.bashrc
#echo -e "export PATH=$MINICONDA_DIR/bin:\$PATH" >> $HOME/.bashrc
# Reload .bashrc
#source $HOME/.bashrc

# Now, basic conda commands will work and terminal will work fast, but
# conda activate ENV will not work
# to make it work, run
#source activate base

