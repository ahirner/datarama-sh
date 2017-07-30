#!/bin/bash

read -t 3 -n 1 -p "Install Cuda? (y/n)? " i_cuda
[ -z "$i_cuda" ] && i_cuda="n"
echo
read -t 3 -n 1 -p "Install cuDNN? (y/n)? " i_cuDNN
[ -z "$i_cuDNN" ] && i_cuDNN="n"
echo
read -t 3 -n 1 -p "Append CUDA environment variables to ~/.bashrc (y/n)? " i_bash
[ -z "$i_bash" ] && i_bash="y"
echo
if echo "$i_cuda" | grep -iq "^y" ;then
	echo "Installing Cuda 8.0"
	wget https://developer.nvidia.com/compute/cuda/8.0/prod/local_installers/cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64-deb
	sudo dpkg -i cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64-deb
	sudo apt-get update
	#sudo apt-get install -y cuda
	#rm cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64-deb
fi

if echo "$i_cuDNN" | grep -iq "^y" ;then
	echo "Installing cuDNN 5.1"
	wget http://developer.download.nvidia.com/compute/redist/cudnn/v5.1/cudnn-8.0-linux-x64-v5.1.tgz
	sudo tar -xzf cudnn-8.0-linux-x64-v5.1.tgz -C /usr/local
	#rm cudnn-8.0-linux-x64-v5.1.tgz

fi

if echo "$i_bash" | grep -iq "^y" ;then
	echo "Appending environment variables to ~/.bashrc"
	echo "export CUDA_HOME=/usr/local/cuda-8.0" >> ~/.bashrc
	echo "export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}" >> ~/.bashrc
	echo "export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc
	echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc

	source ~/.bashrc
	sudo ldconfig
fi

sudo apt-get install libcupti-dev
