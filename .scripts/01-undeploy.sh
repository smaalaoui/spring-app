#!/bin/sh
sudo systemctl stop app.service
if test -f "/home/ubuntu/app/app.war"; then
    rm -rf /home/ubuntu/app
fi