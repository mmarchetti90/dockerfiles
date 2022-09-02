# dockerfiles
Useful dockerfiles for omics analyses

Use the check_docker_images.sh script for automatic build

Images included:

- rnaseq: base image for FastQC, STAR alignment, and SAMtools;

- r-custom: R image with ggplot2, BioConductor and several useful libraries;

- miniconda-custom: Miniconda image with several conda packages install;

Note that for the miniconda-dockerfile, if you are building on a M1 MackBook, you'll probably need to run docker builder using the --platform linux/x86_64 option;
