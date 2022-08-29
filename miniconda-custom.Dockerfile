FROM ubuntu:latest

## Dependencies
RUN apt-get update -q && \
    apt-get install -q -y --no-install-recommends \
        bzip2 \
        ca-certificates \
        git \
        libglib2.0-0 \
        libsm6 \
        libxext6 \
        libxrender1 \
        mercurial \
        openssh-client \
        procps \
        subversion \
        wget \
    && apt-get clean

## Install Miniconda
#ARG MINICONDA_VERSION=py39_4.12.0
ARG MINICONDA_VERSION="latest"

RUN cd /tmp && \
    wget "https://repo.anaconda.com/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh" && \
    cd /home && \
    /bin/bash /tmp/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -b -p /home/miniconda3 && \
    rm /tmp/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh

## Enable conda in .bashrc
RUN echo "/home/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

## Adding miniconda to $PATH
ENV PATH $PATH:/home/${USER}/miniconda3/bin

## Install python packages
RUN conda install -c conda-forge \
	bzip2 \
	matplotlib \
	numpy \
	pandas \
	scikit-image \
	scikit-learn \
	scipy \
	seaborn \
	statsmodels \
	umap-learn

## Clean tarballs
RUN conda clean -t -y

## Set workdir to /home/
WORKDIR /home/

## Launch python automatically
CMD ["python3"]