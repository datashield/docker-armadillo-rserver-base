FROM molgenis/rserver-omics:1.0.0

# Install additional dsMicrobiome package
ENV DS_MICROBIOME_VERSION "HEAD"
ENV DS_BASE_VERSION "v6.2-dev"
RUN installGithub.r "datashield/dsBase@${DS_BASE_VERSION}}" --deps=TRUE
RUN installGithub.r "StuartWheater/dsMicrobiome@${DS_MICROBIOME_VERSION}" --deps=TRUE

CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"