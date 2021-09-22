# RServer for DataSHIELD analysis
The RServer for DataSHIELD has installed collections of tools to support DataSHIELD analysis.

## Contents
- [RServer](https://github.com/molgenis/Rserve/releases/tag/v0.1.2)=0.1.2
- [dsBase](https://github.com/datashield/dsBase/tree/6.1.0)=6.1.0
- [resourcer](https://github.com/obiba/resourcer)=1.1.0
## Usage
There are several platforms on which you can run RServer.
### Run the image standalone
Or run the docker standalone:

`docker run -e DEBUG=TRUE datashield/rserver:1.0.0`

You can steer the rserver at runtime using environment variables. You can toggle debug mode with the environment variable `DEBUG`.

So for example in the `docker-compose.yml`:

```yaml
...
services:
  rserver:
    environment: 
     - DEBUG = TRUE
...
```

