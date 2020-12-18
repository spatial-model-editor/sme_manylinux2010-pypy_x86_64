# manylinux2010-pypy-based image for compiling Spatial Model Editor python wheels

FROM pypywheels/manylinux2010-pypy_x86_64:2020-12-11-f1e0e80
MAINTAINER Liam Keegan "liam@keegan.ch"

ARG BUILD_DIR=/opt/smelibs

# Install cmake
RUN /opt/python/cp38-cp38/bin/pip install \
        cmake \
    && ln -fs /opt/python/cp38-cp38/bin/cmake /usr/bin/cmake

# use dune-copasi fallback filesystem
ENV SME_DUNE_COPASI_USE_FALLBACK_FILESYSTEM="on"

# SME static libs
COPY --from=spatialmodeleditor/manylinux2010_x86_64:2020.12.18 $BUILD_DIR $BUILD_DIR
ENV CMAKE_PREFIX_PATH="$BUILD_DIR;$BUILD_DIR/lib64/cmake"
