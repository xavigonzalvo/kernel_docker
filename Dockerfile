FROM amd64/ubuntu:18.04

RUN apt update
RUN apt install -y mkisofs
RUN apt-get -y install xz-utils extlinux gcc nasm wget make libelf-dev bc git uuid-dev
RUN apt-get -y install libncurses5-dev libncursesw5-dev cpio

VOLUME ["/result"]
