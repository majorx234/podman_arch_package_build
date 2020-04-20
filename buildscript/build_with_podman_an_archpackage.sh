#!/bin/bash +x

REPO_URL=$(cat ./$1)
ARTIFACTS_PATH=$2

export PROXY=$3
export TEMP_BUILD_FOLDER=$(mktemp -d)
chmod o+rw $TEMP_BUILD_FOLDER
cd $TEMP_BUILD_FOLDER
eval $PROXY
git clone $REPO_URL
podman unshare chown -R 1000:985 $TEMP_BUILD_FOLDER
podman run -t  \
           -i  \
           --rm \
           --mount type=bind,source="$TEMP_BUILD_FOLDER/PKGBUILD_Tutorial",target=/mnt/build \
           --mount type=bind,source=$ARTIFACTS_PATH,target=/mnt/artifacts \
           --user 1000 \
           archlinux/arch_base_devel bash -c "cd /mnt/build/libadd_cpp;$PROXY;makepkg -f;find /mnt/build -iname '*.pkg.tar*' -printf '%p\n'|xargs -I % cp % /mnt/artifacts"
podman unshare chown -R 0:0 $TEMP_BUILD_FOLDER
podman unshare chown -R 0:0 $ARTIFACTS_PATH/*.*
rm -rf $TEMP_BUILD_FOLDER
