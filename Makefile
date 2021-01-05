USE_DOCKER := $(or ${TERRA_USE_DOCKER},${TERRA_USE_DOCKER},true)
BUILD=docker
ARCH=amd64
CONFIG=
EMBED_VERSION=unknown
#SUDO=sudo
SUDO=
#PRIVILEGED=--privileged
PRIVILEGED=
#NETWORK=--network=host
NETWORK=
TAG=latest
SRC_TAG=latest
BUILD_TESTS=off
BUILD_MODE=
BUILDKIT_CMD=
BUILDKIT_ARGS=--push --platform linux/${ARCH}
WORKSPACE=${PWD}
COLCON_WORKSPACE=pkgs
DOCKER_BUILD_ARGS=--build-arg BUILDKIT_INLINE_CACHE=1

image-slippi-dev:
	$(SUDO) docker build --cache-from local/slippi-dev -t local/slippi-dev -f Dockerfile .

ishiiruka:
	$(SUDO) docker run  --rm --name ishiiruka_build_container \
	-e DISPLAY=${DISPLAY} \
	-v ${PWD}:${PWD} \
	-w ${PWD} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	--entrypoint=/bin/bash \
	local/slippi-dev \
	cd pkgs/Ishiiruka; mkdir -p build; cd build; cmake ..; make


help:
	bash setup.sh --help
.PHONY : help

clean:
	exec rm -rf ${COLCON_WORKSPACE}/build/ ${COLCON_WORKSPACE}/devel/ ${COLCON_WORKSPACE}/install/ ${COLCON_WORKSPACE}/bundle/ {COLCON_WORKSPACE}/log/
.PHONY : clean

.PHONY : target-setup