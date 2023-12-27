FROM avidemux-builder as packager
# separaete into 2 images for baster builds while making changes

ARG NFMP_URL="https://github.com/goreleaser/nfpm/releases/download/v2.1.0/nfpm_amd64.deb"
# install nfpm
RUN wget -O /tmp/nfpm_amd64.deb ${NFMP_URL} && \
    sudo dpkg -i "/tmp/nfpm_amd64.deb"

FROM packager

COPY ./ /build
WORKDIR /build

ARG AVIDEMUX_VERSION="<unset>"
RUN sed -i 's/#AVIDEMUX_VERSION#/'"${AVIDEMUX_VERSION}"'/g' nfpm.yaml
ARG MAINTAINER=""
RUN sed -i 's/#MAINTAINER#/'"${MAINTAINER}"'/g' nfpm.yaml
ARG MAIL=""
RUN sed -i 's/#MAIL#/'"${MAIL}"'/g' nfpm.yaml
ARG WEB=""
RUN sed -i "s~#WEB#~$WEB~g" nfpm.yaml

RUN cd /out/tgz &&  \
    for f in *.tar.gz; do tar xfv  "$f" -C ./ --strip-components=1; done && \
    rm -f *.tar.gz

RUN mkdir /pkg

RUN cp /build/nfpm.yaml /out/tgz/ && \
    cd /out/tgz/ && \
    nfpm pkg --packager deb --target /pkg/

