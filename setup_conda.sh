#!/bin/bash

# Install Conda dependencies and activate environment
/opt/conda/bin/conda create -y -c conda-forge --name geant4env geant4
source /opt/conda/bin/activate geant4env