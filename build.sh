#! /bin/bash

# build 3rdparty first
mkdir build
cd build
mkdir googletest
cd googletest
make -f ../../3rdparty/googletest/googletest/make/Makefile

# build my own code then



# back to root directory
cd ../..