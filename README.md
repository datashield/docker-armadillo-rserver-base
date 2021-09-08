# RServer Armadillo Docker images
This repository contains the different analysis environments for the Armadillo DataSHIELD platform.

Currently we support these analysis environments:

Production
- DataSHIELD Base environment [dsBase](https://github.com/datashield/dsBase)
- Exposome environment [dsExposome](https://github.com/datashield/dsBase)
- Omics environment [Omics](https://github.com/datashield/dsBase)

Development
- DataSHIELD Base development environment [dsBase](https://github.com/datashield/dsBase) --> master branch
- Survival environment [dsSurival](https://github.com/datashield/dsBase)
- Mediation environment [dsMediation](https://github.com/datashield/dsBase)
- Microbiome environment [dsMediation](https://github.com/datashield/dsBase)

You can you these images to support different analysis environments on the Armadillo backend.
## Development
We define 2 environment in development of these images.

- production == R-packages can be used as production environments for the cohorts
- development == R-packages are not released yet and/or work only with the development version of the dsBase package 

## Building
We use npx 