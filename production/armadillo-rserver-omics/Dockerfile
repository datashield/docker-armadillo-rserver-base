FROM datashield/armadillo-rserver:2.0.0

# Install OS dependencies for dsOmics
RUN apt-get install liblzma-dev libicu-dev -y

# Install littler to use BioConductor Manager
RUN install2.r --error BiocManager littler --repos "https://cloud.r-project.org/"
RUN ln -s /usr/local/lib/R/site-library/littler/examples/installBioc.r /usr/local/bin/installBioc.r 

# Install resourser package (this is needed because the Armadillo needs it during boot)
ENV RESOURCER_VERSION "1.1.1"
RUN install2.r --error httr --repos "https://cloud.r-project.org/"
RUN install2.r --error "https://cloud.r-project.org/src/contrib/resourcer_${RESOURCER_VERSION}.tar.gz" --repos NULL

# Install additional dsOmics package
ENV DSOMICS_VERSION "v1.0.7"
RUN installGithub.r "isglobal-brge/dsOmics@${DSOMICS_VERSION}" --deps=TRUE

CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"