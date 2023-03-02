#!/bin/sh
process=`ps -ef | grep -v awk | awk -e '/java.*app.war/ { print $2 }'`
echo $process


if [ -n "$process" ]; then
        kill -9 $process
fi

if test -f "/home/ubuntu/app/app.war"; then
    rm -rf /home/ubuntu/app
fi