#!/bin/sh

# Build emacs without any graphical support.

# OnMacOS make sure:
#
# brew install libxml2
# brew install librsvg
# brew install imagemagick
# brew install jansson
set -ue

export PATH=/usr/bin:$PATH
CFLAGS='-march=native -O2' ./configure \
       --with-gnutls \
       --with-json \
       --with-modules \
       --with-native-compilation=aot \
       --with-tree-sitter \
       --with-wide-int \
       --with-xml2  \
       --with-zlib \
       --with-imagemagick \
       --with-xwidgets \
       --with-mailutils \
       --without-compress-install 
#        --without-gif \
#        --without-dbus \
#        --without-gpm \
#        --without-gsettings \
#        --without-imagemagick \
#        --without-jpeg \
#        --without-libotf \
#        --without-m17n-flt \
#        --without-makeinfo \
#        --without-ns \
#        --without-png \
#        --without-rsvg \
#        --without-sound \
#        --without-tiff \
#        --without-toolkit-scroll-bars \
#        --without-x \
#        --without-xaw3d \
#        --without-xft \
#        --without-xpm 

make bootstrap -j 4
make -j 4

# make install
