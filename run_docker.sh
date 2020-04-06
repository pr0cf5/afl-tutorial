#!/bin/bash
set -e
cd $(dirname $0)
user=fuzz
IMAGENAME=marshalfuzz
rm -rf work
mkdir -p work
sudo docker build -t $IMAGENAME .
sudo docker run -it --mount "type=bind,source=$(pwd)/work,target=/home/$user/work" $IMAGENAME /bin/bash
