# Kernel on Docker

Ongoing work to generate a minimal working Linux system on Docker.


 qemu-system-x86_64 -kernel linux-4.14.15/arch/x86/boot/bzImage -m 512M -initrd output/initramfs.cpio.gz -append "rdinit=/bin/sh"
