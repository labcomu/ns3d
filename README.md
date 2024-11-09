# ns3d 

Docker setup for [NS-3](https://www.nsnam.org/) development.

Based on the [NS3_EDC](https://github.com/labcomu/NS3_EDC) repository.

Current NS-3 version: 3.42.

## Required packages

1. Make
1. Docker Engine
1. Docker Compose
1. Visual Studio Code
1. Visual Studio Code Extension: Dev Containers

## Getting started

1. Install required packages
1. Run `make` to create and enter the `ns3` container.
    * If you already did it once, use `make it` to enter the container again.
1. Open on Visual Studio Code: _Dev Containers: Open Attached Container Configuration File..._ > _ns3_
    * Also available at `/home/$USER/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/imageConfigs/ns3.json`
1. Paste the following content:
```json
{
	"workspaceFolder": "/home/ubuntu",
	"remoteUser": "ubuntu"
}
```
1. Open on Visual Studio Code: _Dev Containers: Attach to Running Container..._ > _/ns3_

You are ready to develop and run NS-3 inside a Docker container.

Current 


## References

* [NS3_EDC](https://github.com/labcomu/NS3_EDC)
* [NS-3](https://github.com/nsnam)
* [ns3-box](https://github.com/adeelahmadk/ns3-box)


<!-- Scratch

# RUN useradd --create-home --shell /bin/bash user
# USER user

# ENV PATH="/dist:/dist/ns3:${PATH}" \
#     CCACHE_DIR=/tmp \
#     DISTDIR=/home/user \
#     NS3DIR=/home/user/ns3 \
#     NS3LOGDIR=/home/user/log \
#     NS3CONFIG="--enable-examples --enable-tests" \
#     NS3DEBUG="--build-profile=debug --out=build/debug" \
#     NS3OPT="--build-profile=optimized --out=build/optimized"

# COPY ns3-get.sh /tmp/
# RUN bash /tmp/ns3-get.sh

# COPY ns3-build.sh /tmp/
# RUN bash /tmp/ns3-build.sh

# COPY ns3-addon.sh /tmp/
# RUN bash /tmp/ns3-addon.sh

# COPY --chown=user:user res/ns3/ /home/user/ns3/

https://www.nsnam.org/docs/installation/singlehtml/index.html

bridge-utils
build-essential
bzip2
ccache
cmake
curl
dia
doxygen
dvipng
ebtables
g++
gettext
gir1.2-goocanvas-2.0
gir1.2-gtk-3.0
git
graphviz
gsl-bin
html-xml-utils
imagemagick
ipython3
latexmk
libgsl-dev
libgslcblas0
libopenmpi-dev
libxml2
libxml2-dev
linux-headers-generic
lxc-templates
lxc-utils
make
ninja-build
openmpi-bin
openmpi-common
openmpi-doc
python3
python3-dev
python3-gi
python3-gi-cairo
python3-pip
python3-pygraphviz
python3-setuptools
python3-sphinx
qt5-qmake
qtbase5-dev
qtbase5-dev-tools
qtchooser
tar
texlive
texlive-extra-utils
texlive-font-utils
texlive-latex-extra
uml-utilities
unrar
unzip
vtun

# update system and install
# - base system packages
# - NS-3 core dependencies
# - NS-3 python bindings

# sqlite sqlite3 libsqlite3-dev \

 \
    sphinx

-->