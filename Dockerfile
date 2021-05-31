# manylinux2010-pypy-based image for compiling Spatial Model Editor python wheels

FROM pypywheels/manylinux2010-pypy_x86_64:2021-05-18-1e72e6c
MAINTAINER Liam Keegan "liam@keegan.ch"

ARG BUILD_DIR=/opt/smelibs

# SME static libs
COPY --from=spatialmodeleditor/manylinux2010_x86_64:2021.05.31 $BUILD_DIR $BUILD_DIR
ENV CMAKE_PREFIX_PATH="$BUILD_DIR;$BUILD_DIR/lib64/cmake"
