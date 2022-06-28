FROM datashield/armadillo-rserver:2.0.0

# Update package metdata
RUN apt-get update -y

# Install OS dependencies
RUN apt-get install liblzma-dev libicu-dev -y

# Install littler to use BioConductor Manager
RUN install2.r --error BiocManager littler --repos "https://cloud.r-project.org/"
RUN ln -s /usr/local/lib/R/site-library/littler/examples/installBioc.r /usr/local/bin/installBioc.r

# Install dsBase development package
ENV DSBASE_BRANCH "6.2"
RUN installGithub.r "datashield/dsBase@${DSBASE_BRANCH}" --deps TRUE

# Install dsMediation development package
ENV DSMEDIATION_BRANCH "0.0.3"
RUN installGithub.r "datashield/dsMediation@${DSMEDIATION_BRANCH}" --deps TRUE

# Install dsExposome development package
ENV DSEXPOSOME_BRANCH "2.0.4"
RUN installBioc.r 'Biobase'
RUN installBioc.r 'rexposome'

RUN installGithub.r "isglobal-brge/dsExposome@${DSEXPOSOME_BRANCH}" --deps TRUE

# Setup entry point to MolgenisRServer::Rserve
CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"
