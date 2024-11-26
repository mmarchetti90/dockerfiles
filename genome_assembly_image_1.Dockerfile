FROM continuumio/miniconda3:24.9.2-0

### UPDATING CONDA ------------------------- ###

RUN conda update -y conda

### INSTALLING PIPELINE PACKAGES ----------- ###

# Adding bioconda to the list of channels
RUN conda config --add channels bioconda

# Adding conda-forge to the list of channels
RUN conda config --add channels conda-forge

# Installing mamba
RUN conda install -y mamba

# Installing packages
RUN mamba install -y \
    chopper=0.9.0 \
    multiqc=1.25.2 \
    nanoplot=1.43.0 \
    prokka=1.14.6 \
    quast=5.3.0 \
    trim-galore=0.6.10 \
    unicycler=0.5.1 && \
    conda clean -afty

# Download Quast Silva and Busco databases
RUN quast-download-silva && \
    quast-download-busco

### SETTING WORKING ENVIRONMENT ------------ ###

# Set workdir to /home/
WORKDIR /home/

# Launch bash automatically
CMD ["/bin/bash"]