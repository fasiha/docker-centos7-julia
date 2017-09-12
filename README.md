# Witchcraft involving Docker, Centos7, Julia, and Julia packages

## Intro

This repository contains all that’s needed to scratch a very, *very* specific itch: build a *certain* set of packages for a *certain* version of Julia for a *certain* Centos install. Viz.:

- a set of packages I need, for
- Julia 0.6, on
- Centos7.

## Instructions

### Install Docker

#### Mac
Install [Docker for Mac](https://docs.docker.com/docker-for-mac/).

Start Docker (Applications → Docker). You should see a Docker symbol (whale carrying shipping containers) in the macOS status menu.

### Build the Docker image
You only have to do this once.

In a terminal, run
```
make make_docker_image
```

This will give Docker the `Dockerfile` and execute its instructions: start with a Centos7 image and install Julia 0.6 inside it.

Then you should be able to execute the following to get a Julia session:
```
docker run -it --rm marconi_julia
```
You can get a Bash shell by adding `bash` to the end of that:
```
docker run -it --rm marconi_julia bash
```

(Should you ever need to rebuild this image, delete it by running `docker rmi marconi_julia` and rerun this step.)

### Install all Julia and Python packages
A list of all *Julia* packages with pinned version numbers is in `REQUIRE`. Append any new requirements to this file!

A list of all *Python* packages to install within Conda.jl (for use from within Julia) is included in `python-libraries.txt`. Append new requirements to this file.

Then, run
```
make install_packages
```

### Move resultant binaries to Centos7 server
Compress the `dot-julia` directory and move it to the Centos7 server. Uncompress.

Rename `dot-julia` to `.julia`.

Some packages hardcode the path from the original (Docker) system that built them: they may contain `/root/.julia`. These will need to be changed to the path on the destination system.


