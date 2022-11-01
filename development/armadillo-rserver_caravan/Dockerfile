FROM rocker/r-ver:4.2.0

# Update package metdata
RUN apt-get update -y

# Install littler 
RUN apt-get install littler -y
RUN ln -s /usr/local/lib/R/site-library/littler/examples/installBioc.r /usr/local/bin/installBioc.r

# Install OS dependencies
RUN apt-get install libssh-dev -y

# Install remote
RUN install2.r 'remotes'

# Install BioConductor Manager
RUN install2.r --error BiocManager littler --repos "https://cloud.r-project.org/"

# Install resourcer
ENV RESOURCER_BRANCH "1.3.0"
RUN installGithub.r "obiba/resourcer@${RESOURCER_BRANCH}" --deps TRUE

# Install MolgenisRserve
ENV RSERVER_VERSION=0.1.2
RUN install2.r "https://registry.molgenis.org/repository/r-hosted/src/contrib/MolgenisRserve_0.1.2.tar.gz" --deps TRUE --repos NULL

# Setup entry point to MolgenisRServer::Rserve
CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"
