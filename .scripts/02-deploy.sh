#!/bin/sh

mkdir -p /home/ubuntu/app
mv /home/ubuntu/$1 /home/ubuntu/app/app.war

java -jar app.war