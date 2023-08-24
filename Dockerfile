# syntax=docker/dockerfile:1

FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
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
ENV PATH="/miniconda3/bin:$PATH"

# Create Geant4 environment & activate using a shell script
COPY setup_conda.sh /tmp/setup_conda.sh
RUN chmod +x /tmp/setup_conda.sh
RUN /tmp/setup_conda.sh

# Install conda dependencies
RUN conda install -y -c conda-forge make \
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
  libxext-cos6-x86_64

# Install additional apt dependencies
RUN apt-get install -y libgl1-mesa-glx libxrender1

# Set the working directory inside the container
WORKDIR /app

# Copy the CMake project files into the container
COPY . .

# Determine the number of available CPU cores
RUN cores=$(nproc)

# Create a build directory and compile the project
RUN mkdir build && cd build && \
    cmake .. && \
    make -j "$cores" && \
    make install


# Set the entry point to run the compiled project
CMD ["./build/Hello_World"]
