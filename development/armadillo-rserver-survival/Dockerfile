FROM datashield/armadillo-rserver:1.0.2

# Install dsSurvival package
ENV DSSURVIVAL_VERSION "v1.0.0"
RUN installGithub.r "neelsoumya/dsSurvival@${DSSURVIVAL_VERSION}"

CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"