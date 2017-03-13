#!/bin/bash

directory=${1:-"py3-ml"}

echo "Installing dev packages"
sudo apt-get install python3-pip python3-dev python-virtualenv

echo "Creating python3 virtual environment in $directory..."
virtualenv -p python3 --system-site-packages $directory

echo "change to virtualenv with: source $directory/bin/activate"
