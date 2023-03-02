#!/bin/sh

mkdir -p /home/ubuntu/app
mv /home/ubuntu/app.war /home/ubuntu/app/app.war

nohup java -jar /home/ubuntu/app/app.war & > output.log