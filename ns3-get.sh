#!/bin/bash

# regex to check version number format
rx='^([0-9]+\.){0,1}(\*|[0-9]+)$'

usage()
{
    echo "usage: `basename $0` [version]  `basename $0` [-h]
    Get, extract and build the NS3 distribution. Optional argument is the
    version number. In case the script is run without this argument then
    it'll download the latest version available.

    Option:
      -h   Print this help"
}

# get major from given version number
version_major()
{
    echo ${1%.*}
}

# get minor from given version number
version_minor()
{
    echo ${1##*.}
}

# early exit cases
[ "$#" -gt 1 ] && { usage; exit 1; }
[ "$#" -eq 1 -a "$1" = "-h" ] && { usage; exit 0; }

# verify version number arg
if [[ $1 =~ $rx ]]; then
    version="$1"
    major=$(version_major "$*")
    minor=$(version_minor "$*")
    if [ "$major" -eq 3 -a "$minor" -ge 36 ]; then
        NS3VERSION="$1"
    else
        NS3VERSION="latest"
    fi
else
    NS3VERSION="latest"
fi

# pull latest version number
if [[ "$NS3VERSION" = "latest" ]]; then
    # find the latest release
    selector="ul.side-nav:nth-child(2) > li:nth-child(1) > a:nth-child(1)"
    release=$(curl -s "https://www.nsnam.org/releases/" \
                | hxnormalize -x \
                | hxselect -c "$selector" \
                | cut -d'-' -f2)
# use the version number from arg.
else
    release="$NS3VERSION"
fi

# make download link to the required release archive
dl_link="https://www.nsnam.org/releases/ns-allinone-${release}.tar.bz2"
outfile="ns-${release}.tar.bz2"

echo "working in $DISTDIR"

if [ ! $(find . -maxdepth 1 -type d -name 'ns-3.3*') ]; then
    # download ns3 distribution only if not already there
    if [[ ! -f "$outfile" ]]; then
        curl -o "${outfile}" "${dl_link}";
    fi
    tar xf "${outfile}" -C . --strip-components 1 && rm "${outfile}"
fi
