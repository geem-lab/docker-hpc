FROM ubuntu:20.04
LABEL maintainer="Letícia Maria Pequeno Madureira <leticia.maria@grad.ufsc.br>"

# After installation, the path of the executable is: $PREFIX/gromacs/bin/GMXRC

# --- Define arguments ---
ARG NAME=gromacs-2020.4  # with GPU/MPI support
ARG URL=ftp://ftp.gromacs.org/pub/gromacs/$NAME.tar.gz
ARG PREFIX=/opt
ARG USER=geem
ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=America/Sao_Paulo

ARG CUDA_PIN=https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
ARG CUDA_PUB=https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
ARG CUDA_REPO=https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/

# --- Prepare system ---
USER root 
WORKDIR $PREFIX

RUN apt update && \
#   apt upgrade --yes
#
# --- Obtain required libraries and utilities ---
    apt install --yes openmpi-bin && \
    apt install --yes vim && \
    apt install --yes htop && \
#
# --- Obtain software ---
    apt install --yes wget && \
    wget $CUDA_PIN && \
    wget $URL && \
#
# --- Install CUDA ---
    mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600 && \
    apt install --yes software-properties-common && \
    apt-key adv --fetch-keys $CUDA_PUB && \
    apt-add-repository "deb $CUDA_REPO /" && \
    apt update --yes && \
    apt install --yes cuda && \
#
# --- Install binaries ---
#     apt install --yes build-essential
#     apt install --yes manpages-dev
    apt install --yes cmake && \
    tar -xzvf $NAME.tar.gz && \
    rm $PREFIX/$NAME.tar.gz && \
    mkdir $PREFIX/$NAME/build && \
    cd $PREFIX/$NAME/build && \
    CC=mpicc CXX=mpicxx cmake .. -DGMX_OPENMP=ON -DGMX_GPU=ON -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON -DCMAKE_BUILD_TYPE=Release -DGMX_BUILD_UNITTESTS=ON -DCMAKE_INSTALL_PREFIX=$PREFIX/gromacs && \
    make && \
#     make check
    make install && \
    cd $PREFIX && \
    rm -rf $PREFIX/$NAME && \
#
# --- Clean up apt ---
    rm -rf /var/lib/apt/lists/* && \
#
# --- Prepare running environment ---
    useradd --create-home --shell /bin/bash $USER

USER $USER
WORKDIR /home/$USER
CMD ["tail", "-f", "/dev/null"]
