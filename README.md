# DogecoinD Docker Image
  This is a Docker image for running a DogecoinD FullNode and is being developed specifically for use with [this Helm chart](https://github.com/Aither-Architect/dogecoin-helm). Please note that this is a [multi-arch](https://docs.docker.com/desktop/multi-arch/) Docker image with support for:
  - x86_64
  - arm64 / armv8 / aarch64


## EXPERIMENTAL

In its current form, the only thing that needs to be passed into the container at runtime is a `dogecoin.conf` file at `/etc/dogecoin.conf`. The accompanying Helm chart achieves this by collecting the configuration in the relevant section of `values.yaml` file and mounting/manifesting it as a file in the [appropriate location](https://github.com/Aither-Architect/dogecoin-helm/blob/main/templates/deployment.yaml#L38)

If you are trying to run this image solely using Docker, you can use the standard volume mounting mechanism to get your `dogecoin.conf` in place.

### Contributing
1. Pull Requests are more than welcome! Fork the repo, create a feature branch with a semantic name (There is no preferred naming convention; just make it meaningful), and create a pull request to merge back to the `main` branch in the original repo for enhancements and bug fixes. 

2. Submit Issues for enhancements and bug fixes.


### Roadmap:
- Map out configuration options available:
  - Switches to the binary itself
  - Available dogecoin.conf options
- Parameterize runtime configuration for flexibility
- Create an ARM based docker image