# Witchcraft involving Docker, Centos7, Julia, and Julia packages

## Intro

This repository contains all that’s needed to scratch a very, *very* specific itch: build a *certain* set of packages for a *certain* version of Julia for a *certain* Centos install. Viz.:

- a set of packages I need, for
- Julia 0.5.2, on
- Centos7.

## Instructions

### Install
You only have to do this once.

#### Mac
Install [Docker for Mac](https://docs.docker.com/docker-for-mac/).

Start Docker (Applications → Docker). You should see a Docker symbol (whale carrying shipping containers) in the macOS status menu.

### Build the Docker image
You only have to do this once.

In a terminal, run
```
make make_docker_image
```

(This will give Docker the `Dockerfile` and execute its instructions: start with a Centos7 image and install Julia 0.5.2 inside it.)


