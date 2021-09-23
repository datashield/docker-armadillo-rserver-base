# DataSHIELD R server - Mediation analysis environment

The DataSHIELD RServer has installed collections of tools to support DataSHIELD analysis. The [Mediation DataSHIELD](https://github.com/datashield/dsMediation) package is incorporated as well.

## Usage
You can steer the rserver at runtime using environment variables.

### Enabling debug mode
You can toggle debug mode with the environment variable `DEBUG`.

So for example in the `docker-compose.yml`:

```yaml
...
services:
  rserver:
    environment: 
     - DEBUG = TRUE
...
```

Or run the docker standalone:

`docker run -e DEBUG=TRUE molgenis/rserver-mediation:0.0.1`
