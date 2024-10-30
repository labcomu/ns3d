#!/bin/bash

# symlink ns3 dir to "ns-3"
nsdir="$DISTDIR"/$(<.config hxselect -c "ns-3::attr(dir)")
echo "creating symbolic link to $nsdir ..."
ln -sf "${nsdir}" ns3

# create necessary dir tree
mkdir -p "${nsdir}/build/debug/scratch" && \
mkdir -p "${nsdir}/build/optimized/scratch" && \
mkdir -p "${nsdir}/build/log" && \
[ $(ln -A "${nsdir}/scratch/*") ] && rm -r "${nsdir}/scratch/*"

# build command for modern versions (3.36 and later)
$NS3DIR/ns3 configure --enable-examples --enable-tests \
                    --build-profile=debug --out=build/debug && \
$NS3DIR/ns3 -j 2 build
