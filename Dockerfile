# syntax=docker/dockerfile:1

FROM ubuntu:20.04

# Set the working directory inside the container
WORKDIR /app

# Copy the CMake project files into the container
COPY . .

RUN apt update && apt install -y \
  build-essential \
  wget

# Get miniconda
RUN wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# Make the Miniconda installer script executable
RUN chmod +x Miniconda3-latest-Linux-x86_64.sh

# Run the Miniconda installer script
RUN /bin/bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm -f Miniconda3-latest-Linux-x86_64.sh

# Add conda to path
ENV PATH="/opt/conda/bin:$PATH"

# Install additional apt dependencies
RUN apt-get install -y libgl1-mesa-glx libxrender1

# Copy the Conda environment YAML file into the container
COPY environment.yml .

# Create and activate the Conda environment using the YAML file
RUN conda env create -f environment.yml && conda clean -afy

# Determine the number of available CPU cores
ARG CORES=$(nproc)

# Create a build directory and compile the project
WORKDIR /app/build
COPY . /app
RUN cmake .. && make -j "$CORES" && make install

# Set the entry point to run the compiled project
CMD ["./Hello_World"]
