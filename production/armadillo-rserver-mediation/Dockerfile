FROM datashield/armadillo-rserver:2.0.0

RUN apt-get install libpng-dev libjpeg-dev -y

# Install dependencies of dsMediation pacakge
RUN install2.r --error regmedint mediation latticeExtra --repos "https://cloud.r-project.org/"

# Install dsMediation package
ENV DSMEDIATION_VERSION "0.0.1"
RUN installGithub.r "datashield/dsMediation@${DSMEDIATION_VERSION}" --deps=TRUE

CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"