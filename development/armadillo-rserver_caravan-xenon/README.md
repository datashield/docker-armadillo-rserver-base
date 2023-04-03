# DataSHIELD R server - development environment
The DataSHIELD RServer has installed collections of tools to support DataSHIELD analysis. The package installed is the cutting edge development package.

The purpose of the docker image generate by this configuration is intended to support the ATHLETE Project.

## Contents
There are several DataSHIELD related dependencies installed

This DataSHIELD Packages included are:
- [dsBase](https://github.com/datashield/dsBase/tree/6.2.0) 6.3.0
- [dsMediation](https://github.com/datashield/dsMediation/tree/0.0.3) 0.0.3
- [dsMTLBase](https://github.com/transbioZI/dsMTLBase/tree/main) 0.11.0
- [dsSurvival](https://github.com/neelsoumya/dsSurvival/tree/v1.0.1) v2.1.2
- [dsExposome](https://github.com/isglobal-brge/dsExposome/tree/2.0.4) 2.0.9
- [dsOmics](https://github.com/isglobal-brge/dsOmics/tree/1.0.11) 1.0.18-2

## Usage
There are several platforms on which you can run RServer.

### Deploy locally
You can steer the rserver at runtime using environment variables. You can toggle debug mode with the environment variable `DEBUG`.

Run the docker locally (docker only):

`docker run -e DEBUG=TRUE datashield/docker-armadillo-rserver-base/development/armadillo-rserver_caravan-xenon:1.0.0`

Run in docker-compose `docker-compose.yml`:

```yaml
...
services:
  armadillo-rserver-dev:
    environment: 
     - DEBUG = TRUE
...
```

### Deploy using Ansible

Check: https://galaxy.ansible.com/molgenis/armadillo

### Deploy using Kubernetes and helm

Check: https://github.com/molgenis/molgenis-ops-helm/tree/master/charts/molgenis-armadillo
