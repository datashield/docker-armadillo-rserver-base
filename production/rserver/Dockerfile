FROM rocker/r-ver:3.6.3

ENV DEBUG FALSE

# Copy script to install deps
COPY scripts/install-arrow.bash /

# Download, patch and install RServe
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libssl-dev net-tools procps lsof libcurl4-openssl-dev git

# Install up-to-date version of apache arrow
ENV ARROW_VERSION "3.0.0"
RUN ./install-arrow.bash
RUN install2.r --error remotes assertthat bit64 purrr R6 rlang tidyselect vctrs cpp11 --repos "https://cloud.r-project.org/"
RUN installGithub.r "apache/arrow/r@apache-arrow-${ARROW_VERSION}"

# Install some debug packages needed by armadillo to retrieve list of R processes
RUN install2.r --error ps dplyr magrittr --repos "https://cloud.r-project.org/"

# Install RServer
ENV RSERVER_VERSION "0.1.2"
RUN install2.r --error "https://registry.molgenis.org/repository/r-hosted/src/contrib/MolgenisRserve_${RSERVER_VERSION}.tar.gz" --repos NULL

# Install dsBase package
ENV DSBASE_VERSION "6.1.0"
RUN install2.r --error RANN stringr lme4 ggplot2 reshape2 --repos "https://cloud.r-project.org/"
RUN installGithub.r "datashield/dsBase@${DSBASE_VERSION}"

ENV RESOURCER_VERSION "1.1.0"
RUN install2.r --error httr --repos "https://cloud.r-project.org/"
RUN install2.r --error "https://cloud.r-project.org/src/contrib/resourcer_${RESOURCER_VERSION}.tar.gz" --repos NULL

CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"