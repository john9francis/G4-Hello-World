#!/bin/bash

# We're starting off in the app/ dir
# and the whole cmake project is copied into it.

echo $PATH

# Add conda-forge channel to find geant4 and other 
# dependencies faster
conda config --add channels conda-forge

# Create conda geant4 environment
# and install geant4 in it
conda create -c conda-forge --name geant4env geant4