# create an Arch base image

* idea is not use docker repos
* build base image by own

1. first create `archlinux.tar`
   * `./create_base_image.sh`
1. build ctainer image
   * `build image with: podman build -t archlinux/arch_base . --log-level=debug`
