#!/bin/sh

if test -f "/home/ubuntu/app/app.war"; then
    rm -rm /home/ubuntu/app
fi

mkdir -p /home/ubuntu/app
mv /home/ubuntu/$1 /home/ubuntu/app/app.war

java -jar app.war