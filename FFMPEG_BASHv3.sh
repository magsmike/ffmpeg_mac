#!  /bin/bash

##Error checking maybe
set -Eeuo pipefail

##Define Variables
download="/temp"
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
#echo
#mkdir -pv ${ffmpeg} ${download} ${build} ${apps} && \
echo
echo "Creating Help2Man folder, downloading, compiling, then deleting..."
  cd ${download} && \
    git clone -v https://github.com/Distrotech/help2man.git && \
    cd ${download}/help2man && \
    PATH="$HOME/bin:$PATH" ./configure --prefix=${PREFIX} && \
    make_install && \
  #rm -rf ${DIR}/help2man && \
echo
echo "Creating Libtool folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://mirror.us-midwest-1.nexcess.net/gnu/libtool/libtool-2.4.7.tar.gz && \
    tar -zx -f libtool-2.4.7.tar.gz && \
    cd ${download}/libtool-2.4.7 && \
    PATH="$HOME/bin:$PATH" ./configure --prefix=${PREFIX} --disable-dependency-tracking && \
    make_install && \
    #rm -rf ${DIR}/libtool && \
echo
echo "Creating Pkg-Config folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz && \
    tar -zx -f pkg-config-0.29.2.tar.gz && \
    cd ${download}/pkg-config-0.29.2 && \
    PATH="$HOME/bin:$PATH" ./configure --prefix=${PREFIX} --with-internal-glib --disable-dependency-tracking && \
    make_install && \
    #rm -rf ${DIR}/pkg-config && \
echo
echo "Creating Gettext folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.1.tar.gz && \
    tar -zx -f gettext-0.21.1.tar.gz && \
    cd ${download}/gettext-0.21.1 && \
    PATH="$HOME/bin:$PATH" ./configure --prefix=${PREFIX} --disable-dependency-tracking && \
    make_install && \
    #rm -rf ${DIR}/gettext && \
echo
echo "Creating Autoconf folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://ftp.gnu.org/gnu/autoconf/autoconf-latest.tar.gz && \
    tar -zx -f autoconf-latest.tar.gz && \
    cd ${download}/autoconf-2.71 && \
    PATH="$HOME/bin:$PATH" ./configure --prefix=${PREFIX} && \
    make_install && \
    #rm -rf ${DIR}/autoconf && \
echo
echo "Creating Automake folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -slO https://ftp.gnu.org/gnu/automake/automake-1.16.5.tar.gz && \
    tar -zx -f automake-1.16.5.tar.gz && \
    cd ${download}/automake-1.16.5 && \
    PATH="$HOME/bin:$PATH" ./configure --prefix=${PREFIX} && \
    make_install && \
    #rm -rf ${DIR}/automake && \
echo
echo "Creating Texinfo folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://ftp.gnu.org/gnu/texinfo/texinfo-7.0.3.tar.gz && \
    tar -zx -f texinfo-7.0.3.tar.gz && \
    cd ${download}/texinfo-7.0.3 && \
    PATH="$HOME/bin:$PATH" ./configure --prefix=${PREFIX} --disable-dependency-tracking && \
    make_install && \
    #rm -rf ${DIR}/texinfo && \
echo
echo "Creating XZ folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://tukaani.org/xz/xz-5.4.2.tar.gz && \
    tar -zx -f xz-5.4.2.tar.gz && \
    cd ${download}/xz-5.4.2 && \
    PATH="$HOME/bin:$PATH" ./configure --prefix=${PREFIX} --disable-dependency-tracking && \
    make_install && \
    #rm -rf ${DIR}/xz && \
echo
echo "Creating M4 folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://ftp.gnu.org/gnu/m4/m4-latest.tar.gz && \
    tar -zx -f m4-latest.tar.gz && \
    cd ${download}/m4-1.4.19 && \
    PATH="$HOME/bin:$PATH" ./configure --prefix=${PREFIX} --disable-dependency-tracking && \
    make_install && \
    #rm -rf ${DIR}/m4 && \
echo
echo "Creating PERL folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://www.cpan.org/src/5.0/perl-5.36.0.tar.gz && \
    tar -zx -f perl-5.36.0.tar.gz && \
    cd ${download}/perl-5.36.0 && \
    PATH="$HOME/bin:$PATH" ./Configure -de -Dprefix=/usr/local/ && \
    make_install && \
    #rm -rf ${DIR}/perl && \
echo
#echo "Creating Open SSL folder, downloading, compiling, then deleting..."
  DIR=/tmp/openssl && \
    mkdir -pv ${DIR} && \
    cd ${DIR} && \
    curl -sLO https://www.openssl.org/source/old/3.1/openssl-3.1.0-alpha1.tar.gz && \
    tar -zx -f openssl-3.1.0-alpha1.tar.gz && \
    cd ${DIR}/openssl-3.1.0-alpha1 && \
    ./configure && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/openssl && \
#  echo
echo "Creating NASM folder, downloading, compiling, then deleting..."
  cd ${download} && \
    curl -sLO https://www.nasm.us/pub/nasm/releasebuilds/2.16.01/nasm-2.16.01.tar.bz2 && \
    tar -zx -f nasm-2.16.01.tar.bz2 && \
    cd ${download}/nasm-2.16.01 && \
    PATH="$HOME/bin:$PATH" ./configure --prefix=${PREFIX} && \
    make_install && \
    #rm -rf ${DIR}/nasm && \
echo
echo "Creating YASM folder, downloading, compiling, then deleting..."
  DIR=/tmp/yasm && \
    mkdir -pv ${DIR} && \
    cd ${DIR} && \
    curl -sLO http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz && \
    tar -zx -f yasm-1.3.0.tar.gz && \
    cd ${DIR}/yasm-1.3.0 && \
    ./configure && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/yasm && \
echo
echo "Creating CMake folder , downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/Kitware/CMake.git && \
    cd ${DIR}/CMake && \
    ./configure && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/CMake && \
echo
echo "Creating Python folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/python/cpython.git && \
    cd ${DIR}/cpython && \
    ./configure --enable-shared --enable-optimizations && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/cpython && \
echo
echo "Creating Ninja folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/ninja-build/ninja.git && \
    cd ${DIR}/ninja && \
    ./configure.py --bootstrap && \
    mv /private/tmp/ninja/ninja /usr/local/bin/ && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/ninja  && \
echo
echo "Creating Meson folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/mesonbuild/meson.git && \
    cd ${DIR}/meson && \
    ./meson.py && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/meson && \
echo
echo "Creating XML2 folder, downloading, compiling, then deleting..."
  DIR=/tmp/xml2 && \
    mkdir -pv ${DIR} && \
    cd ${DIR} && \
    curl -sLO https://download.gnome.org/sources/libxml2/2.9/libxml2-2.9.14.tar.xz && \
    tar -zx -f libxml2-2.9.14.tar.xz && \
    cd ${DIR}/libxml2-2.9.14 && \
    ./configure --disable-dependency-tracking && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/libxml2 && \
echo
echo "Creating Freetype folder, downloading, compiling, then deleting..."
  DIR=/tmp/freetype && \
    mkdir -pv ${DIR} && \
    cd ${DIR} && \
    curl -sLO https://download.savannah.gnu.org/releases/freetype/freetype-2.13.0.tar.xz && \
    tar -zx -f freetype-2.13.0.tar.xz && \
    cd ${DIR}/freetype-2.13.0 && \
    ./configure && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/freetype && \
echo
echo "Creating Fontconfig folder, downloading, compiling, then deleting..."
  DIR=/tmp/fontconfig && \
    mkdir -pv ${DIR} && \
    cd ${DIR} && \
    curl -sLO https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.14.2.tar.gz && \
    tar -zx -f fontconfig-2.14.2.tar.gz && \
    cd ${DIR}/fontconfig-2.14.2 && \
    ./configure --disable-dependency-tracking && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR} && \
echo
echo "Creating Fribidi folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/fribidi/fribidi.git && \
    cd ${DIR}/fribidi && \
    ./autogen.sh && \
    ./configure --disable-dependency-tracking && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/fribidi && \
  echo
echo "downloading official FFMPEG and External Libraries from Git-Hub repos and building..."
echo
echo "Creating ZIMG '(video filter)' folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/sekrit-twc/zimg.git && \
    cd ${DIR}/zimg && \
    git clone -v https://github.com/sekrit-twc/graphengine.git && \
    ./autogen.sh && \
    ./configure --enable-shared --disable-dependency-tracking && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/zimg && \
echo
echo "Creating ASS '(subtitles)' folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/libass/libass.git && \
    cd ${DIR}/libass && \
    ./autogen.sh && \
    ./configure --disable-static --enable-shared && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/libass && \
echo
echo "Creating SRT '(subtitles)' folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/Haivision/srt.git && \
    cd ${DIR}/srt && \
    cmake . && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/srt && \
echo
echo "Creating Aribb24 '(subtitles)' folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/nkoriyama/aribb24.git && \
    cd ${DIR}/aribb24 && \
    autoreconf -fiv && \
    ./configure CFLAGS="-I${PREFIX}/include -fPIC" && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/aribb24 && \
echo
echo "Creating webp '(video codec)' folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://chromium.googlesource.com/webm/libwebp && \
    cd ${DIR}/libwebp && \
    ./configure --enable-shared  && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/libwebp && \
echo
echo "Creating OpenJPEG '(J2K)' '(video codec)' folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/uclouvain/openjpeg.git && \
    cd ${DIR}/openjpeg && \
    cmake -DBUILD_THIRDPARTY:BOOL=ON . && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/openjpeg && \
echo
echo "Creating x265 '(H265)' '(video codec)' folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/videolan/x265.git && \
    cd ${DIR}/x265/build/linux && \
    sed -i "/-DEXTRA_LIB/ s/$/ " multilib.sh && \
    sed -i "/^cmake/ s/$/ -DENABLE_CLI=OFF/" multilib.sh && \
    ./multilib.sh && \
    make -C 8bit install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/x265 && \
echo
echo "Creating Bluray '(video decoder)' folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://code.videolan.org/videolan/libbluray.git && \
    cd ${DIR}/libbluray && \
    ./configure --disable-examples --disable-bdjava-jar --disable-static --enable-shared && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/libbluray && \
echo
echo "Creating AOM '(AV1)' '(video codec)' folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://aomedia.googlesource.com/aom && \
    cd ${DIR}/aom && \
    mkdir -pv ./aom_build && \
    cd ./aom_build && \
    cmake -DCONFIG_TUNE_VMAF=1 -DBUILD_SHARED_LIBS=1 .. && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/aom && \
echo
echo "Creating VPX '(VP8 and VP9)' '(video codec)' folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/webmproject/libvpx.git && \
    cd ${DIR}/libvpx
    ./configure --enable-vp8 --enable-vp9 --enable-vp9-highbitdepth --enable-pic --enable-shared \
    --disable-debug --disable-examples --disable-docs --disable-install-bins  && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/libvpx && \
echo
echo "Creating Xvid '(video codec)' folder, downloading, compiling, then deleting..."
  DIR=/tmp/xvid && \
    mkdir -pv ${DIR} && \
    cd ${DIR} && \
    curl -sLO https://downloads.xvid.com/downloads/xvidcore-1.3.7.tar.gz && \
    tar -zxv -f xvidcore-1.3.7.tar.gz && \
    cd xvidcore/build/generic && \
    ./configure && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR} && \
echo
echo "Creating x264 '(H264)' '(video codec)' folder, downloading, compiling, then deleting..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/mirror/x264.git && \
    cd ${DIR}/x264 && \
    ./configure --enable-shared --enable-pic --disable-cli && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/x264 && \
echo
echo "Creating lame '(audio codec)' folder, downloading, compiling, then deleting..."
    DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/zlargon/lame.git && \
    cd ${DIR}/lame && \
    ./configure --enable-shared --enable-nasm --disable-frontend && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}/lame && \
echo
echo "Creating FDK '(fdk-aac)' '(audio codec)' folder, downloading, compiling, then deleting..."
    DIR=/tmp && \
    cd ${DIR} && \
    git clone -v https://github.com/mstorsjo/fdk-aac.git && \
    cd ${DIR}/fdk-aac && \
    autoreconf -fiv && \
    ./configure --enable-shared && \
    make && \
    make install && \
    echo "COMPLETED!"
    #rm -rf ${DIR}fdk-aac && \
echo
echo "Creating VMAF '(QC tool)' folder, downloading, compiling, then deleting..." && \
  DIR=/tmp/vmaf && \
    mkdir -pv ${DIR} && \
    cd ${DIR} && \
    git clone -v https://github.com/Netflix/vmaf.git && \
    cd ${DIR}/libvmaf && \
    meson build --buildtype release && \
    ninja -vC build && \
    ninja -vC build install && \
    mkdir -pv ${PREFIX}/share/model/ && \
    cp -r ${DIR}/model/* ${PREFIX}/share/model/ && \
    echo "COMPLETED!"
    #rm -rf ${DIR} && \
echo
echo "Creating FFMPEG '(transcoding application)' folder, downloading, compiling final BUILD..."
  DIR=/tmp && \
    cd ${DIR} && \
    git clone -v -b release/6.0 https://github.com/FFmpeg/FFmpeg.git && \
    cd ${DIR}/FFmpeg && \
    ./configure --disable-debug --disable-doc --disable-ffplay --enable-shared --enable-gpl --extra-libs=-ldl && \
    make && \
    make install && \
      ./configure \
        --extra-libs=-ldl \
        --extra-libs=-lpthread \
        --ld="g++" \
        --disable-debug \
        --disable-doc \
        --disable-ffplay \
        --enable-nonfree \
        --enable-fontconfig \
        --enable-gpl \
        --enable-version3 \
        --enable-shared \
        --enable-libaom \
        --enable-libaribb24 \
        --enable-libass \
        --enable-libbluray \
        --enable-libfdk_aac \
        --enable-libfreetype \
        --enable-libmp3lame \
        --enable-libopenjpeg \
        --enable-libsrt \
        --enable-libvmaf \
        --enable-libvpx \
        --enable-libwebp \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libxvid \
        --enable-openssl \
        --enable-postproc \
        --enable-libzimg \
        --enable-small && \
        make && \
        make install && \
        hash -r