FROM rocker/r-ver:4.2.0

ENV DEBUG FALSE

# Install dependencies of OS to use RServe
RUN apt update -qq 
RUN apt -y --no-install-recommends install \
  libssl-dev net-tools procps lsof libcurl4-openssl-dev git cmake

# Copy script to install deps
COPY scripts/install-arrow.bash /.

# Install up-to-date version of apache arrow
ENV ARROW_VERSION "5.0.0"
RUN ./install-arrow.bash
RUN R -e "source('https://raw.githubusercontent.com/apache/arrow/release-${ARROW_VERSION}/r/R/install-arrow.R'); install_arrow();"

# Install some debug packages needed by armadillo to retrieve list of R processes
RUN install2.r --error remotes ps dplyr magrittr --repos "https://cloud.r-project.org/"

# Install RServer
ENV RSERVER_VERSION "0.1.2"
RUN install2.r --error "https://registry.molgenis.org/repository/r-hosted/src/contrib/MolgenisRserve_${RSERVER_VERSION}.tar.gz" --repos NULL

# Install dsBase package
ENV DS_PKG_VERSION "6.2.0"
RUN install2.r --error RANN stringr lme4 ggplot2 reshape2 --repos "https://cloud.r-project.org/"
RUN installGithub.r "datashield/dsBase@${DS_PKG_VERSION}"

# Startup the RServer
CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"