FROM ubuntu:20.04
LABEL maintainer="Felipe S. S. Schneider <schneider.felipe@posgrad.ufsc.br>"

# --- Define arguments ---
ARG URL=https://arquivos.ufsc.br/f/3180610254f54f3a8ad5/?dl=1
ARG NAME=orca_4_1_2_linux_x86-64_shared_openmpi313
ARG PREFIX=/opt
ARG USER=geem
ARG DEBIAN_FRONTEND=noninteractive
# ARG TZ=America/Sao_Paulo

# --- Prepare system ---
USER root
WORKDIR $PREFIX
RUN apt update && \
#     apt upgrade --yes && \
#
# --- Obtain required libraries and utilities ---
    apt install --yes openmpi-bin && \
    apt install --yes vim && \
#
# --- Obtain software ---
    apt install --yes wget && \
    wget $URL -O orca.tar.zst && \
#     sha1sum orca.tar.zst && \
#
# --- Install binaries ---
    apt install --yes zstd && \
    tar -I zstd -xvf orca.tar.zst && \
    mv $NAME orca && \
    rm orca.tar.zst && \
#
# --- Clean up apt ---
    rm -rf /var/lib/apt/lists/* && \
#
# --- Prepare running environment ---
    useradd --create-home --shell /bin/bash $USER && \
    echo export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$PREFIX/orca" >> /home/$USER/.bashrc && \
# See <http://mofem.eng.gla.ac.uk/mofem/html/faqs.html#openmpi_error_in_docer>:
    echo export OMPI_MCA_btl_vader_single_copy_mechanism=none >> /home/$USER/.bashrc

USER $USER
WORKDIR /home/$USER
CMD ["tail", "-f", "/dev/null"]
