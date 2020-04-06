#!/bin/sh
sudo docker build -t marshalfuzz:latest .
sudo docker run -d -v ./work:/home/$user/work marshalfuzz:latest
