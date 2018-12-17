#!/bin/sh

VERSION="$(head -n1  /etc/apk/repositories | cut -d "/" -f5)"

sed -i'' "s/vXX/$VERSION/" /tmp/mirrors 

cat /tmp/mirrors > /etc/apk/repositories  

echo "Setting up mirrors"

cat /etc/apk/repositories