#!/bin/bash

#
# NOTE: On macOS with XQuartz, you will need to allow network connections to X11
#

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
HOST_PATH=`echo ~/massif_files`
CONT_PATH="/massif_files"
mkdir -p $HOST_PATH
chmod 755 $HOST_PATH
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

xhost +local:massif

docker run --rm -it \
        --volume=$XSOCK:$XSOCK:rw \
        --volume=$XAUTH:$XAUTH:rw \
        --volume=$HOST_PATH:$CONT_PATH:rw \
        --env="XAUTHORITY=${XAUTH}" \
        --env="DISPLAY" \
        --user="massif" \
	--name massif-visu \
    aeppert/massif-visualizer

xhost -local:massif
