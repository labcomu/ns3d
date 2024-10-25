PATH="/dist:$PATH"
# set env var for ns3 base path
DISTDIR=/dist
NS3DIR=${DISTDIR}/ns3
NS3LOGDIR=${HOME}/ns3/build/log
# utility env vars
NS3CONFIG="--enable-examples --enable-tests"
NS3DEBUG="--build-profile=debug --out=build/debug"
NS3OPT="--build-profile=optimized --out=build/optimized"
