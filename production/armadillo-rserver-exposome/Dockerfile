FROM datashield/armadillo-rserver:1.0.2

# Install littler to use BioConductor Manager
RUN apt-get install liblzma-dev libicu-dev -y
RUN install2.r --error BiocManager littler --repos "https://cloud.r-project.org/"
RUN ln -s /usr/local/lib/R/site-library/littler/examples/installBioc.r /usr/local/bin/installBioc.r 

# Install additional dsExposome package
ENV DSEXPOSOME_VERSION "v1.0.1"
RUN installBioc.r rexposome
RUN installGithub.r "isglobal-brge/dsExposome@${DSEXPOSOME_VERSION}"

CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"