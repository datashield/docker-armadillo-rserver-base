FROM datashield/armadillo-rserver-omics:1.0.1

# Install dependencies dsMicrobiome package
ENV DSBASE_VERSION "v6.2-dev"
RUN installGithub.r "datashield/dsBase@${DSBASE_VERSION}}" --deps=TRUE

# Install dsMicrobiome
ENV DSMICROBIOME_VERSION "HEAD"
RUN installGithub.r "StuartWheater/dsMicrobiome@${DSMICROBIOME_VERSION}" --deps=TRUE

CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"