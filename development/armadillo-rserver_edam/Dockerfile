FROM rocker/r-ver:4.2.2

ENV DEBUG FALSE

# Copy script to install deps
COPY scripts/install-arrow.bash /

# Install dependencies of OS to use RServe
RUN apt-get update -qq -y && apt-get -y --no-install-recommends install libssl-dev libssh-dev net-tools procps lsof libcurl4-openssl-dev git cmake

# Install up-to-date version of apache arrow
ENV ARROW_VERSION "5.0.0"
RUN ./install-arrow.bash
RUN R -e "source('https://raw.githubusercontent.com/apache/arrow/release-${ARROW_VERSION}/r/R/install-arrow.R'); install_arrow();"

# Install some debug packages needed by armadillo to retrieve list of R processes
RUN install2.r --error remotes ps dplyr magrittr --ncpus 2 --repos "https://cloud.r-project.org/"

# Install MolgenisRserve
ENV MOLGENISRSERVER_VERSION "0.2.0"
RUN install2.r --error "https://localhost/MolgenisRserve_${MOLGENISRSERVER_VERSION}.tar.gz" --ncpus 2 --deps TRUE --repos NULL

# Install resourcer
ENV RESOURCER_BRANCH "1.2.0"
RUN installGithub.r "obiba/resourcer@${RESOURCER_BRANCH}" --deps TRUE

ENV DSBASE_VERSION "6.2.0"
RUN install2.r --error RANN stringr lme4 ggplot2 reshape2 --ncpus 2 --repos "https://cloud.r-project.org/"
RUN installGithub.r "datashield/dsBase@${DSBASE_VERSION}" --deps TRUE

# Setup entry point to MolgenisRServer::Rserve
CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"
