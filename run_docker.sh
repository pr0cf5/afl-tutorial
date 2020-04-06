#!/bin/bash
set -e
cd $(dirname $0)
user=fuzz
IMAGENAME=marshalfuzz
rm -rf output
mkdir -p output
#sudo docker build -t $IMAGENAME .
sudo docker run -it --mount "type=bind,source=$(pwd)/output,target=/home/$user/output" $IMAGENAME
