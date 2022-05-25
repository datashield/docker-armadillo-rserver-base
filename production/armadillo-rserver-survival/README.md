# DataSHIELD R server - survival environment

The DataSHIELD RServer has installed collections of tools to support DataSHIELD and survival analysis.

## Contents
There are several DataSHIELD related dependencies installed
- [dsSurvival](https://github.com/ineelsoumya/dsSurvival/tree/v1.0.0)=1.0.0

## Usage
There are several platforms on which you can run RServer.

### Deploy locally
You can steer the rserver at runtime using environment variables. You can toggle debug mode with the environment variable `DEBUG`.

Run the docker locally (docker only):

`docker run -e DEBUG=TRUE datashield/armadillo-rserver-survival:latest`

Run in docker-compose `docker-compose.yml`:

```yaml
...
services:
  armadillo-rserver-survival:
    environment: 
     - DEBUG = TRUE
...
```

### Deploy using Ansible

Check: https://galaxy.ansible.com/molgenis/armadillo

### Deploy using Kubernetes and helm

Check: https://github.com/molgenis/molgenis-ops-helm/tree/master/charts/molgenis-armadillo
