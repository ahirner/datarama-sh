sudo apt-get install samba
sudo smbpasswd -a $USER
sudo cp /etc/samba/smb.conf ~
sudo nano /etc/samba/smb.conf
sudo service smbd restart
testparm

