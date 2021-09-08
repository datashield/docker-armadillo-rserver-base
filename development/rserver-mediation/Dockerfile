FROM molgenis/rserver:2.0.1

RUN apt-get install libpng-dev libjpeg-dev -y

# Install additional dsMediation package
ENV DS_MEDIATION_VERSION "0.0.1"
ENV DS_BASE_VERSION "v6.2-dev"
RUN install2.r --error regmedint mediation latticeExtra --repos "https://cloud.r-project.org/"
RUN installGithub.r "datashield/dsBase@${DS_BASE_VERSION}}" --deps=TRUE
RUN installGithub.r "datashield/dsMediation@${DS_MEDIATION_VERSION}" --deps=TRUE

CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"