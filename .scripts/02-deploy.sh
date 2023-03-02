#!/bin/sh

mkdir -p /home/ubuntu/app
mv /home/ubuntu/app.war /home/ubuntu/app/app.war

sudo systemctl start app.service

sleep 30