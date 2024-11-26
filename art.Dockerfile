FROM ubuntu:latest

## Basic resources
RUN apt-get -q update && \
    apt-get -q -y --no-install-recommends install \
        bzip2 \
        default-jre \
        gcc \
        g++ \
	    libbz2-dev \
        libgsl-dev \
        liblzma-dev \
        libncurses5-dev \
        libncursesw5-dev \
        make \
        wget \
        zlib1g-dev && \
    apt-get clean

# Set up ART (MountRainier-2016-06-05)
COPY artsrcmountrainier2016.06.05linux.tgz /tmp/
RUN cd /tmp && \
    tar -xvzf artsrcmountrainier2016.06.05linux.tgz -C /home && \
    rm /tmp/artsrcmountrainier2016.06.05linux.tgz && \
    cd /home/art_src_MountRainier_Linux && \
    ./configure && \
    make && \
    make install

## Adding STAR and samtools to PATH
ENV PATH $PATH:/home/art_src_MountRainier_Linux

## Set workdir to /home/
WORKDIR /home/

## Launch bash automatically
CMD ["/bin/bash"]