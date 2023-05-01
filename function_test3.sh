#!  /bin/bash

##Error checking maybe
set -Eeuo pipefail

##Define Variables
download="/tmp"
LD_LIBRARY_PATH=/opt/ffmpeg/lib
PKG_CONFIG_PATH="/opt/ffmpeg/share/pkgconfig:/opt/ffmpeg/lib/pkgconfig:/opt/ffmpeg/lib64/pkgconfig"
PREFIX="/opt/ffmpeg"
LD_LIBRARY_PATH="/opt/ffmpeg/lib:/opt/ffmpeg/lib64"
MAKEFLAGS="-j2"

##Define Functions
make_install () {
  make && \
  sudo make install && \
  echo "COMPLETED!"
}

echo
echo "We are aboout to install FFMPEG from scratch but will take a while, so be patient!"
echo
echo "downloading official FFMPEG and External Libraries dependencies from repos and building..."
echo
echo "Creating Help2Man folder, downloading, compiling, then deleting..."
  cd ${download} && \
    git clone -v https://github.com/Distrotech/help2man.git && \
    cd ${download}/help2man && \
    ./configure --prefix=${PREFIX} && \
    make_install && \
  #rm -rf ${DIR}/help2man && \
echo
echo "Creating Libtool folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://mirror.us-midwest-1.nexcess.net/gnu/libtool/libtool-2.4.7.tar.gz && \
    tar -zx -f libtool-2.4.7.tar.gz && \
    cd ${download}/libtool-2.4.7 && \
    ./configure --prefix=${PREFIX} --disable-dependency-tracking && \
    make_install && \
    #rm -rf ${DIR}/libtool && \
echo
echo "Creating Pkg-Config folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz && \
    tar -zx -f pkg-config-0.29.2.tar.gz && \
    cd ${download}/pkg-config-0.29.2 && \
    ./configure --prefix=${PREFIX} --with-internal-glib --disable-dependency-tracking && \
    make_install && \
    #rm -rf ${DIR}/pkg-config && \
echo
echo "Creating Gettext folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.1.tar.gz && \
    tar -zx -f gettext-0.21.1.tar.gz && \
    cd ${download}/gettext-0.21.1 && \
    ./configure --prefix=${PREFIX} --disable-dependency-tracking && \
    make_install && \
    #rm -rf ${DIR}/gettext && \
echo
echo "Creating Autoconf folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://ftp.gnu.org/gnu/autoconf/autoconf-latest.tar.gz && \
    tar -zx -f autoconf-latest.tar.gz && \
    cd ${download}/autoconf-2.71 && \
    ./configure --prefix=${PREFIX} && \
    make_install && \
    #rm -rf ${DIR}/autoconf && \
echo
echo "Creating Automake folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -slO https://ftp.gnu.org/gnu/automake/automake-1.16.5.tar.gz && \
    tar -zx -f automake-1.16.5.tar.gz && \
    cd ${download}/automake-1.16.5 && \
    ./configure --prefix=${PREFIX} && \
    make_install && \
    #rm -rf ${DIR}/automake && \
echo
echo "Creating Texinfo folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://ftp.gnu.org/gnu/texinfo/texinfo-7.0.3.tar.gz && \
    tar -zx -f texinfo-7.0.3.tar.gz && \
    cd ${download}/texinfo-7.0.3 && \
    ./configure --prefix=${PREFIX} --disable-dependency-tracking && \
    make_install && \
    #rm -rf ${DIR}/texinfo && \
echo
echo "Creating XZ folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://tukaani.org/xz/xz-5.4.2.tar.gz && \
    tar -zx -f xz-5.4.2.tar.gz && \
    cd ${download}/xz-5.4.2 && \
    ./configure --prefix=${PREFIX} --disable-dependency-tracking && \
    make_install && \
    #rm -rf ${DIR}/xz && \
echo
echo "Creating M4 folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://ftp.gnu.org/gnu/m4/m4-latest.tar.gz && \
    tar -zx -f m4-latest.tar.gz && \
    cd ${download}/m4-1.4.19 && \
    ./configure --prefix=${PREFIX} --disable-dependency-tracking && \
    make_install && \
    #rm -rf ${DIR}/m4 && \
echo
echo "Creating PERL folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://www.cpan.org/src/5.0/perl-5.36.0.tar.gz && \
    tar -zx -f perl-5.36.0.tar.gz && \
    cd ${download}/perl-5.36.0 && \
    ./Configure -de -Dprefix=${PREFIX} && \
    make_install && \
    #rm -rf ${DIR}/perl && \
echo
#echo "Creating Open SSL folder, downloading, compiling, then deleting..."
#  DIR=/tmp/openssl && \
#    mkdir -pv ${DIR} && \
#    cd ${DIR} && \
#    curl -sLO https://www.openssl.org/source/old/3.1/openssl-3.1.0-alpha1.tar.gz && \
#    tar -zx -f openssl-3.1.0-alpha1.tar.gz && \
#    cd ${DIR}/openssl-3.1.0-alpha1 && \
#    ./configure && \
#    make && \
#    make install && \
#    echo "COMPLETED!"
    #rm -rf ${DIR}/openssl && \
#  echo
#echo "Creating NASM folder, downloading, compiling, then deleting..."
#  cd ${download} && \
#    curl -sLO https://www.nasm.us/pub/nasm/releasebuilds/2.16.01/nasm-2.16.01.tar.bz2 && \
#    tar -zx -f nasm-2.16.01.tar.bz2 && \
#    cd ${download}/nasm-2.16.01 && \
#    PATH="$HOME/bin:$PATH" ./configure --prefix=${PREFIX} && \
#    make_install && \
    #rm -rf ${DIR}/nasm && \
echo