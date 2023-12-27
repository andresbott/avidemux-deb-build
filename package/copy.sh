#!/bin/bash
set -e

IMG="avidemux-package"
id=$(docker create ${IMG})
docker cp $id:/pkg ./out
docker rm -v $id
chown -R "$USER:$USER"  out/
