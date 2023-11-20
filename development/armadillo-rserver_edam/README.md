# DataSHIELD R server - development environment
The DataSHIELD RServer has installed collections of tools to support DataSHIELD analysis. The package installed is the cutting edge development package.

The purpose of the docker image generate by this configuration is intended to provide a basis for further configurations.

## Contents
There are several DataSHIELD related dependencies installed

This DataSHIELD Packages included are:
- R 4.2.0
- resourcer 1.2.0

## Usage
There are several platforms on which you can run RServer.

### Deploy locally
You can steer the rserver at runtime using environment variables. You can toggle debug mode with the environment variable `DEBUG`.

Run the docker locally (docker only):

`docker run -e DEBUG=TRUE datashield/docker-armadillo-rserver-base/development/armadillo-rserver_edam:1.0.0`

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
