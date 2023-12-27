FROM avidemux-build-base

ARG AVIDEMUX_TAG="2.8.1"
ARG NV_CODEC_HEADERS="n11.1.5.3"

RUN mkdir -p /out/tgz
RUN mkdir -p /out/debian
RUN mkdir /sources

## Build avidemux, inspired on https://avidemux.org/smif/index.php?topic=19058.0

#nvenc headers
RUN cd /sources && \
  git clone --depth 1 --branch ${NV_CODEC_HEADERS} https://git.videolan.org/git/ffmpeg/nv-codec-headers.git && \
  cd nv-codec-headers && \
  make && \
  make install

# avidemux2
RUN cd /sources && \
  git clone --depth 1 --branch ${AVIDEMUX_TAG} https://github.com/mean00/avidemux2.git && \
  cd avidemux2 && \
  git submodule update --init --recursive && \
  bash bootStrap.bash --tgz && \
  cp /sources/avidemux2/debs/* /out/tgz

RUN chmod -R 777 "/out"