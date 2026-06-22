#!/bin/bash
set -ex

cmake -S src -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_COMPLETION_PREFIX=share \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    $CMAKE_ARGS \
    -DHAVE_LIBSCOTCH:BOOL=ON

cmake --build build --parallel ${CPU_COUNT}

cmake --install build
