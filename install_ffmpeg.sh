#wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz
wget https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-64bit-static.tar.xz
tar xvfJ ffmpeg-release-64bit-static.tar.xz
rm ffmpeg-release-64bit-static.tar.xz
mv ffmpeg* ~/ffmpeg_bin

echo "PATH=$PATH:$HOME/ffmpeg_bin" >> ~/.bashrc
source ~/.bashrc
ffmpeg -version
