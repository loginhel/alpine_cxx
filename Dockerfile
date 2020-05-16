FROM        alpine:3.12 

MAINTAINER  hhp <hanxiaohui93@163.com>

# 国内镜像
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.12/main" > /etc/apk/repositories
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.12/community" >> /etc/apk/repositories


RUN     apk  add --no-cache --update libgcc libstdc++ ca-certificates libcrypto1.1 libssl1.1 libgomp expat git

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
                   gflags \
                   gflags-dev \
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
                   openjpeg \
                   openjpeg-dev \
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

WORKDIR /var/tmp
