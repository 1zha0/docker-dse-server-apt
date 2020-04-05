# DSE with daily `apt-get update & upgrade`

This is a clone of Dockerfile for [DSE 6.7.7 & 6.8.0](https://zookeeper.apache.org/) with `apt-get update & upgrade` applied.

## Tags

- latest-apt
- 6.7.7-apt
- 6.8.0-apt

## Testing

Tests are defined in `test-image.yaml` using [GoogleContainerTools/container-structure-test](
https://github.com/GoogleContainerTools/container-structure-test). To run tests, execute `./test-image.sh`. 

## Usage

Please refer to [datastax/dse-server](https://hub.docker.com/r/datastax/dse-server).
