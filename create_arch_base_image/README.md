# create an Arch base image

* idea is not use docker repos
* build base image by own

1. first create `archlinux.tar`
1.* `./create_base_image.sh`
1. build ctainer image
1.* `build image with: podman build -t archlinux/arch_base . --log-level=debug`
