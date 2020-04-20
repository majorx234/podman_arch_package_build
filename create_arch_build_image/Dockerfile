FROM archlinux/arch_base
COPY pacman.conf /etc/pacman.conf
COPY makepkg.conf /etc/makepkg.conf
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm autoconf automake binutils bison fakeroot findutils flex gcc gettext grep groff gzip libtool m4 make patch pkgconf sed texinfo which git cmake
RUN mkdir /mnt/build
RUN useradd -m -g users -s /bin/sh builder

