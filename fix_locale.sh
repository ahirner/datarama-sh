#!/bin/bash
echo "Appending LC_ALL and LC_TYPE locale env variables to ~/.bashrc"
echo 'export LC_ALL="en_US.UTF-8"' >> ~/.bashrc
echo 'export LC_CTYPE="en_US.UTF-8"' >> ~/.bashrc
sudo dpkg-reconfigure locales
echo "Done. Restart bash or source ~/.bashrc"
