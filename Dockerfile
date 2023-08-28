# syntax=docker/dockerfile:1

FROM ubuntu:20.04

# install miniconda
RUN apt update && apt install -y wget

# Download and install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod +x Miniconda3-latest-Linux-x86_64.sh && \
    ./Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh

## TESTING... WHERE IS THE CONDA DIR???
#
## Set the working directory inside the container
#WORKDIR /app
#
## Copy the CMake project files into the container
#COPY . .
#
## Copy the shell script into the container
#COPY test.sh /app/test.sh
#
## Make the shell script executable
#RUN chmod +x /app/dockerfile_script.sh
#
## Set the entry point to run the shell script
#ENTRYPOINT ["/bin/bash", "/app/test.sh"]
#

# Add conda to PATH
ENV PATH="/opt/conda/bin:$PATH"
#RUN echo 'export PATH="$PATH:\opt\conda\bin"' >> ~/.bashrc && \
#    source ~/.bashrc

# Update conda, add conda-forge channel, and clean cache
RUN conda update -y conda && \
    conda config --add channels conda-forge && \
    conda clean -y -all

# Create conda geant4 environment and install geant4 in it
RUN conda create -y -c conda-forge --name geant4env geant4

# DEPENDENCIES
# conda dependencies
RUN conda install -y -c conda-forge \
    make \
    cmake \
    compilers \
    sed \
    mesa-libgl-devel-cos6-x86_64 \
    mesa-dri-drivers-cos6-x86_64 \
    libselinux-cos6-x86_64 \
    libxdamage-cos6-x86_64 \
    libxxf86vm-cos6-x86_64 \
    python=3.9 \
    boost=1.72.0 \
    clhep=2.4.4.0 \
    expat \
    freetype \
    libglu \
    qt=5.12 \
    xerces-c \
    xorg-libx11 \
    xorg-libxfixes \
    xorg-libxmu \
    zlib \
    xorg-libxfixes \
    libxext-cos6-x86_64


# apt dependencies
RUN apt install -y \
    libgl1-mesa-glx \
    libxrender1

# End of Geant4 setup

# Set the working directory inside the container
WORKDIR /app

# Copy the CMake project files into the container
COPY . .

# Copy the shell script into the container
COPY dockerfile_script.sh /app/dockerfile_script.sh

# Make the shell script executable
RUN chmod +x /app/dockerfile_script.sh

# Set the entry point to run the shell script
ENTRYPOINT ["/bin/bash", "/app/dockerfile_script.sh"]
