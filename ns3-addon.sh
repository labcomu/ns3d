#!/bin/bash

# if not already built
if [ ! $(find . -maxdepth 2 -type f -name 'NetAnim') ]; then
    # build netanim
    cd "${DISTDIR}/$(<.config hxselect -c "netanim::attr(dir)")" && \
    qmake NetAnim.pro && make && cd "${DISTDIR}"
fi

# uncomment the add-on components you want to include
# pull and build BRITE
# hg clone http://code.nsnam.org/BRITE && \
# cd BRITE && make && cd "${DISTDIR}"

# pull and build click distro
# git clone https://github.com/kohler/click && \
# cd click && \
# ./configure --disable-linuxmodule --enable-nsclick --enable-wifi && \
# make && cd doc && make install-man && make install && \
# cd "${DISTDIR}"
