FROM ubuntu:20.04
LABEL maintainer="Letícia Maria Pequeno Madureira <leticia.maria@grad.ufsc.br>"

ARG NAME=gromacs-2020.4(GPU/MPI support)
ARG USER=geem
ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=America/Sao_Paulo

USER root 

#external-dependencies installation
RUN apt update 
RUN apt upgrade --yes 
RUN apt install --yes build-essential
RUN apt install --yes manpages-dev
RUN apt install --yes openmpi-bin
RUN apt install --yes cmake
RUN apt install --yes wget

#cuda installation
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
RUN mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600 
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
RUN apt install --yes software-properties-common
RUN apt update
RUN apt-add-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
RUN apt -y update 
RUN apt -y install cuda

#finally, gromacs installation 
RUN wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-2020.4.tar.gz
RUN tar -xzvf gromacs-2020.4.tar.gz
RUN cd gromacs-2020.4
RUN mkdir build 
RUN cd build 
RUN CC=mpicc CXX=mpicxx cmake ../gromacs-2020.4 -DGMX_OPENMP=ON -DGMX_GPU=ON -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON -DCMAKE_BUILD_TYPE=Release -DGMX_BUILD_UNITTESTS=ON -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs   
RUN make
#RUN make check
RUN sudo make install
#After installation, the path of executable file is: /usr/local/gromacs/bin/GMXRC

USER $USER
WORKDIR /home/$USER
CMD ["tail", "-f", "/dev/null"]
