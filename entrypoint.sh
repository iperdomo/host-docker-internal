#!/usr/bin/env sh

set -eu

apk add --no-cache curl > /dev/null 2>&1

curl -I http://host.docker.internal:8080
