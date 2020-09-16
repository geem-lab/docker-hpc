FROM schneiderfelipe/orca:4.2.1
LABEL maintainer="Felipe S. S. Schneider <schneider.felipe@posgrad.ufsc.br>"

# --- Define arguments ---
ARG URL=https://github.com/grimme-lab/xtb/releases/download/v6.3.2/xtb-200702.tar.xz
ARG NAME=xtb-6.3.2
ARG PREFIX=/opt
ARG USER=geem
# ARG DEBIAN_FRONTEND=noninteractive
# ARG TZ=America/Sao_Paulo
# ARG NCORES=6

# --- Prepare system ---
USER root
WORKDIR $PREFIX
# RUN apt update && \
#     apt upgrade --yes && \
#
# --- Obtain required libraries and utilities ---
#     apt install --yes vim && \
#
# --- Obtain software ---
RUN wget $URL -O xtb.tar.xz && \
#     sha256sum xtb.tar.xz && \
#
# --- Install binaries ---
    tar -xvf xtb.tar.xz && \
    mv $NAME xtb && \
    rm xtb.tar.xz && \
    ln -s /opt/xtb/bin/xtb /opt/orca/otool_xtb && \
#
# --- Prepare running environment ---
#     echo export MKL_NUM_THREADS=$NCORES >> /home/$USER/.bashrc && \
#     echo export OMP_NUM_THREADS=$NCORES >> /home/$USER/.bashrc && \
#     echo export OMP_MAX_ACTIVE_LEVELS=1 >> /home/$USER/.bashrc && \
#     echo export OMP_STACKSIZE=1G >> /home/$USER/.bashrc && \
#     echo ulimit -s unlimited >> /home/$USER/.bashrc && \
    echo export XTBHOME=/opt/xtb >> /home/$USER/.bashrc && \
    echo source \$XTBHOME/share/xtb/config_env.bash >> /home/$USER/.bashrc

USER $USER
WORKDIR /home/$USER
CMD ["tail", "-f", "/dev/null"]
