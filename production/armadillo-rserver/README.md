# RServer for DataSHIELD analysis
The RServer for DataSHIELD has installed collections of tools to support DataSHIELD analysis.

## Contents
There are several DataSHIELD related dependencies installed
- [RServer](https://github.com/molgenis/Rserve/releases/tag/v0.1.2)
- [dsBase](https://github.com/datashield/dsBase)

## Usage
There are several platforms on which you can run RServer.

### Deploy locally
You can steer the rserver at runtime using environment variables. You can toggle debug mode with the environment variable `DEBUG`.

Run the docker locally (docker only):

`docker run -e DEBUG=TRUE datashield/armadillo-rserver:latest`

Run in docker-compose `docker-compose.yml`:

```yaml
...
services:
  armadillo-rserver:
    environment: 
     - DEBUG = TRUE
...
```

### Deploy using Ansible

Check: https://galaxy.ansible.com/molgenis/armadillo

### Deploy using Kubernetes and helm

Check: https://github.com/molgenis/molgenis-ops-helm/tree/master/charts/molgenis-armadillo
