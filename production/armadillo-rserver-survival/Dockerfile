FROM datashield/armadillo-rserver:6.1

# Install dsSurvival package
ENV DS_PKG_VERSION "v1.0.0"
RUN installGithub.r "neelsoumya/dsSurvival@${DS_PKG_VERSION}"

CMD R -e "MolgenisRserve::Rserve(debug=${DEBUG}, args='--vanilla --RS-set remote=enable --RS-set auth=disable --RS-set daemon=disable')"