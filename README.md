[![Docker Images CI](https://github.com/geem-lab/docker-hpc/actions/workflows/docker-image.yml/badge.svg)](https://github.com/geem-lab/docker-hpc/actions/workflows/docker-image.yml)

# Dockerfiles for Computational Chemistry

This is a repository of Dockerfiles for software commonly used in
computational chemistry:

- [GROMACS (2020.4)](https://www.gromacs.org/)
- [ORCA (4.2.1, 5.0.1, 5.0.2)](https://www.orcasoftware.de/tutorials_orca/)
- [SIESTA (4.1.0)](https://siesta-project.org/siesta/)

Basically, this allows one to deploy a lightweighted, containerized environment
in a matter of minutes, in which a particular package is ready to be used.
Images are always based on the latest Ubuntu image available on
[Docker Hub](https://hub.docker.com/_/ubuntu). ([How do I get started with Docker?](https://docs.docker.com/get-started/))

## How to run an image

All images are available in
[GitHub Container Registries](https://github.com/orgs/geem-lab/packages?repo_name=docker-hpc),
so the command below does everything for you:

    $ docker run -it ghcr.io/geem-lab/IMAGENAME:TAGNAME /bin/bash

As a direct example:

    $ docker run -it ghcr.io/geem-lab/gromacs:2020.4 /bin/bash

(Of course, you'll need [Docker](https://www.docker.com/).)
This will give you a minimal, fully functioning terminal with all required
software available in `/opt`.

*Note*: if you build images locally
([see below](#how-to-build-images-locally)), you probably want to remove the
`ghcr.io/geem-lab/` part (see below).

## How to build images locally

    $ docker build -t IMAGENAME:TAGNAME IMAGENAME:TAGNAME
    
As a direct example:

    $ docker build -t gromacs:2020.4 gromacs:2020.4

## How to run images locally

    $ docker run -it IMAGENAME:TAGNAME /bin/bash
    
As a direct example:

    $ docker run -it gromacs:2020.4 /bin/bash

## Useful technical references

- [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
