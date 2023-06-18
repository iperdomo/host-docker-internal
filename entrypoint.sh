#!/usr/bin/env sh

set -eu

apk add --no-cache curl > /dev/null 2>&1

echo "-------"
echo "Content of /etc/hosts"
echo "-------"

cat /etc/hosts

echo "-------"
echo "Trying to reach host.docker.internal"
echo "-------"

curl -I http://host.docker.internal:8080
