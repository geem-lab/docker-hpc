FROM ubuntu:20.04
LABEL maintainer="Letícia Maria Pequeno Madureira <lmadurei@andrew.cmu.edu>"

# arguments
ARG URL=https://arquivos.ufsc.br/f/7d651f269bf445608ce1/?dl=1
ARG NAME=orca_5_0_1_linux_x86-64_shared_openmpi411
ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=America/Sao_Paulo
ARG PREFIX=/opt
ARG USER=geem

USER root
WORKDIR $PREFIX

RUN apt update && \
    apt upgrade --yes && \
    apt install --yes build-essential && \
    apt install --yes vim && \
    apt install --yes wget
# openmpi installation
WORKDIR /tmp
RUN wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.1.tar.gz && \
    tar xvf openmpi-4.1.1.tar.gz && \
    rm openmpi-4.1.1.tar.gz
WORKDIR openmpi-4.1.1
RUN ./configure --prefix=/opt/orca-5.0.0/openmpi-4.1.1 && \
    make all && \
    make install
# orca-5.0.1 installation
WORKDIR $PREFIX
RUN wget $URL -O orca.tar.zst && \
    apt install --yes zstd && \
    tar -I zstd -xvf orca.tar.zst && \
    mv $NAME orca && \
    rm orca.tar.zst && \
    rm -rf /var/lib/apt/lists/* && \
    useradd --create-home --shell /bin/bash $USER && \
    echo 'export PATH=$PREFIX/orca:$PATH; export LD_LIBRARY_PATH=$PREFIX/orca:$LD_LIBRARY_PATH' >> /home/$USER/.bashrc && \
    echo 'export PATH=$PREFIX/orca/openmpi-4.1.1/bin:$PATH; export LD_LIBRARY_PATH=$PREFIX/orca/openmpi-4.1.1/lib:$LD_LIBRARY_PATH' >> /home/$USER/.bashrc && \
   /bin/bash -c "source /home/$USER/.bashrc"
USER $USER
WORKDIR /home/$USER
CMD ["tail", "-f", "/dev/null"]
