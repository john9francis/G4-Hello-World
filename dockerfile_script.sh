#!/bin/bash

# make a build dir
mkdir dockerbuild
cd dockerbuild

# activate geant4 environment
conda activate geant4env

# Cmake the project
cmake ..
make
make install

echo "done"