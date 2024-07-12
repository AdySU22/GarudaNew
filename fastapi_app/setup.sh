#!/bin/sh

# UV installation
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.cargo/env

# Miniconda installation
mkdir /home/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_24.4.0-0-Linux-x86_64.sh -O /home/miniconda3/miniconda.sh
bash /home/miniconda3/miniconda.sh -b -u -p /home/miniconda3
rm -rf /home/miniconda3/miniconda.sh
/home/miniconda3/bin/conda init bash

# Set alias
echo "alias v='uv pip install -p \$(which python)'" >> /root/.bashrc

# Apply bashrc
source /root/.bashrc
