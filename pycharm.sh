#!/bin/bash

set -e 

PROJECTS_DIR=$HOME/projects
DATA_DIR=`pwd`/.pycharm

mkdir -p $DATA_DIR/java
mkdir -p $DATA_DIR/pycharm

xhost +

docker run -d \
    -v /etc/localtime:/etc/localtime:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v $DATA_DIR/java:/home/developer/.java \
    -v $DATA_DIR/pycharm:/home/developer/.PyCharm2016.2 \
    -v $PROJECTS_DIR:/home/developer/projects \
    --name pycharm \
    mesuutt/pycharm:professional

xhost -
