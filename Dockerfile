from ubuntu:bionic

USER root

RUN apt-get update

RUN apt-get install -y make cmake git g++

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xorg \
openbox \
build-essential \
libgl1-mesa-dev \
libbluetooth-dev  \
alsa-utils \
pkg-config \
libevdev-tools \
libxi-dev \
libgtk-3-dev

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gtk2.0

RUN apt-get install -y ffmpeg
RUN apt-get install -y libudev-dev libevdev-dev