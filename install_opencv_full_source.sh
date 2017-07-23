
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib

#Basic anaconda and python3 recipe:
#https://www.scivision.co/anaconda-python-opencv3/

cd opencv
mkdir -p release_contrib
cd release_contrib

cuda=ON

cmake -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -DBUILD_opencv_aruco=ON -DBUILD_TIFF=ON -DBUILD_opencv_java=OFF -DWITH_CUDA=$cuda -DENABLE_AVX=ON -DWITH_OPENGL=ON -DWITH_OPENCL=OFF -DWITH_IPP=ON -DWITH_TBB=ON -DWITH_EIGEN=ON -DWITH_V4L=ON -DWITH_FFMPEG=OFF -DWITH_VTK=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_opencv_python2=OFF -DCMAKE_INSTALL_PREFIX=$(python3 -c "import sys; print(sys.prefix)") -DPYTHON3_EXECUTABLE=$(which python3) -DPYTHON3_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") -DPYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") -DBUILD_opencv_ximgproc=OFF -DBUILD_opencv_xfeatures2d=OFF ..

make -j7
sudo make install
sudo ldconfig
