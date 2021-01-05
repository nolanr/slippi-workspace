#!/bin/bash

SUDO=

$SUDO docker run  --rm --name ishiiruka_build_container \
	-it \
    -u 0 \
    -e DISPLAY=${DISPLAY} \
	-v ${PWD}:${PWD} \
	-w ${PWD} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	local/slippi-dev /bin/bash \

#cd pkgs/Ishiiruka/build