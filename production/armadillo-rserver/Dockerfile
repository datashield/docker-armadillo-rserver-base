FROM rocker/r-ver:4.1.1

ENV DEBUG FALSE

# Install dependencies of OS to use RServe
RUN apt update -qq 
RUN apt -y --no-install-recommends install \
  libssl-dev \
  net-tools \
  procps \
  lsof \
  libcurl4-openssl-dev \
  git \
  cmake \
  wget \
  ca-certificates \
  lsb-release

# Install some debug packages needed by armadillo to retrieve list of R processes
RUN install2.r --error remotes ps --repos "https://cloud.r-project.org/"

# install arrow to be able to transfer files from file storage to R-environment
# the base image is windows WSL2 image with Ubuntu Focal installed as base layer
# IMPORTANT: "focal" needs to change if you upgrade to a newer Ubuntu base layer
ENV ARROW_VERSION "5.0.0"
RUN wget https://apache.jfrog.io/artifactory/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/pool/focal/main/a/apache-arrow-apt-source/apache-arrow-apt-source_${ARROW_VERSION}-1_all.deb 
RUN apt install -y ./apache-arrow-apt-source_${ARROW_VERSION}-1_all.deb 
ENV LIBARROW_MINIMAL FALSE
RUN installGithub.r "apache/arrow/r@apache-arrow-${ARROW_VERSION}"

RUN apt update -qq
RUN apt install -y \
  libparquet-dev \
  libparquet-glib-dev

# Install RServer
ENV RSERVER_VERSION "0.1.2"
RUN install2.r --error "https://registry.molgenis.org/repository/r-hosted/src/contrib/MolgenisRserve_${RSERVER_VERSION}.tar.gz" --repos NULL

# Install dsBase package
ENV DS_PKG_VERSION "6.1.0"
RUN install2.r --error RANN stringr lme4 ggplot2 reshape2 --repos "https://cloud.r-project.org/"
RUN installGithub.r "datashield/dsBase@${DS_PKG_VERSION}"

# Startup the RServer
CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"