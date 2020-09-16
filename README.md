# Dockerfiles for Computational Chemistry

This is a repository of Dockerfiles for software commonly used in
computational chemistry.
([How do I get started with Docker?](https://docs.docker.com/get-started/))

Basically, this allows one to deploy a lightweighted, containerized environment
in a matter of minutes, in which a particular package is ready to be used.
Images are always based on the latest Ubuntu image available on
[Docker Hub](https://hub.docker.com/_/ubuntu).

## How to run an image

All images are available in
[Docker Hub under @schneiderfelipe](https://hub.docker.com/u/schneiderfelipe),
so the command below does everything for you:

    $ docker run -it schneiderfelipe/siesta:4.0.2 bash

This will give you a minimal, fully functioning terminal with all required
software available at `/opt`.

*Note*: if you build images locally
([see below](#how-to-build-images-locally)), you probably want to remove the
`schneiderfelipe/` part.

## How to build images locally

    $ docker build -t siesta:4.0.2 siesta:4.0.2

## Useful technical references

- [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
