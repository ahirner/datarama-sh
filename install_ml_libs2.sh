#!/bin/bash

#Convenience

pip install theano
echo "[global]
device = gpu
floatX = float32" > ~/.theanorc

pip install keras
mkdir ~/.keras
echo '{
    "image_dim_ordering": "th",
    "epsilon": 1e-07,
    "floatx": "float32",
    "backend": "tensorflow"
}' > ~/.keras/keras.json

#Probabilistic
pip install git+https://github.com/pymc-devs/pymc3
pip install pystan
pip install edward
pip install pomegranate
