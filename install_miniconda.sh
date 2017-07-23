wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh

./Miniconda3-latest-Linux-x86_64.sh
conda create --name fat-ml

echo "source activate fat-ml" >> .bashrc
source .bashrc

conda env update -f=./environment.yml

rm Miniconda3-latest-Linux-x86_64.sh
