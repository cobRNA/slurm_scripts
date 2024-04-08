# DON'T FORTGET TO INSERT YOUR GRANT_ID!!!!
# run within interactive shell:
# srun --pty /bin/bash
# source: https://wiki.man.poznan.pl/kdm/Instalacja_Conda_z_poziomu_u%C5%BCytkownika

GRANT_ID="pl0203-01"
SOFT_PATH="/soft/miniconda3"
REAL_PATH=$(realpath "$HOME""$GRANT_ID""/project_data")
MINICONDA_DIR="$REAL_PATH""$SOFT_PATH"
mkdir -p $MINICONDA_DIR
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $MINICONDA_DIR/miniconda.sh
bash $MINICONDA_DIR/miniconda.sh -b -u -p $MINICONDA_DIR
rm -rf $MINICONDA_DIR/miniconda.sh
$MINICONDA_DIR/bin/conda init bash