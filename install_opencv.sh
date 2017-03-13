#!/bin/bash

#Modified from https://github.com/milq/milq/blob/master/scripts/bash/install-opencv.sh
#Copyright (c) 2017 Manuel Ignacio López Quintero

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# INSTALL THE LIBRARY (YOU CAN CHANGE '3.2.0' FOR THE LAST STABLE VERSION)
sudo apt-get install -y unzip
wget https://github.com/opencv/opencv/archive/3.2.0.zip
unzip 3.2.0.zip
rm 3.2.0.zip
mv opencv-3.2.0 OpenCV
cd OpenCV
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON ..
make -j7
sudo make install
sudo ldconfig
