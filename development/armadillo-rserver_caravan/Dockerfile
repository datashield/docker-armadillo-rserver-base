FROM rocker/r-ver:4.1.3
LABEL "R (rocker)"="4.1.3"

ENV DEBUG FALSE

# Copy script to install deps
COPY scripts/install-arrow.bash /

# Install dependencies of OS to use RServe
RUN apt-get update -qq -y && apt-get -y --no-install-recommends install libssl-dev libssh-dev net-tools procps lsof libcurl4-openssl-dev git cmake

# Install up-to-date version of apache arrow
ENV ARROW_VERSION "8.0.0"
RUN ./install-arrow.bash
RUN R -e "source('https://raw.githubusercontent.com/apache/arrow/release-${ARROW_VERSION}/r/R/install-arrow.R'); install_arrow();"

# Install some debug packages needed by armadillo to retrieve list of R processes
RUN install2.r --error remotes ps dplyr magrittr --repos "https://cloud.r-project.org/"

# Install MolgenisRserve
ENV MOLGENISRSERVER_VERSION=0.1.2
LABEL "MolgenisRserve"=${MOLGENISRSERVER_VERSION}
RUN install2.r --error "https://registry.molgenis.org/repository/r-hosted/src/contrib/MolgenisRserve_${MOLGENISRSERVER_VERSION}.tar.gz" --deps TRUE --repos NULL

# Install littler 
RUN apt-get install littler -y
RUN ln -s /usr/local/lib/R/site-library/littler/examples/installBioc.r /usr/local/bin/installBioc.r

# Install BioConductor Manager
RUN install2.r --error BiocManager littler --repos "https://cloud.r-project.org/"

# Install resourcer
ENV RESOURCER_BRANCH "1.4.0"
LABEL "resourcer"=${RESOURCER_BRANCH}
RUN installGithub.r "obiba/resourcer@${RESOURCER_BRANCH}" --deps TRUE

# Setup entry point to MolgenisRServer::Rserve
CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"
