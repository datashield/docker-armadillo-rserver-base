#
# Process 'datashield/armadillo-rserver_ionic-babel:1.0.0'
#

FROM datashield/armadillo-rserver_ionic:1.0.0

# Update package metdata
RUN apt-get update -y

# Install OS dependencies
RUN apt-get install liblzma-dev libicu-dev -y

# Install dsBase development package
ENV DSBASE_BRANCH "v6.3.0-permissive"
LABEL "dsBase"=${DSBASE_BRANCH}
RUN installGithub.r "datashield/dsBase@${DSBASE_BRANCH}" --deps TRUE

# Package
LABEL "image_name"="iconic-babel/1.0.0"
LABEL "profile_packages"="dsBase-6.3.0-permissive"

# Setup entry point to MolgenisRServer::Rserve
# CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"
