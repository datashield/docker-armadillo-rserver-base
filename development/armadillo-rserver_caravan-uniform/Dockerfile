FROM datashield/armadillo-rserver_caravan:1.0.1

# Update package metdata
RUN apt-get update -y

# Install OS dependencies
RUN apt-get install liblzma-dev libicu-dev -y

# Install dsBase development package
ENV DSBASE_BRANCH "6.2.0"
RUN installGithub.r "datashield/dsBase@${DSBASE_BRANCH}" --deps TRUE

# Install dsMediation development package
ENV DSMEDIATION_BRANCH "0.0.3"
RUN installGithub.r "datashield/dsMediation@${DSMEDIATION_BRANCH}" --deps TRUE

# Install dsMTLBase development package
ENV DSMTLBASE_BRANCH "0.10.0"
RUN installGithub.r "datashield/dsMTLBase@${DSMTLBASE_BRANCH}" --deps TRUE

# Install dsSurvival development package
ENV DSSURVIVAL_BRANCH "v2.1.2"
RUN installGithub.r "neelsoumya/dsSurvival@${DSSURVIVAL_BRANCH}" --deps TRUE

# Install BioConductor package
RUN installBioc.r 'Biobase'
RUN installBioc.r 'Rhtslib'
RUN installBioc.r 'Rsamtools'
RUN installBioc.r 'SNPRelate'
RUN installBioc.r 'GENESIS'
RUN installBioc.r 'GWASTools'
RUN installBioc.r 'GenomicRanges'
RUN installBioc.r 'SummaredExperiment'
RUN installBioc.r 'MEAL'
RUN installBioc.r 'DESeq2'
RUN installBioc.r 'edgeR'
RUN installBioc.r 'rexposome'

# Install dsExposome development package
ENV DSEXPOSOME_BRANCH "2.0.6"
RUN installGithub.r "isglobal-brge/dsExposome@${DSEXPOSOME_BRANCH}" --deps TRUE

# Install dsOmics development package
ENV DSOMICS_BRANCH "v1.0.17"
RUN installGithub.r "isglobal-brge/dsOmics@${DSOMICS_BRANCH}" --deps TRUE

# Setup entry point to MolgenisRServer::Rserve
# CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"
