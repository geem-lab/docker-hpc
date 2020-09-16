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
RUN apt update --yes
# RUN apt upgrade --yes

# --- Obtain required libraries and utilities ---
# RUN apt install --yes openmpi-bin
RUN apt install --yes vim

# --- Obtain software ---
RUN apt install --yes wget
RUN wget $URL -O Miniconda3.sh
# RUN sha256sum Miniconda3.sh
# See <https://stackoverflow.com/a/58269633/4039050>:
RUN bash Miniconda3.sh -b -p $PREFIX/miniconda
RUN rm Miniconda3.sh

# --- Install binaries ---
RUN PATH="$PATH:$PREFIX/miniconda/bin" conda install -c conda-forge/label/$NAME siesta
# Both lines below are ugly but just work:
RUN ln -s $PREFIX/miniconda/lib/libhdf5.so $PREFIX/miniconda/lib/libhdf5.so.101
RUN ln -s $PREFIX/miniconda/lib/libnetcdf.so $PREFIX/miniconda/lib/libnetcdf.so.13

# --- Prepare running environment ---
RUN useradd --create-home --shell /bin/bash $USER
RUN echo export PATH="$PATH:$PREFIX/miniconda/bin" >> /home/$USER/.bashrc
# RUN echo export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$PREFIX/miniconda/lib" >> /home/$USER/.bashrc

USER $USER
WORKDIR /home/$USER
CMD ["/bin/bash"]
