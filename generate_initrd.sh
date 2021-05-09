#!/bin/bash

set -e

readonly confdir=conf
readonly initrd=$(pwd)/initrd
readonly busyboxdir=busybox
readonly outputdir=$(pwd)/output

if [ -e ${initrd} ]; then
  echo -n "Removing existing initrd, press ENTER to proceed... "
  read input
  rm -rf ${initrd}
fi

echo -n "Creating initrd filesystem... "
mkdir ${initrd} && cd ${initrd}
mkdir -p bin sbin etc proc sys usr/bin usr/sbin
cd ..
cp ${confdir}/init ${initrd}
chmod a+x ${initrd}/init
echo "ok"

echo -n "Making busybox"
if [ ! -e ${busyboxdir} ]; then
  mkdir -p ${busyboxdir}
  (
    git clone https://github.com/mirror/busybox.git
  )
fi
cp ${confdir}/busybox.config ${busyboxdir}/.config
(
  cd ${busyboxdir}
  make -j9
  make CONFIG_PREFIX=${initrd} install
)

echo -n "Building initrd... "
(
  cd ${initrd}
  mkdir -p ${outputdir}
  $(find . | cpio -oHnewc | gzip > ${outputdir}/initramfs.cpio.gz)
)
