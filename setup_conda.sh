#!/bin/bash

# Install Conda dependencies and activate environment
/opt/conda/bin/conda create -y -c conda-forge --name geant4env geant4
/opt/conda/bin/conda activate geant4env