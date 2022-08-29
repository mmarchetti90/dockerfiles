FROM r-base

##  Add Bioconductor system dependencies
RUN apt-get update -q && \
    apt-get install -q -y --no-install-recommends apt-utils \
        gdb \
        libxml2-dev \
        libz-dev \
        liblzma-dev \
        libbz2-dev \
        libpng-dev \
        libgit2-dev \
        pkg-config \
        fortran77-compiler \
        byacc \
        automake \
        curl \
        cmake \
        libpcre2-dev \
        libnetcdf-dev \
        libhdf5-serial-dev \
        libfftw3-dev \
        libopenbabel-dev \
        libopenmpi-dev \
        libxt-dev \
        libudunits2-dev \
        libgeos-dev \
        libproj-dev \
        libcairo2-dev \
        libtiff5-dev \
        libreadline-dev \
        libgsl0-dev \
        libgslcblas0 \
        libgtk2.0-dev \
        libgl1-mesa-dev \
        libglu1-mesa-dev \
        libgmp3-dev \
        libhdf5-dev \
        libncurses-dev \
        libxpm-dev \
        liblapack-dev \
        libv8-dev \
        libgtkmm-2.4-dev \
        libmpfr-dev \
        libmodule-build-perl \
        libapparmor-dev \
        libprotoc-dev \
        librdf0-dev \
        libmagick++-dev \
        libsasl2-dev \
        libpoppler-cpp-dev \
        libprotobuf-dev \
        libpq-dev \
        libperl-dev \
        libarchive-extract-perl \
        libfile-copy-recursive-perl \
        libcgi-pm-perl \
        libdbi-perl \
        libdbd-mysql-perl \
        libxml-simple-perl \
        libglpk-dev \
        libeigen3-dev \
        sqlite \
        openmpi-bin \
        mpi-default-bin \
        openmpi-common \
        openmpi-doc \
        tcl8.6-dev \
        tk-dev \
        default-jdk \
        imagemagick \
        tabix \
        ggobi \
        graphviz \
        protobuf-compiler \
        jags \
        libhiredis-dev \
        xfonts-100dpi \
        xfonts-75dpi \
        biber \
        libsbml5-dev \
        libzmq3-dev \
        libmariadb-dev-compat \
        libavfilter-dev \
        libfuse-dev \
        mono-runtime \
        ocl-icd-opencl-dev && \
    apt-get clean

## Install R packages
RUN Rscript -e 'install.packages("ggplot2")' && \
    Rscript -e 'install.packages("BiocManager")' && \
    Rscript -e 'BiocManager::install(c("genefilter", \
                                       "GEOquery", \
                                       "genefilter", \
                                       "topGO", \
                                       "Biostrings", \
                                       "Rsamtools", \
                                       "DESeq2", \
                                       "Rsubread"))'

## Set workdir to /home/
WORKDIR /home/

## Launch R automatically
CMD ["R"]