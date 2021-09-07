#!/bin/bash

GTEST_DIR=$SRC_DIR
GTEST_CXXFLAGS="-fPIC"

# Build and install static libraries
mkdir build_a
cd build_a
cmake -DCMAKE_CXX_FLAGS=${GTEST_CXXFLAGS} \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBUILD_SHARED_LIBS=OFF \
      -DCMAKE_INSTALL_LIBDIR=lib\
       $GTEST_DIR
make
make install
#cp sample
# echo "%%%%%%%%%%%%%%%%" $PREFIX/share/gtest
# mkdir -p $PREFIX/share/gtest
# cp -r ../googletest/samples $PREFIX/share/gtest/
# cp -r ../googletest/docs $PREFIX/share/gtest/
# cp    ../googletest/README.md $PREFIX/share/gtest/
# cd $PREFIX/share/gtest && touch aaa.xxx.txt
# xxx
cd $GTEST_DIR

# Build and install dynamic library
mkdir build_so
cd build_so
cmake -DCMAKE_CXX_FLAGS=${GTEST_CXXFLAGS} \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBUILD_SHARED_LIBS=ON \
      -DCMAKE_INSTALL_LIBDIR=lib \
      $GTEST_DIR
make
make install
#cp sample
# mkdir -p $PREFIX/share/gmock
# echo "%%%%%%%%%%%%%%%%" $PREFIX
# cp ../googlemock/README.md $PREFIX/share/gmock/
cd $GTEST_DIR
