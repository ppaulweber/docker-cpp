#
#   Copyright (c) 2017 Philipp Paulweber
#   All rights reserved.
#
#   Developed by: Philipp Paulweber
#                 https://github.com/ppaulweber/docker-cpp
#
#   This file is part of docker-cpp.
#
#   docker-cpp is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   docker-cpp is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with docker-cpp. If not, see <http://www.gnu.org/licenses/>.
#

FROM ubuntu:16.04

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install \
    git \
    bash \
    make \
    cmake \
    curl \
    wget \
    bzip2 \
    xz-utils \
    bison \
    flex \
    gcc \
    g++ \
    clang


# CMAKE



# GCC
RUN GCC_REV=http://ftp.gnu.org/gnu/gcc/gcc-7.2.0/gcc-7.2.0.tar.xz && \
    wget   -O /tmp/gcc.tar.xz ${GCC_REV} && \
    mkdir     /tmp/gcc && \
    tar -vxJf /tmp/gcc.tar.xz --strip-components=1 -C /tmp/gcc && \
    cd        /tmp/gcc && \
    ./contrib/download_prerequisites && \
    cd        .. && \
    mkdir     gcc-build && \
    cd        gcc-build && \
    ../gcc/configure --enable-languages=c,c++ && \
    make && \
    make install && \
    cd        /tmp && \
    rm   -vrf /tmp/gcc* && \
    gcc --version && \
    g++ --version


# CLANG



CMD ["/bin/bash"]
