#!/bin/bash

# make a build dir
mkdir dockerbuild
cd dockerbuild

# activate geant4 environment
conda activate geant4env

# Cmake the project
conda run -n geant4env cmake .. CMAKE_PREFIX_PATH=/opt/miniconda3/envs/geant4env/lib/Geant4
make
make install

echo "done"