# DataSHIELD R server
The DataSHIELD RServer has installed collections of tools to support DataSHIELD analysis.

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

`docker run -e DEBUG=TRUE molgenis/rserver:1.6.0`