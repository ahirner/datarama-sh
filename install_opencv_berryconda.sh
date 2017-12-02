#Other Prerequisites: https://www.pyimagesearch.com/2017/09/04/raspbian-stretch-install-opencv-3-python-on-your-raspberry-pi/

#Beware: no neon bug (https://github.com/opencv/opencv/pull/8900)

cmake -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.3.0/modules -DBUILD_opencv_aruco=ON --DBUILD_opencv_java=OFF -DWITH_FFMPEG=OFF -DWITH_VTK=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF  -DBUILD_opencv_ximgproc=OFF -DBUILD_opencv_xfeatures2d=OFF -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_opencv_python2=OFF -DBUILD_opencv_python3=ON -DCMAKE_INSTALL_PREFIX=$(python3 -c "import sys; print(sys.prefix)") -DPYTHON3_EXECUTABLE=$(which python3) -DPYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") ..
