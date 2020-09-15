FROM ubuntu:20.04
LABEL maintainer="Felipe S. S. Schneider <schneider.felipe@posgrad.ufsc.br>"

# --- Define arguments ---
ARG URL=https://arquivos.ufsc.br/f/28c630798b094aff98c6/?dl=1
ARG NAME=orca_4_2_1_linux_x86-64_shared_openmpi314
ARG PREFIX=/opt
ARG USER=geem
ARG DEBIAN_FRONTEND=noninteractive
# ARG TZ=America/Sao_Paulo

# --- Prepare system ---
USER root
WORKDIR $PREFIX
RUN apt update --yes
# RUN apt upgrade --yes

# --- Obtain required libraries and utilities ---
RUN apt install --yes openmpi-bin
RUN apt install --yes vim

# --- Obtain software ---
RUN apt install --yes wget
RUN wget $URL -O orca.tar.zst
# RUN sha1sum orca.tar.zst

# --- Install binaries ---
RUN apt install --yes zstd
RUN tar -I zstd -xvf orca.tar.zst
RUN mv $NAME orca
RUN rm orca.tar.zst

# --- Prepare running environment ---
RUN useradd --create-home --shell /bin/bash $USER
RUN echo export OMPI_MCA_btl_vader_single_copy_mechanism=none >> /home/$USER/.bashrc
# See <http://mofem.eng.gla.ac.uk/mofem/html/faqs.html#openmpi_error_in_docer>:
RUN echo export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$PREFIX/orca" >> /home/$USER/.bashrc

USER $USER
WORKDIR /home/$USER
CMD ["/bin/bash"]
