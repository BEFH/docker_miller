# Miller docker container

This is a repo that contains the code for a docker container with Miller, an alternative to the GNU toolchain

The original repository can be found at https://github.com/johnkerl/miller

This branch uses Alpine linux, and there is a problem with times.

## Installation

To install the container, run the following using docker:

```bash
docker pull befh/miller
```

or the following with singularity:

```bash
singularity pull --name miller.img docker://befh/miller:latest
```

To use with Snakemake, you do not need to install. Just put the following in the Snakefile:

```
container: 'docker://befh/miller:latest'
```

Then run with `snakemake --use-singularity` see https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html for more info.

## Usage

To run with docker, `docker run miller [ARGS]`.

To run with singularity, `singularity run miller.img [ARGS]`.

