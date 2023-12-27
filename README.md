# Avidemux Deb build

build avidemux for debian withing a docker container

## How to build

1. check and/or modify the versions in the makefile
2. run `make package`
3. generated debian file will be put in /out

note: individual steps can be also called with mmake


## Developement

shell into the build container

    docker run -it  avidemux-builder