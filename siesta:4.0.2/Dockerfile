FROM ubuntu:20.04
LABEL maintainer="Felipe S. S. Schneider <schneider.felipe@posgrad.ufsc.br>"

# --- Define arguments ---
ARG URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
ARG NAME=cf202003
ARG PREFIX=/opt
ARG USER=geem
# ARG DEBIAN_FRONTEND=noninteractive
# ARG TZ=America/Sao_Paulo

# --- Prepare system ---
USER root
WORKDIR $PREFIX
RUN apt update && \
#     apt upgrade --yes && \
#
# --- Obtain required libraries and utilities ---
#     apt install --yes openmpi-bin && \
    apt install --yes vim && \
#
# --- Obtain software ---
    apt install --yes wget && \
    wget $URL -O Miniconda3.sh && \
#     sha256sum Miniconda3.sh && \
# See <https://stackoverflow.com/a/58269633/4039050>:
    bash Miniconda3.sh -b -p $PREFIX/miniconda && \
    rm Miniconda3.sh && \
#
# --- Clean up apt ---
    rm -rf /var/lib/apt/lists/* && \
#
# --- Install binaries ---
    PATH="$PATH:$PREFIX/miniconda/bin" conda install -c conda-forge/label/$NAME siesta && \
# Both lines below are ugly but just work:
    ln -s $PREFIX/miniconda/lib/libhdf5.so $PREFIX/miniconda/lib/libhdf5.so.101 && \
    ln -s $PREFIX/miniconda/lib/libnetcdf.so $PREFIX/miniconda/lib/libnetcdf.so.13 && \
#
# --- Prepare running environment ---
    useradd --create-home --shell /bin/bash $USER && \
    echo export PATH="$PATH:$PREFIX/miniconda/bin" >> /home/$USER/.bashrc
#     echo export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$PREFIX/miniconda/lib" >> /home/$USER/.bashrc

USER $USER
WORKDIR /home/$USER
CMD ["tail", "-f", "/dev/null"]
