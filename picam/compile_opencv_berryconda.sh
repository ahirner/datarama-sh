#Other Prerequisites: https://www.pyimagesearch.com/2017/09/04/raspbian-stretch-install-opencv-3-python-on-your-raspberry-pi/

#Beware: no neon bug (https://github.com/opencv/opencv/pull/8900)

sudo apt-get install build-essential cmake pkg-config
sudo apt-get install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev

mkdir build
cd build

cmake -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.3.0/modules -DBUILD_opencv_aruco=ON --DBUILD_opencv_java=OFF -DWITH_FFMPEG=OFF -DWITH_VTK=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF  -DBUILD_opencv_ximgproc=OFF -DBUILD_opencv_xfeatures2d=OFF -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_opencv_python2=OFF -DBUILD_opencv_python3=ON -DCMAKE_INSTALL_PREFIX=$(python3 -c "import sys; print(sys.prefix)") -DPYTHON3_EXECUTABLE=$(which python3) -DPYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") ..

#..resize swap
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start

#make -j4
#make install
#..reset swap
