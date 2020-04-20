# Build Packages Example 

## preparation 
* folder for artifacts:
  * `sudo mkdir /mnt/artifacts`
  * `sudo chown ros:users /mnt/artifacts`
  * `chmod o+rw /mnt/artifacts`
* need to have archlinux/arch_base_devel podman image see other folders

## run a build script
* these script creates a package inside a podman container
* copy these package (build artifact to the *artifacts folder (see above) 
* `./build_with_podman_an_archpackage.sh pkgbuild_repo.txt /mnt/artifacts <proxy>`
  * `pkgbuild_repo.txt` is a file with PKGBUILD repo
  * `/mnt/artifacts` the *artifacts folder
  * `<proxy>` could be `'export http_proxy="http://myproxy";export https_proxy="http://myproxy";export ftp_proxy="http://myproxy"'
    * or empty

