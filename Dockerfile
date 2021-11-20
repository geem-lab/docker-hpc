
FROM ubuntu:20.04
LABEL maintainer="Letícia Maria Pequeno Madureira <leticia.maria@grad.ufsc.br>"
# --- NWChem docker build with MPI suppport ---
# --- Setting arguments ---
ARG NAME=nwchem-7.0.0
ARG PREFIX=/opt
ARG USER=geem
ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=America/Sao_Paulo
USER root 
WORKDIR $PREFIX
RUN apt update && \
# --- Installing utilitaries and dependencies ---
    apt install --yes openmpi-bin && \
    apt-get install -y  gfortran && \
    apt-get install -y mpich && \
    apt-get install -y libmpich-dev && \
    apt-get install -y make && \
    apt-get install -y ssh && \
    apt-get install -y patch && \
    apt-get install -y curl && \
    apt-get install -y subversion && \
    apt-get install -y wget && \
    apt-get install -y unzip && \
    apt-get install -y perl && \
    apt-get install -y git && \
    apt-get install -y file && \
    apt-get install -y python3 && \
    apt-get install -y python3-dev && \
    apt install --yes vim && \
    apt install --yes htop 
# --- Defining previous installation parameters ---    
ENV ARMCI_NETWORK=MPI-PR NWCHEM_TOP="/opt/nwchem-7.0.0" \
    NWCHEM_TARGET=LINUX64 \
    NWCHEM_MODULES="all python" \
    BUILD_OPENBLAS=1 \
    BLAS_SIZE=4 \
    SCALAPACK_SIZE=4 \
    USE_64TO32=y \
    USE_MPI=y \
    USE_MPIF=y \
    USE_MPIF4=y \
    MRCC_METHODS=y \
    CCSDTQ=y \
    CCSDTLR=y
# --- Getting nwchem directory on github ---
RUN curl -SL https://github.com/nwchemgit/nwchem/releases/download/v7.0.0-release/nwchem-7.0.0-release.revision-2c9a1c7c-src.2020-02-26.tar.bz2 | tar jxf - && \
    cd $NAME/src && \
    make nwchem_config && \
    make -j3  && \
# --- Cleaning apt-cache ---
    rm -rf /var/lib/apt/lists/* && \
USER $USER
WORKDIR /home/$USER
CMD ["tail", "-f", "/dev/null"]
