#!/usr/bin/bash +x

tempfolder=$(mktemp -d)
cp pacman.d/pacman.conf rootfs/etc/pacman.conf
cat pacman.d/pacman_noextract.conf >> rootfs/etc/pacman.conf
sudo pacstrap -C rootfs/etc/pacman.conf -c -G  -M $tempfolder $(cat arch_base_packages.txt)
sudo cp --recursive --preserve=timestamps --backup --suffix=.pacnew rootfs/* $tempfolder
sudo arch-chroot $tempfolder locale-gen
sudo arch-chroot $tempfolder pacman-key --init
sudo arch-chroot $tempfolder pacman-key --populate archlinux
#sudo tar -C $tempfolder -c .| podman import - archlinux/arch_base
sudo tar --numeric-owner --xattrs --acls --exclude-from=exclude -C $tempfolder -c . -f archlinux.tar 
sudo rm $tempfolder
