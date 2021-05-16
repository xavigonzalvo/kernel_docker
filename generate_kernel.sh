#!/bin/bash

KERNEL="https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.15.tar.xz"

wget "$KERNEL"
tar -xf "$(basename $KERNEL)"
# pushd "$(basename $KERNEL .tar.xz)"
# make olddefconfig # Kernel Config vom Hostsystem übernehmen
# # make localyesconfig # Minimale Kernel Config für diesen PC
# make -j 9
# cp "$(make image_name)" ../../rootfs/boot/vmlinuz
# make INSTALL_MOD_PATH=../../rootfs/ modules_install
# popd
