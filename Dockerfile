FROM        alpine:3.11 AS base
#RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.11/main" > /etc/apk/repositories
#RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.11/community" >> /etc/apk/repositories
RUN     apk  add --no-cache --update libgcc libstdc++ ca-certificates libcrypto1.1 libssl1.1 libgomp expat git


FROM        base AS build

ARG     PREFIX=/opt/ffmpeg
ENV     OPENJPEG_VERSION=2.1.2

RUN     buildDeps="autoconf \
                   automake \
                   bash \
                   binutils \
                   bison \
                   boost \
                   bzip2 \
                   cmake \
                   cppunit \
                   curl \
                   coreutils \
                   ctags \
                   diffutils \
                   expat-dev \
                   file \
                   g++ \
                   gawk \
                   gcc \
                   gdb \
                   grep \
                   gzip \
                   gperf \
                   gtest \
                   libtool \
                   leveldb \
                   leveldb-dev \
                   libev \
                   libev-dev \
                   libevent \
                   libevent-dev \
                   libfastjson \
                   libfastjson-dev \
                   libpcap \
                   libprotobuf \
                   libprotobuf-lite \
                   libprotoc \
                   libunwind \
                   libunwind-dev \
                   libuuid \
                   libuv \
                   libuv-dev \
                   libuv-dbg \
                   libwebsockets \
                   libwebsockets-dev \
                   lsof \
                   man \
                   make \
                   net-tools \
                   ncurses \
                   ncurses-dev \
                   nghttp2 \
                   nghttp2-dev \
                   nghttp2-libs \
                   nginx \
                   python \
                   openssl \
                   openssl-dev \
                   perl \
                   pkgconf \
                   protoc \
                   psmisc \
                   rsyslog \
                   ragel \
                   sed \
                   squid \
                   sudo \
                   tcpdump \
                   texinfo \
                   unzip \
                   valgrind \
                   vim \
                   vsftpd \
                   wget \
                   tar \
                   yasm \
                   nasm \
                   which \
                   zlib-dev \
                   asio \
                   asio-dev \
                   catch2 \
                   keepalived \
                   log4cplus \
                   log4cplus-dev \
                   rapidjson \
                   rapidjson-dev \
                   yaml-cpp \
                   yaml-cpp-dev \
                   libxml2 \
                   expat-dev" && \
        apk  add --no-cache --update ${buildDeps}

## openjpeg https://github.com/uclouvain/openjpeg
RUN \
        DIR=/tmp/openjpeg && \
        mkdir -p ${DIR} && \
        cd ${DIR} && \
        curl -sL https://github.com/uclouvain/openjpeg/archive/v${OPENJPEG_VERSION}.tar.gz | \
        tar -zx --strip-components=1 && \
        cmake -DBUILD_THIRDPARTY:BOOL=ON -DCMAKE_INSTALL_PREFIX="${PREFIX}" . && \
        make && \
        make install && \
        rm -rf ${DIR}

RUN \
    LD_LIBRARY_PATH="${PREFIX}/lib:${PREFIX}/lib64:${LD_LIBRARY_PATH}" && \
    cp ${PREFIX}/bin/* /usr/local/bin/ && \
    LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}

### Release Stage
FROM        base AS release
MAINTAINER  hhp <hanxiaohui93@163.com>

COPY --from=build /usr/local /usr/local


