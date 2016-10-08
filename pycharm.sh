#!/bin/bash

set -e 


REPOS_DIR=$HOME/projects
DATA_DIR=`pwd`/.pycharm

mkdir -p $DATA_DIR/java
mkdir -p $DATA_DIR/pycharm

xhost +

docker run -d \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
    -v $DATA_DIR/java:/root/.java \
    -v $DATA_DIR/pycharm:/root/.PyCharm2016.2 \
    -v $REPOS_DIR:/root/projects/repos \
	--name pycharm \
	mesuutt/pycharm:professional

xhost -
