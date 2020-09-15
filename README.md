# Dockerfiles for Computational Chemistry

This is a repository of dockerfiles for software commonly used in
computational chemistry.

All images are always based on the latest Ubuntu image available on
[Docker Hub](https://hub.docker.com/_/ubuntu).

## How to build images

    $ docker build -t orca:4.2.1 orca:4.2.1

## How do I run an image

    $ docker run -it orca:4.2.1

## Useful technical references

- [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
