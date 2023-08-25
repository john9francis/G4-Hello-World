# syntax=docker/dockerfile:1

FROM ubuntu:20.04

# install miniconda
RUN apt update && apt install -y wget

# Download and install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod +x Miniconda3-latest-Linux-x86_64.sh && \
    ./Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh

# Add conda to PATH
ENV PATH="/opt/conda/bin:$PATH"

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
