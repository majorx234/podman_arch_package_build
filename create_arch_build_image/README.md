# build arch developing container image

* idea is an base devel image with build tools based on archlinux/arch_base image

1. create container image:
1.* `podman build -t archlinux/arch_base_devel . --log-level=debug`
