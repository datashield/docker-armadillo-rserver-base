FROM molgenis/rserver:2.0.1

# Install dsBase development package
ENV DSBASE_BRANCH "v6.2-dev"
RUN installGithub.r "datashield/dsBase@${DSBASE_BRANCH}" --deps TRUE

CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"