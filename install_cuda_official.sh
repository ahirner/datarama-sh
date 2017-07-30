wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
sudo sh cuda_8.0.61_375.26_linux-run

wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/patches/2/cuda_8.0.61.2_linux-run
sudo sh cuda_8.0.61.2_linux-run


nvidia-smi

read -t 3 -n 1 -p "Append CUDA environment variables to ~/.bashrc (y/n)? " i_bash
[ -z "$i_bash" ] && i_bash="y"
echo

if echo "$i_bash" | grep -iq "^y" ;then
	echo "Appending environment variables to ~/.bashrc"
	echo "export CUDA_HOME=/usr/local/cuda-8.0" >> ~/.bashrc
	echo "export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}" >> ~/.bashrc
	echo "export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc
	echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc

	source ~/.bashrc
fi

sudo apt-get install libcupti-dev


echo "Download and install cuDNN via NVIDIA developer program"
