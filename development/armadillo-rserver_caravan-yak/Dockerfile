#
# Process 'datashield/armadillo-rserver_caravan-yak:1.0.0'
#

FROM datashield/armadillo-rserver_caravan:1.0.0

# Update package metdata
RUN apt-get update -y

# Install OS dependencies
RUN apt-get install liblzma-dev libicu-dev -y

# Install dsBase development package
# ENV DSBASE_BRANCH "6.3.0"
ENV DSBASE_BRANCH "6.2.0"
RUN installGithub.r "datashield/dsBase@${DSBASE_BRANCH}" --deps TRUE

# Setup entry point to MolgenisRServer::Rserve
# CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"
