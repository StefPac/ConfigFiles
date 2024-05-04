#!/bin/sh

# Build emacs without any graphical support.

set -ue

# brew install gcc libgccjit
# required for building emacs

# autoconf
# coreutils
# dbus
# expat
# gcc
# gmp
# gnu-sed
# gnutls
# jansson
# libffi
# libgccjit
# libiconv
# librsvg
# libtasn1
# libunistring
# libxml2
# little-cms2
# mailutils
# make
# ncurses
# nettle
# pkg-config
# sqlite
# texinfo
# tree-sitter
# webp
# zlib

./autogen.sh

CFLAGS='-march=native -O2' ./configure \
       --with-gnutls \
       --with-json \
       --with-modules \
       --with-native-compilation=aot \
       --with-tree-sitter \
       --with-wide-int \
       --with-xml2  \
       --with-zlib \
       --without-compress-install \
       --without-gif \
       --without-dbus \
       --without-gpm \
       --without-gsettings \
       --without-imagemagick \
       --without-jpeg \
       --without-libotf \
       --without-m17n-flt \
       --without-makeinfo \
       --without-ns \
       --without-png \
       --without-rsvg \
       --without-sound \
       --without-tiff \
       --without-toolkit-scroll-bars \
       --without-x \
       --without-xaw3d \
       --without-xft \
       --without-xpm 

make -j 4

make install
