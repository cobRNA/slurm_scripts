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

# Dont run this, it will add trash in .bashrc and probably is not necessary
# If necessary, comment out conda lines in .bashrc and run steps below
#$MINICONDA_DIR/bin/conda init bash

# Add to PATH
echo "# Add conda to PATH" >> $HOME/.bashrc
echo -e "export PATH=$MINICONDA_DIR/bin:\$PATH" >> $HOME/.bashrc

# Reload .bashrc
source $HOME/.bashrc

# To disable starting conda with (base) env run this:
#conda config --set auto_activate_base false
