FROM datashield/armadillo-rserver_edam:1.0.0

# Update package metdata
RUN apt-get update -y

# Install OS dependencies
RUN apt-get install liblzma-dev libicu-dev -y

# Install dsBase development package
ENV DSBASE_BRANCH "6.2.0"
RUN installGithub.r "datashield/dsBase@${DSBASE_BRANCH}" --deps TRUE

# Install dsMediation development package
ENV DSMEDIATION_BRANCH "0.0.2"
RUN installGithub.r "datashield/dsMediation@${DSMEDIATION_BRANCH}" --deps TRUE

# Install dsSynthetic development package
ENV DSSYNTHETIC_BRANCH "0.0.2"
RUN installGithub.r "tombisho/dsSynthetic@${DSSYNTHETIC_BRANCH}" --deps TRUE

# Install dsSurvival development package
ENV DSSURVIVAL_BRANCH "v2.1.0"
RUN installGithub.r "neelsoumya/dsSurvival@${DSSURVIVAL_BRANCH}" --deps TRUE

# Setup entry point to MolgenisRServer::Rserve
# CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"
