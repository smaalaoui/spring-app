#!/bin/sh
process=`ps -ef | grep -v awk | awk -e '/java.*app.war/ { print $2 }'`
echo $process
kill -9 ${process}