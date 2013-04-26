#!/usr/bin/env bash

die() {
    echo $@
    exit 1
}

wget_if_missing() {
    url=$1
    base="`basename $url`"
    if [ -e "./$base" ]; then
        :
    else
        wget "$url" || die "failed to download $url"
    fi
}

which wget &> /dev/null || die "you must install wget"

script_dir="`dirname $0`"
cd "$script_dir" || die "failed to cd to $script_dir"

# gflags
wget_if_missing http://gflags.googlecode.com/files/gflags-1.5.zip

# glog
wget_if_missing http://google-glog.googlecode.com/files/glog-0.3.1.tar.gz

# gperftools
wget_if_missing http://gperftools.googlecode.com/files/gperftools-2.0.tar.gz

# gtest
wget_if_missing http://googletest.googlecode.com/files/gtest-1.6.0.zip

# protobuf
wget_if_missing http://protobuf.googlecode.com/files/protobuf-2.4.1.tar.gz

# cmake
wget_if_missing http://www.cmake.org/files/v2.8/cmake-2.8.10.2.tar.gz

# libev
wget_if_missing http://dist.schmorp.de/libev/libev-4.15.tar.gz

[ -e ./uriparser-0.7.7.tar.bz2 ] || die "please download uriparser using \
    links http://sourceforge.net/projects/uriparser/files/Sources/0.7.7/uriparser-0.7.7.tar.bz2/download"

echo "success."
