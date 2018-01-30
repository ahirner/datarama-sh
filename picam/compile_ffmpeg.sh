#git clone https://github.com/FFmpeg/FFmpeg.git
#cd FFmpeg
sudo ./configure --arch=armel --target-os=linux --enable-gpl --enable-mmal --enable-omx --enable-omx-rpi
sudo make -j4
#sudo make install