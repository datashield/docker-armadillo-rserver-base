# RServer Armadillo containers
This repository contains the different analysis environments for the Armadillo DataSHIELD platform.

Currently we support these analysis environments:

Production
- DataSHIELD base environment [dsBase](https://github.com/datashield/dsBase)
- Exposome environment [dsExposome](https://github.com/isglobal-brge/dsExposome)
- Omics environment [Omics](https://github.com/isglobal-brge/dsOmics)

Development
- DataSHIELD Base development environment [dsBase](https://github.com/datashield/dsBase) --> master branch
- Survival environment [dsSurival](https://github.com/neelsoumya/dsSurvival)
- Mediation environment [dsMediation](https://github.com/datashield/dsMediation)
- Microbiome environment [dsMicrobiome](https://github.com/StuartWeather/dsMicrobiome)

You can you these images to support different analysis environments on the Armadillo backend.
## Development
We define 2 environment in development of these images.

- production == R-packages can be used as production environments for the cohorts
- development == R-packages are not released yet and/or work only with the development version of the dsBase package

## Building and publishing
We use [semantic release](https://github.com/semantic-release/semantic-release) to build and release the images.
