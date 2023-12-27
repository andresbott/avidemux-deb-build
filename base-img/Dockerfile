FROM debian:bookworm-slim

# quality of life tools
RUN  apt-get update && apt-get -y install sudo bash-completion joe
# basic build
RUN  apt-get update && sudo apt-get -y install wget \
     unzip bzip2 autoconf automake libtool patch make cmake git \
     build-essential pkg-config python3 \
     libnuma-dev bash-completion gnutls-bin

# based on https://avidemux.org/admWiki/doku.php?id=build:install_2.6
# and src/createDebFromSourceUbuntu.bash
# for core modules
RUN  apt-get update && sudo apt-get -y install \
  gcc g++ make fakeroot  libsqlite3-dev  build-essential \
  cmake pkg-config yasm \
  libxv-dev libvdpau-dev libva-dev \
  libasound2-dev libpulse-dev \
  qttools5-dev-tools qtbase5-dev \
  libx264-dev libxvidcore-dev \
  libmp3lame-dev libtwolame-dev libopus-dev libvorbis-dev libogg-dev \
  libpng-dev libfontconfig1-dev libfribidi-dev

# for qt5
RUN  apt-get update && sudo apt-get -y install qttools5-dev-tools qtbase5-dev
# For common plugins
RUN  sudo echo "deb http://ftp.ch.debian.org/debian/ bookworm non-free non-free-firmware contrib"> /etc/apt/sources.list.d/non-free.list
RUN  apt-get update && sudo apt-get -y install \
  libmp3lame-dev \
  libfdk-aac-dev \
  libx264-dev \
  libx265-dev \
  libfaad-dev \
  libfaac-dev
